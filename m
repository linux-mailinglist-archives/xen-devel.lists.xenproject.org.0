Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E98C5611
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 14:36:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721478.1124924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rOe-0006dq-2j; Tue, 14 May 2024 12:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721478.1124924; Tue, 14 May 2024 12:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rOd-0006bb-WE; Tue, 14 May 2024 12:36:44 +0000
Received: by outflank-mailman (input) for mailman id 721478;
 Tue, 14 May 2024 12:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p490=MR=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s6rOc-0006PE-4f
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 12:36:42 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c9b417b-11ee-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 14:36:40 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id 7D9628006E;
 Tue, 14 May 2024 13:36:39 +0100 (BST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9c9b417b-11ee-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715690199;
	bh=6qjycH+HuVrx/VRN8AxAfdr4wODMVUK2uSjIiZUnmfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zQlTODQgwUgxYP9Rz49UUlCKTW65m5DZOkJHiTVl0vcqWdWIXAlkZctXL3pUeSHrO
	 uxQ0o1AfW+vRUBW1hmpzvkACqSPJfiuKlT1UUQVamLR86ONaNEIfM39ue5GBNOmtPd
	 Gs+XKaliExgJXhV++s4R4I/kv73ThoZrKnz/AQbY=
MIME-Version: 1.0
Date: Tue, 14 May 2024 13:36:39 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] tools/xentop: fix cpu% sort order
In-Reply-To: <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
References: <20240514081344.4499-1-leigh@solinno.co.uk>
 <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
Message-ID: <d1fbc48ee89da3f4fe45a96161f9502e@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 2024-05-14 13:07, Andrew Cooper wrote:
> On 14/05/2024 9:13 am, Leigh Brown wrote:
>> Although using integer comparison to compare doubles kind of
>> works, it's annoying to see domains slightly out of order when
>> sorting by cpu%.
>> 
>> Add a compare_dbl() function and update compare_cpu_pct() to
>> call it.
>> 
>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>> ---
>>  tools/xentop/xentop.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>> 
>> diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
>> index 545bd5e96d..99199caec9 100644
>> --- a/tools/xentop/xentop.c
>> +++ b/tools/xentop/xentop.c
>> @@ -85,6 +85,7 @@ static void set_delay(const char *value);
>>  static void set_prompt(const char *new_prompt, void (*func)(const 
>> char *));
>>  static int handle_key(int);
>>  static int compare(unsigned long long, unsigned long long);
>> +static int compare_dbl(double, double);
>>  static int compare_domains(xenstat_domain **, xenstat_domain **);
>>  static unsigned long long tot_net_bytes( xenstat_domain *, int);
>>  static bool tot_vbd_reqs(xenstat_domain *, int, unsigned long long 
>> *);
>> @@ -422,6 +423,16 @@ static int compare(unsigned long long i1, 
>> unsigned long long i2)
>>  	return 0;
>>  }
>> 
>> +/* Compares two double precision numbers, returning -1,0,1 for <,=,> 
>> */
>> +static int compare_dbl(double d1, double d2)
>> +{
>> +	if(d1 < d2)
>> +		return -1;
>> +	if(d1 > d2)
>> +		return 1;
>> +	return 0;
>> +}
>> +
>>  /* Comparison function for use with qsort.  Compares two domains 
>> using the
>>   * current sort field. */
>>  static int compare_domains(xenstat_domain **domain1, xenstat_domain 
>> **domain2)
>> @@ -523,7 +534,7 @@ static double get_cpu_pct(xenstat_domain *domain)
>> 
>>  static int compare_cpu_pct(xenstat_domain *domain1, xenstat_domain 
>> *domain2)
>>  {
>> -	return -compare(get_cpu_pct(domain1), get_cpu_pct(domain2));
>> +	return -compare_dbl(get_cpu_pct(domain1), get_cpu_pct(domain2));
> 
> Oh, we were doing an implicit double->unsigned long long conversion. 
> Over the range 0.0 to 100.0, that ought to work as expected.  What kind
> of out-of-order are you seeing?

Without patch:

xentop - 13:29:01   Xen 4.18.2
13 domains: 1 running, 12 blocked, 0 paused, 0 crashed, 0 dying, 0 
shutdown
Mem: 67030640k total, 33097800k used, 33932840k free    CPUs: 24 @ 
3693MHz
       NAME  STATE   CPU(sec) CPU(%)     MEM(k) MEM(%)  MAXMEM(k) 
MAXMEM(%)
   icecream --b---       2597    6.6    4194368    6.3    4195328       
6.3
      xendd --b---       4016    5.4     524268    0.8     525312       
0.8
   Domain-0 -----r       1059    1.7    1048576    1.6    1048576       
1.6
       neon --b---        826    1.1    2097216    3.1    2098176       
3.1
    blender --b---        121    0.2    1048640    1.6    1049600       
1.6
      bread --b---         69    0.1     524352    0.8     525312       
0.8
        bob --b---        502    0.3   16777284   25.0   16778240      
25.0
     cheese --b---        225    0.5    1048384    1.6    1049600       
1.6
    cassini --b---        489    0.4    3145792    4.7    3146752       
4.7
   chickpea --b---         67    0.1     524352    0.8     525312       
0.8
     lentil --b---         67    0.1     262208    0.4     263168       
0.4
    fusilli --b---        159    0.2     524352    0.8     525312       
0.8
      pizza --b---        359    0.5     524352    0.8     525312       
0.8

With patch:

xentop - 13:30:17   Xen 4.18.2
13 domains: 1 running, 12 blocked, 0 paused, 0 crashed, 0 dying, 0 
shutdown
Mem: 67030640k total, 33097788k used, 33932852k free    CPUs: 24 @ 
3693MHz
       NAME  STATE   CPU(sec) CPU(%)     MEM(k) MEM(%)  MAXMEM(k) 
MAXMEM(%)
      xendd --b---       4020    5.7     524268    0.8     525312       
0.8
   icecream --b---       2600    3.8    4194368    6.3    4195328       
6.3
   Domain-0 -----r       1060    1.5    1048576    1.6    1048576       
1.6
       neon --b---        827    1.1    2097216    3.1    2098176       
3.1
     cheese --b---        225    0.7    1048384    1.6    1049600       
1.6
      pizza --b---        359    0.5     524352    0.8     525312       
0.8
    cassini --b---        490    0.4    3145792    4.7    3146752       
4.7
    fusilli --b---        159    0.2     524352    0.8     525312       
0.8
        bob --b---        502    0.2   16777284   25.0   16778240      
25.0
    blender --b---        121    0.2    1048640    1.6    1049600       
1.6
      bread --b---         69    0.1     524352    0.8     525312       
0.8
   chickpea --b---         67    0.1     524352    0.8     525312       
0.8
     lentil --b---         67    0.1     262208    0.4     263168       
0.4

> Nevertheless, this should comparison should clearly be done using
> doubles.  AFACT, get_cpu_pct() shouldn't ever return a NaN, so I think
> this simple form is fine.
> 
> Oleksii: This is another bugfix to xentop, and should be considered for
> 4.19 at this point.
> 
> ~Andrew

Regards,

Leigh.

