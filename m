Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB6D2F9B5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 11:33:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206391.1519995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgh82-0002dx-7N; Fri, 16 Jan 2026 10:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206391.1519995; Fri, 16 Jan 2026 10:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgh82-0002bV-4h; Fri, 16 Jan 2026 10:32:30 +0000
Received: by outflank-mailman (input) for mailman id 1206391;
 Fri, 16 Jan 2026 10:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7++=7V=bounce.vates.tech=bounce-md_30504962.696a13b9.v1-dc61bcb81ca541428aef09e9b6c10ee6@srs-se1.protection.inumbo.net>)
 id 1vgh80-0002bO-TB
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 10:32:29 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6bfe935-f2c6-11f0-b15e-2bf370ae4941;
 Fri, 16 Jan 2026 11:32:27 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dsx4T5BMZzBsVCKp
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 10:32:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dc61bcb81ca541428aef09e9b6c10ee6; Fri, 16 Jan 2026 10:32:25 +0000
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
X-Inumbo-ID: a6bfe935-f2c6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768559545; x=1768829545;
	bh=sToY2ZIn3wQPkHhsh7FyPZGR9xNobzoQklK0nB2Hxnk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FC6a5MsNrQHcAo5r4r8zKtMC7riDdgLLuSgI3OjFoDBxNtDp7r90j3GaHsz5quHmw
	 rtI5Oqkm1801OTJy3sbcKjqXTfLeyHu1EixsHQbQe16uC5ikO6mezC2ovRScmtGb9J
	 NsGbd76tDe/8+kRMR8/OoOANNM6g+2baCDdqJEeWLEEe9KOL4/Z4ZmnMOTmCmTvlfE
	 4H/TFCND9uRvH1qsB582Ag4lvNmXso1Cchey2fvbAh5x1KLJWSTFHqM+cZE31gUBrl
	 fXKwFxQuGQqYZQOlAj5vwha4+05l+VKW0MW4Kpwh4P/BUAvHAh/uAI5u7KQoy5qDCR
	 iXVFE3OpVaPDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768559545; x=1768820045; i=teddy.astie@vates.tech;
	bh=sToY2ZIn3wQPkHhsh7FyPZGR9xNobzoQklK0nB2Hxnk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zDiB1lKZfA8BSsIP9qZNYSLVmN8rJKqUAEAx43npyL1iUAYyRF3xFfBqLSUBw/KDi
	 gyWhLt+TZhB6JFeN9lk8EBDIhvvvy4bLXt7jNx9ZrplcIPNgkuEVt3vTBwFUT//AnT
	 BoU1UMxBYZWcyDk1HO2LmQY5QkHAMDbv3uhB9QZOKY7TaeD86dGBA9jcq0ZLox6Owu
	 2/SYOZbVaVHxMFhFr9CPpBpSevFvmNWrrVAQsY4f3laHlDLVDSMZmczfnkaFUG4xb9
	 SKUC2r551xD2O/CREIGJqPGW8qwdKj/cPs/gdV+wdRloIi8DMo/zPQ1Rxm9a/kO2Gy
	 T5/Z+ZFlPCMkw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=202/2]=20xenpm:=20Add=20get-intel-temp=20subcommand?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768559544976
Message-Id: <b0fc5eee-65fc-4bd6-8092-d21808d71d38@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <7dfa012b734f3c769da88f0f1c989d07b724bdaa.1768235932.git.teddy.astie@vates.tech> <7ae6ca6f93e81cb0b5a71db90913dc3f67e6b763.1768235932.git.teddy.astie@vates.tech> <664b6639-732d-4e43-8323-47333b0d8e4c@suse.com>
In-Reply-To: <664b6639-732d-4e43-8323-47333b0d8e4c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dc61bcb81ca541428aef09e9b6c10ee6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260116:md
Date: Fri, 16 Jan 2026 10:32:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 14/01/2026 =C3=A0 10:27, Jan Beulich a =C3=A9crit=C2=A0:
> On 12.01.2026 17:47, Teddy Astie wrote:
>> @@ -1354,6 +1358,115 @@ void enable_turbo_mode(int argc, char *argv[])
>>                   errno, strerror(errno));
>>   }
>>   
>> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package=
, int *temp)
>> +{
>> +    xc_resource_entry_t entries[] =3D {
>> +        { .idx =3D package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_=
STATUS },
>> +        { .idx =3D MSR_TEMPERATURE_TARGET },
>> +    };
>> +    struct xc_resource_op ops =3D {
>> +        .cpu =3D cpu,
>> +        .entries =3D entries,
>> +        .nr_entries =3D ARRAY_SIZE(entries),
>> +    };
>> +    int tjmax;
>> +
>> +    int ret =3D xc_resource_op(xch, 1, &ops);
>> +
>> +    switch ( ret )
>> +    {
>> +    case -1:
>> +        /* xc_resource_op returns -1 in out of memory scenarios */
>> +        return -ENOMEM;
> 
> Assuming xc_resource_op() is well-behaved in this regard, why not return =
errno
> here? Or yet better stick to -1, leaving it to the caller to consume errn=
o? And
> then ...
> 
>> +    case 0:
>> +        /* This CPU isn't online or can't query this MSR */
>> +        return -ENODATA;
> 
> ... set errno here and return -1? With this normalized here, ...
> 
>> +    case 1:
>> +    {
>> +        /*
>> +         * The CPU doesn't support MSR_TEMPERATURE_TARGET, we assume it=
's 100
>> +         * which is correct aside a few selected Atom CPUs. Check Linux
>> +         * kernel's coretemp.c for more information.
>> +         */
>> +        static bool has_reported_once =3D false;
>> +
>> +        if ( !has_reported_once )
>> +        {
>> +            fprintf(stderr, "MSR_TEMPERATURE_TARGET is not supported, a=
ssume "
>> +                            "tjmax =3D 100, readings may be incorrect.\=
n");
>> +            has_reported_once =3D true;
>> +        }
>> +
>> +        tjmax =3D 100;
>> +        break;
>> +    }
>> +
>> +    case 2:
>> +        tjmax =3D (entries[1].val >> 16) & 0xff;
>> +        break;
>> +
>> +    default:
>> +        if ( ret > 0 )
>> +        {
>> +            fprintf(stderr, "Got unexpected xc_resource_op return value=
: %d",
>> +                    ret);
>> +            return -EINVAL;
>> +        }
>> +        return ret;
>> +    }
>> +
>> +    *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
>> +    return 0;
>> +}
>> +
>> +static void get_intel_temp(int argc, char *argv[])
>> +{
>> +    int temp =3D -1, cpu =3D -1;
>> +    unsigned int socket;
>> +    bool has_data =3D false;
>> +
>> +    if ( argc > 0 )
>> +        parse_cpuid(argv[0], &cpu);
>> +
>> +    if ( cpu !=3D -1 )
>> +    {
>> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
>> +            printf("CPU%d: %d=C2=B0C\n", cpu, temp);
>> +        else
>> +            printf("No data\n");
> 
> ... you can then use perror() here (and perhaps elsewhere). Right now the
> distinct non-zero return values of fetch_dts_temp() are of no interest to
> any of the callers.
> 
> Jan
> 

I did some changes in that regard, and unified the code style for the 
socket and core parts.

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index d20a213c71..de490b6507 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -1377,11 +1377,13 @@ static int fetch_dts_temp(xc_interface *xch, 
uint32_t cpu, bool package, int *te
      {
      case -1:
          /* xc_resource_op returns -1 in out of memory scenarios */
-        return -ENOMEM;
+        errno =3D -ENOMEM;
+        return -1;

      case 0:
          /* This CPU isn't online or can't query this MSR */
-        return -ENODATA;
+        errno =3D -ENODATA;
+        return -1;

      case 1:
      {
@@ -1410,11 +1412,12 @@ static int fetch_dts_temp(xc_interface *xch, 
uint32_t cpu, bool package, int *te
      default:
          if ( ret > 0 )
          {
-            fprintf(stderr, "Got unexpected xc_resource_op return 
value: %d",
-                    ret);
-            return -EINVAL;
+            fprintf(stderr, "Got unexpected xc_resource_op return 
value: %d", ret);
+            errno =3D -EINVAL;
          }
-        return ret;
+        else
+            errno =3D ret;
+        return -1;
      }

      *temp =3D tjmax - ((entries[0].val >> 16) & 0xff);
@@ -1435,7 +1438,11 @@ static void get_intel_temp(int argc, char *argv[])
          if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
              printf("CPU%d: %d=C2=B0C\n", cpu, temp);
          else
+        {
+            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
+                    errno, strerror(errno));
              printf("No data\n");
+        }
          return;
      }

@@ -1443,11 +1450,16 @@ static void get_intel_temp(int argc, char *argv[])
      for ( socket =3D 0, cpu =3D 0; cpu < max_cpu_nr;
            socket++, cpu +=3D physinfo.cores_per_socket * 
physinfo.threads_per_core )
      {
-        if ( !fetch_dts_temp(xc_handle, cpu, true, &temp) )
+        if ( fetch_dts_temp(xc_handle, cpu, true, &temp) )
          {
-            has_data =3D true;
-            printf("Package%u: %d=C2=B0C\n", socket, temp);
+            fprintf(stderr,
+                    "[Package%u] Unable to fetch temperature (%d - %s)\n",
+                    cpu, errno, strerror(errno));
+            continue;
          }
+
+        has_data =3D true;
+        printf("Package%u: %d=C2=B0C\n", socket, temp);
      }

      if ( has_data )
@@ -1457,7 +1469,11 @@ static void get_intel_temp(int argc, char *argv[])
      for ( cpu =3D 0; cpu < max_cpu_nr; cpu +=3D physinfo.threads_per_core=
 )
      {
          if ( fetch_dts_temp(xc_handle, cpu, false, &temp) )
+        {
+            fprintf(stderr, "[CPU%d] Unable to fetch temperature (%d - 
%s)\n",
+                    cpu, errno, strerror(errno));
              continue;
+        }

          has_data =3D true;
          printf("CPU%d: %d=C2=B0C\n", cpu, temp);

It can be quite verbose on the stderr side, but at least report errors.


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



