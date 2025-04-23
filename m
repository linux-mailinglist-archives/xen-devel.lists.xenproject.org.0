Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEBA9987C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 21:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965201.1355832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7fl9-000384-EJ; Wed, 23 Apr 2025 19:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965201.1355832; Wed, 23 Apr 2025 19:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7fl9-00036U-BK; Wed, 23 Apr 2025 19:27:51 +0000
Received: by outflank-mailman (input) for mailman id 965201;
 Wed, 23 Apr 2025 19:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbtc=XJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7fl6-00036O-Vp
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 19:27:49 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f403:240a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 082e0f8b-2079-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 21:27:46 +0200 (CEST)
Received: from BN9PR03CA0369.namprd03.prod.outlook.com (2603:10b6:408:f7::14)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 19:27:41 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::f) by BN9PR03CA0369.outlook.office365.com
 (2603:10b6:408:f7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 19:27:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 19:27:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 14:27:40 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 14:27:39 -0500
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
X-Inumbo-ID: 082e0f8b-2079-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfv2vy26Yi7aQAzF/StAoa2fq8XAPpdPAnErRPGmu2OmlLuTZCeXMsOLGBN8tD1GE+d6EHNvpT2Jx7R4DjTZFfQ2WTK7cUZQmFAHno8WjmTv0BELddSkU4bJCUtKo0/XYTYHQ3aD7lCdqeC9DPEHUTz/Yhu89gQ1AtyN6xNvs/tm2LP6X/J1Unco43OJW7opcbzPfcbSwfO8t0EUvQnDnUajO9XVTwv/mJi+csWN7PaOGHa3XO9DV1HpU+QI5AWATKTTiqBtYzLxbUOQxNhOt/hloLsPXrten191b3rfpq0RGFpg1GUsjcQDRY/j1h+tAVfC+8oUhUafgG9o6SEo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2W4J4D8HsKOPooVSRyj7XBe9kp+a21z5TwmB52urL8=;
 b=agILp/Y4bQuhrA63c0yqnW0Fqili8U3hOgZnPskdn+N8kBWlrkbcFaDWk2enrUIYKlYJUVunrb3njwpCVxK9kWdI/U6oWR7lnWhufrNxNzAWPBXgb3ignPHzjx41vFmlQO9ARIYE8bjR1fxYjVst7J5lYJ/2/9xLpYRGAgO/r7IKFna+Vmlbr3hnKnlCm+/aoqEgae+ed/4qittmZRanf7JryBHG2JxxW6HoX9CMcKTSJANuA8aWzLJP6ZFV6Io/kygUaucpXt4UERhxvwjbYTbRARdEwL3feUbPJzdW4Vm+/1WTgWs+BxROeSpi9fkcHZUNGooWIa09IMj6kkNukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2W4J4D8HsKOPooVSRyj7XBe9kp+a21z5TwmB52urL8=;
 b=YR2aJV4uWVz5jMAODZcjYwciocT29+xZjPui2dE6dE8RerIU01B8daQhJA5agSrON8jPPKmCligivOAo+gnRrQYBIfvb1mleqiNYTh3YgvMMKoTDVEfvTIKhtDjMJNql/8Wc9ZiyD1EjPZI11XQ5ERv40QV54G7ChOZEC/m/huM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bba25fca-171a-47dd-881b-4746d76bd16a@amd.com>
Date: Wed, 23 Apr 2025 15:27:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 33/38] x86/boot: refactor bzimage parser to be re-enterant
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <agarciav@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-34-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250419220820.4234-34-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7b5765-54dd-40b9-f0dc-08dd829cea0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJNYXB6NWpqSVA4ekliSDdXclQ1SHJLekluYzB0VGZtWVdhQ1Jvb0d2cHU4?=
 =?utf-8?B?akJ6eWtrQWhHYVBGT2tKNnVaL0dPa3NlUWNUM2xTc3RFZ1pQT2tRaTU4WFFp?=
 =?utf-8?B?bnFsS1UvME9jamdsbVR5cDB5NTVrZzZaVUErN2hQUDY0bitzU3YwbXgwZXpr?=
 =?utf-8?B?bHNuMno3dmU1aFROSXVENktqQkZDbW5LajZ5c2wxNFE1MGl4RHp1WkxBazVS?=
 =?utf-8?B?WWNPekx1aWNyMzZ3OGJ4OWNWZnF1aGFhd3duTldGbjB6dWxHcCt6NzBRU25W?=
 =?utf-8?B?SzVwSGY4TFdkR0p6U2FMYU9JRHIzaXBxYjRjSjc0VDdkejZLaHlJam10TTdN?=
 =?utf-8?B?Tzk2Tk8wTmlRaWFlS2VCeWg1c1VnVlJKK1RqWkxZMEIweGdPdGUrMUo0Tlp1?=
 =?utf-8?B?Z1lTWHY4ZXZDcEgzVnd4SFBuN3dZS1pURktJMjZxMjh1QkJlN1Rxdi9DbzlN?=
 =?utf-8?B?U2NrdVpYenQxSUcyTTVUUEdpdHp3SWc1cExMWEdvaTczVGNUQzY3VW5NOGdS?=
 =?utf-8?B?YkRRR2JhcnY5MlpuVUs2QmhsS1pocUJRWFIveFR4VEFtNW5zWDU4OFd2UlAv?=
 =?utf-8?B?aVEzblBLWjQxOEtJbkhSTlp3UmRnaTAvODNBVU8rVTVlSS9qTWs4SGw0QmFn?=
 =?utf-8?B?c2xtODBmaW9hd0poOXBiMW54V1Y0RVpKeWFRdnlaaEdrOHoxdGZWN0VEOVlj?=
 =?utf-8?B?ZmdPKzFTYmxVaG5MY0Y3SzV5QURjd29NMnVlNFJ6TWd5QmxtTHcweGhzSlVS?=
 =?utf-8?B?NzQ1anRRdHpmek9OUG4xckdEWmlMNnltV3F1dWxBYmMxZEFvZkF3Ylo4M0R5?=
 =?utf-8?B?c2dTdWl6djBOeFd1Yk80N1lJTk9EM0J4eExFdVhKc3Rzem9yZ0NHbEdYbnB0?=
 =?utf-8?B?RFdROTFBV2wvR1BONkQ2WE9CYUZaTlRINEZ2R3dZbHRyaXFQbUlrK2dnUEh0?=
 =?utf-8?B?ZUZhbVlUVnFLRFdCQUcvR3ZhZUtxYm5ETU1iVmNJRk1HeTl3eW5Yd2kveTVu?=
 =?utf-8?B?UlBiemg1VVJWSzBNWERuRU4xcVJ3elFwK2Z0cTZpdUhMdGFsRGdNOWZGMU5I?=
 =?utf-8?B?dUdSZlllU1FFdTNyVjhLMkVkTXFxSENrNVR1cSt1Tmx2UjlEcVI4d1luanlX?=
 =?utf-8?B?UTh0VWh5bWsrclNEM0hGYTNMS3ZMbHhvc0h1R3J6VExueDhzbnpYdlJLb3Ex?=
 =?utf-8?B?d0VOUjFMaFUyK2Y4V3c2RHRtZGpVNmZveHcxQ2tYOURKVWQzYWNHdXhtRzdW?=
 =?utf-8?B?aDFkUXM0aU8ydXZiRTU1bElvM3dXRk12anRMZUpDRzc5NkU5bWRYem4weWpS?=
 =?utf-8?B?Sm9LN21GVUQ1RXAzSExBbjJvNlBGa0FwUStmMmdWNkhvMmtVdmU4TndoekdX?=
 =?utf-8?B?MS80ZDFFakdaTmdsaWNmbnUwTlFSOHB1NlEvdkdCZjNhL3lNNFRVa20zTEIx?=
 =?utf-8?B?Zi9mMnhSckVQUGV3NVhZQjM0OVhBbUpUK3FWZ09ZOGFPMDkvSDdTSUFhdnJ5?=
 =?utf-8?B?eFpGVHI3MW0zK0EvSzkxVHR6ampnbkJtb1dWbWxKelNud1RjY3JLNkdwVG1G?=
 =?utf-8?B?RHA1YnBpdFgrcnJCWUVvcVd6TXJ6a0t4RC9CSzBCd0tqbkQ3b0RwcXJBZ2F3?=
 =?utf-8?B?R3I1Mi9SZVErQXN6NDA4Wnkybll3Qjc0MUcwMjQzVlRJWXd6djJZenZZdjZM?=
 =?utf-8?B?OVBIQ0ZSd0lRWlJoaTdyWmNvSXZxUFdGOW11QlJXb0RoR1JVV0JOV1Vqa0Jo?=
 =?utf-8?B?RlRQZGJKejVFRFZoRkJHa2dRZS9ielpSWno5NW1lZ1NvTXAvY0RpbU1VeEtv?=
 =?utf-8?B?TFZ5ekdZdDFFZ3ZWRmRTdHVHZnU1cmdGOVd1VXVML2xJWWc4aUZFTmFON1Ro?=
 =?utf-8?B?YTV5d1dYRWNNVEovb3pYajllZlZtL0pZaE8vWnBaaS8yYzY4ZnFWVTJFTnR4?=
 =?utf-8?B?bHRDRVc3TGZRQXlwR3pINU93OWQyTndZRnB1b1FETGl1eGtIRlJwUUFQM0FI?=
 =?utf-8?B?STZHRU1DZFNnVTVaU096K2wwRlZYby82Z0ZEZjNLL2kxcVBTd0l3ekNEMHJK?=
 =?utf-8?Q?H7sIX8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 19:27:40.9328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7b5765-54dd-40b9-f0dc-08dd829cea0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308

On 2025-04-19 18:08, Daniel P. Smith wrote:
> The bzimage logic uses the unit global orig_image_len to hold the original
> module length for the kernel when the headroom is calculated. It then uses
> orig_image_len to locate the start of the bzimage when the expansion is done.
> This is an issue when more than one bzimage is processed by the headroom
> calculation logic, as it will leave orig_image_len set to the length of the
> last bzimage it processed.
> 
> The boot module work introduced storing the headroom size on a per module
> basis. By passing in the headroom from the boot module, orig_image_len is no
> longer needed to locate the beginning of the bzimage after the allocated
> headroom. The bzimage functions are reworked as such, allowing the removal of
> orig_image_len and enabling them to be reused by multiple kernel boot modules.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/bzimage.c             | 38 ++++++++++++++++++------------
>   xen/arch/x86/hvm/dom_build.c       |  3 ++-
>   xen/arch/x86/include/asm/bzimage.h |  5 ++--
>   xen/arch/x86/pv/dom0_build.c       |  3 ++-
>   4 files changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
> index 66f648f311e4..32f0360d25b4 100644

> @@ -103,13 +100,20 @@ unsigned long __init bzimage_headroom(void *image_start,
>       return headroom;
>   }
>   
> -int __init bzimage_parse(void *image_base, void **image_start,
> -                         unsigned long *image_len)
> +int __init bzimage_parse(
> +    void *image_base, void **image_start, unsigned long headroom,
> +    unsigned long *image_len)
>   {
>       struct setup_header *hdr = (struct setup_header *)(*image_start);
>       int err = bzimage_check(hdr, *image_len);
> -    unsigned long output_len;
> -
> +    unsigned long module_len = *image_len;
> +
> +    /*
> +     * Variable err will have one of three values:
> +     *   -  < 0: a error occurred trying to inspect the contents
> +     *   -  > 0: the image is a bzImage
> +     *   - == 0: not a bzImage, could be raw elf or elf.gz (vmlinuz.gz)
> +     */

This comment seems a little independent of this change, so maybe it 
should be submitted separately.  Also, I think a better placement would 
be next to bzimage_check().

>       if ( err < 0 )
>           return err;
>   
> @@ -118,21 +122,25 @@ int __init bzimage_parse(void *image_base, void **image_start,
>           *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
>           *image_len = hdr->payload_length;

@here

>       }
> -
> -    if ( elf_is_elfbinary(*image_start, *image_len) )
> -        return 0;
> +    else
> +    {
> +        if ( elf_is_elfbinary(*image_start, *image_len) )
> +            return 0;
> +        else
> +            *image_len = *image_len - headroom;
> +    }

I don't like this extra indention which includes the return.  If you 
retain orig_image_len as a local variable, and set it above at "@here", 
you can have a smaller diff and leave cleaner logic.

orig_image_len previously was set as a static variable, so the correct
value was set after bzimage_headroom.  Now that it is no longer static,
we need to grab the hdr->payload_length value when we have a bzImage.
Otherwise output_length will read past the end of the module.

Below is the diff for bzimage.c with the change I suggest.

Regards,
Jason

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index ac4fd428be..775a8b45ff 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -69,8 +69,6 @@ static __init int bzimage_check(struct setup_header 
*hdr, unsigned long len)
      return 1;
  }

-static unsigned long __initdata orig_image_len;
-
  unsigned long __init bzimage_headroom(void *image_start,
                                        unsigned long image_length)
  {
@@ -91,7 +89,6 @@ unsigned long __init bzimage_headroom(void *image_start,
      if ( elf_is_elfbinary(image_start, image_length) )
          return 0;

-    orig_image_len = image_length;
      headroom = output_length(image_start, image_length);
      if (gzip_check(image_start, image_length))
      {
@@ -104,12 +101,15 @@ unsigned long __init bzimage_headroom(void 
*image_start,
      return headroom;
  }

-int __init bzimage_parse(void *image_base, void **image_start,
-                         unsigned long *image_len)
+int __init bzimage_parse(
+    void *image_base, void **image_start, unsigned long headroom,
+    unsigned long *image_len)
  {
      struct setup_header *hdr = (struct setup_header *)(*image_start);
      int err = bzimage_check(hdr, *image_len);
-    unsigned long output_len;
+    unsigned long output_len, orig_image_len;
+
+    orig_image_len = *image_len - headroom;

      if ( err < 0 )
          return err;
@@ -118,6 +118,7 @@ int __init bzimage_parse(void *image_base, void 
**image_start,
      {
          *image_start += (hdr->setup_sects + 1) * 512 + 
hdr->payload_offset;
          *image_len = hdr->payload_length;
+        orig_image_len = hdr->payload_length;
      }

      if ( elf_is_elfbinary(*image_start, *image_len) )


