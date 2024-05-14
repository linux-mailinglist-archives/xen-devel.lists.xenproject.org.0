Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E978C56B0
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721506.1124975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ryG-0007oL-Qu; Tue, 14 May 2024 13:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721506.1124975; Tue, 14 May 2024 13:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ryG-0007mo-Nu; Tue, 14 May 2024 13:13:32 +0000
Received: by outflank-mailman (input) for mailman id 721506;
 Tue, 14 May 2024 13:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p490=MR=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s6ryE-0007me-RI
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:13:30 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c166362f-11f3-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 15:13:29 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id AF27E8006E;
 Tue, 14 May 2024 14:13:28 +0100 (BST)
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
X-Inumbo-ID: c166362f-11f3-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715692408;
	bh=PW7VzRkT3sECDlfBsJvN32ftKyvfnGRz/kyS0PGx+zU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c2OT/ZW4fM3eACUpQqeH9D2lhZiwCSGPMSBNFHP4WFYpA0cHDpxVd5nTp9sWfLlDm
	 q3NEOnL9D3MVbA/OEMzoATfz2iHQxHglp/EUD9vnP0vEvhpqNgUyWA/yuCFT4b90r0
	 NfkQdffVvbf6PI1Y1Nmz1LVioXDCu/ATG+nKb/Jw=
MIME-Version: 1.0
Date: Tue, 14 May 2024 14:13:28 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] tools/xentop: fix cpu% sort order
In-Reply-To: <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
References: <20240514081344.4499-1-leigh@solinno.co.uk>
 <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
Message-ID: <38bce1599deae1b77f2d55afaa765744@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

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
> 
> Nevertheless, this should comparison should clearly be done using
> doubles.  AFACT, get_cpu_pct() shouldn't ever return a NaN, so I think
> this simple form is fine.
> 
> Oleksii: This is another bugfix to xentop, and should be considered for
> 4.19 at this point.
> 
> ~Andrew

Perhaps I overthought it, and this approach might be better:

--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -523,7 +523,8 @@ static double get_cpu_pct(xenstat_domain *domain)

  static int compare_cpu_pct(xenstat_domain *domain1, xenstat_domain 
*domain2)
  {
-       return -compare(get_cpu_pct(domain1), get_cpu_pct(domain2));
+       return -compare(get_cpu_pct(domain1) * 100.0,
+                       get_cpu_pct(domain2) * 100.0);
  }

  /* Prints cpu percentage statistic */

