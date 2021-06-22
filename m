Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C25F3B0CD9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146052.268673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl5K-0006o3-M6; Tue, 22 Jun 2021 18:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146052.268673; Tue, 22 Jun 2021 18:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvl5K-0006l6-Ha; Tue, 22 Jun 2021 18:25:18 +0000
Received: by outflank-mailman (input) for mailman id 146052;
 Tue, 22 Jun 2021 18:25:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZL//=LQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lvl5J-0006l0-3t
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:25:17 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72b3a7ab-c484-40c5-887e-88548c7a3b25;
 Tue, 22 Jun 2021 18:25:16 +0000 (UTC)
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
X-Inumbo-ID: 72b3a7ab-c484-40c5-887e-88548c7a3b25
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624386316;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CFmUwofobeFCB6oZ+ZkeDOZmYg/dJAqTPKpkqU/4bP0=;
  b=GBECJmWIL01v6kbmvpmYjsCuEErsO7l0tJbFGbS86ND8eLit/ulbExA1
   2hGGNdMGLE08QsCvP9kHziumEdvcC5GwkXeBpT1znojXm5ZVOINhGGfBv
   670d4tu4Dlwq2Yd2iQ6bTLE+WVvosab0d/+gu7w7YN6WRqsbxQPCDyt06
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +vfNiQdSGaQ0iF1hQ7IEE540KZfodB5JffXvyUtqOm0Qs4Q6xjATh4oQcK7kTlEcVZbmQifg22
 Bt3WcXUON8w3IkwjBvMOFkPHgwwzx1tYXfBbl4WvEc/ky9fLdoOS90S9H+aTa7AlSKMFtewGIt
 4bRruGrAI/JsxAtODDHKcVOUVdXFFJqtljaV4ecGTgt0ccv5CBzTL3uLOCx8x126hO0UW/emdf
 fllMp+mWcq1NR9cLi11wtGN6/814DEujU8lPzwvMsMx7jRUu0bKuBBDq09KtIHQfQc+dmgc5MJ
 yoE=
X-SBRS: 5.1
X-MesageID: 46703587
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wzRrs6EDj+VEl3UTpLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HmBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh5dgPO
 JbAtVD4b7LfCpHZKTBkXGF+r8bqbHtms3Y5pa9vgNQpENRGsddBm9Ce3Wm+yZNNWx77PQCZf
 6hD4Z81kCdkSN9VLXKOpBJZZmMm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTij9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZgA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MdkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/j5iuLMlGfhsRLEkjQVo+M9qJlOi1GlnKp
 gsMCjk3ocTTbvABEqp5lWGqbeXLwEO9hTveDlOhiXa6UkMoJjVp3FojPD3pU1wgq7VfaM0rd
 gsAp4Y442mcfVmJJ6VJN1xDfdfWVa9Di4lDgqpUB/a/fY8SgPwQtjMke8I2N0=
X-IronPort-AV: E=Sophos;i="5.83,292,1616472000"; 
   d="scan'208";a="46703587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n68M7+pgQDdTGU6dGuzoLLKNSmkLYwDeGxKwdbcK4UeJEz4KoUMCvvFUILjVr38IGEtAr8WIl8UW2a6MJzaZ80t++tZVRlWhz8/QyPD3N4p2mVHFDcoTHv7DRbmUEEFzXPaAXEB5McOzHnWAETuLJQVb97cYE3OvW4GOKXR8RN2gAuKG3t0B8CCXGSCLOXK19hd4h5BlhsCeOPRWM1mIGVrvCwvSeMKYEuxyjogG5ZeY6UW7FE2tlHVn2I0jJGmXu5xZ/Z31fRO7MH6WegZbqDFOSI54VGOzAqjK5ZdCp5qHktE4YWO1o6iy4LH4F1w4yAGZ5wObXDGQyy6lwAARMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFmUwofobeFCB6oZ+ZkeDOZmYg/dJAqTPKpkqU/4bP0=;
 b=YRSQ5Ph9NLehgopFSopEjjVGPWCEOuC1pmdbHa4axQitp6NKDIv8iGrXVqXpQvgJcft+DP9ZGItNxIcG1vLPm+ebCUnaQqGIDDRtgmiNoO8xsaogrunUEVHAVjozjS4Q+/EZFCZ+HDeEbLgSaVfIESmBr6VuoSaW031u9RHqR3eFqSmNgZk9f6+3dPA9ewgSd8pT3B0aO70bKuemsbz9/RLIf42Q19scJUQarTHKB/nhTGsOq4eMzCT9yuJHr0ImqYUSG5s00/dImR/4qonLCS/4jHiPOdvAErPsgNfnC0HcW5uAvRMrXBbBIoO2WXLMjh1xIG0sLHYMnoX+cUkUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFmUwofobeFCB6oZ+ZkeDOZmYg/dJAqTPKpkqU/4bP0=;
 b=pPZ287j1nuHmxfGjXRABsr1rQTqVVJtkEO/vmAo9JiDuaZhOZmf1BWW15AgiuhzqMJZYtPbaH6Zz5F02xxR42Jy38ERJteOCXOXOhVcIVKdU18O2+I/ecIC29kdDghkBG/6w5oZxxNqbauOLI8RHirHs3CKUSdyT1nbjqv0lQBs=
Subject: Re: [PATCH v2 5/6] libxencall: drop bogus mentioning of xencall6()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
 <1792bdfc-7510-6628-e63c-aee2c7d2cab5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <25fa82fd-957a-d378-9761-070006d083ae@citrix.com>
Date: Tue, 22 Jun 2021 19:25:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1792bdfc-7510-6628-e63c-aee2c7d2cab5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0414.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff1d846e-8b3f-42c5-3922-08d935ab12fc
X-MS-TrafficTypeDiagnostic: BYAPR03MB4806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB48064A8398567BDDDBA5A489BA099@BYAPR03MB4806.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GyKXOQsE7+p5WoBZj4wVAgDONvx8Sphu6+X/EdHPpEisQPawvXXhiLNlWX5DVqIQ4MEMqdE6Ilcctb/pGIy2kgrFMMtkslbqfuSwfB9qSz3QCMbhw+t9NHBXGxDqOp8x1S822ms2iU+KQ0pPoKPnx4uxT8GozZuEA3n0dTR3UnZUWo7yAEawzDQmKXImU2o7C2BXLIbiTJ1X7Y8eLfRen0EHO0982CiyevZEc0s9nx6/fshbm/NyXxUHhn3KcC6NPSr/gnYjdKIg7mzDKPf1ZF4rgu9nHrD7Tv/74Um2W0QfCL/yHJowKwef9cfvdoX4PgvLVbyRRkLWAOVmM9EkwMTOiq9/y5/+6t1roFzPnsZZJpjA8tzEBe1cpKkf8pgpyFqoWKLXiLSEdf7f51PGDFjvb+D4JzoY8h+bau/RqH4PL9k5Sh0iu8wDtD9c9l3nCDSjjadkBvkJGIQ5F8ep7s/j8CqywQyRTvA7AFk/mP1yVlh3/NRA0zl2ILkpn/xqke5rFpuSxZlTFa9tx4HcwOlMnqIKZuWKfnH9s7ToBjj41Q4RRWWqS1aKlLhYs/poUqXfijwhycpQRIZKbEfKXN+4XZQMt8aIxnCryyUauzoDJ3OW5lr/+ytdQCFuz2s+unvdoACt7CjEuugm+Hqbl6FK61yrFfVJIubs8b6p4ozgFCTR7q38ZDyVhuwZsd2h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(6666004)(6486002)(38100700002)(956004)(2906002)(2616005)(36756003)(8676002)(478600001)(16526019)(66476007)(66946007)(110136005)(53546011)(66556008)(26005)(5660300002)(8936002)(186003)(4744005)(16576012)(316002)(54906003)(4326008)(31686004)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWVyWGdrNjFvODNCY0c4eXhYYlpYM0Yxc1gyMXZDL0NHcjMvcURmNFdjZko0?=
 =?utf-8?B?bUg2WitpdzN0cnVzOGF5a0JOU3hxMG9xaEJyb2VtNlUvV2ZwZ1V4NUlaM0hp?=
 =?utf-8?B?RDJLQjlWbjBwR05sNWlxMVlaZHB1MmUrQU9OaUhLUjhwWGFJNXZja0MzZS9F?=
 =?utf-8?B?clJTSk5BOTFqdFFZTHRPTHoyVVpKdGZWZ0d0c1plb1FUOVlJZzZlNHd2NmNh?=
 =?utf-8?B?LytIcHlmWktqa2RUYjJ0eXgxOUJpNGdjZ3NtRVFtWGJFQUJwT29XMSt1Rk5w?=
 =?utf-8?B?aTNjd04zRnAzOEdFYjh1UUV5Yk85MUlvWFNGanpLQ1d0OFFtbkU3a0R1VWJD?=
 =?utf-8?B?cDIwNFdpOXYzaDdDQm84ODgwdU9TeElUOFdEZ3M4RTFqS0pvcWNoRUZWZUlu?=
 =?utf-8?B?UkpqUldENm1qODBQZnI4Q0ZXUmR6aE13T1h4UzhOMGkwY09xdjVTVkJVY05n?=
 =?utf-8?B?d01VaEJITjNBblZuN1kwTFJleWp0TjQySjdJYkRHclZxS01VOVMydE1JQzBL?=
 =?utf-8?B?OG90UWZqS0lGU2pVc0orRDMySFhiU3V1dWlGdXJrdWpZQjVSbDlLTnVGbllz?=
 =?utf-8?B?KzhjYjR5SXpXZXlQV2ROaEVxYmZjcElyVEJWOVZBTXhER1FtcEpiRmM2QTFG?=
 =?utf-8?B?V0J4MXB4S21icElJTnlOMFNWTnZWMFRWbEFhV0Y1TDYyYXlRR1crb2xjZ0hC?=
 =?utf-8?B?aTdENXZBQ0pTQnMxek5LeHFDTWJnZW1ZVGtpRXoxbW1FVUFTUG54MTdRYWJZ?=
 =?utf-8?B?aDJEUU1qNlpXYlJGRlFwTnV2UmlEK3dNaHhiMXlKNlVUTGdvRHVKQlFuL1Bv?=
 =?utf-8?B?bGlSbWZVcFlJWGJGZmpRdms2OTRlektWdnZlYTJjbGVCRVBpY2dES0I4TDBY?=
 =?utf-8?B?NVBROFlIUmVNY2xYM2tRWWhQWEU2VFFpSkgvc1I2QzVlSk44R3VxcllQSlhp?=
 =?utf-8?B?UlNObUl2Yzdla0VxQUZHc29RYVJWUUxqWWFRSnR0NkFLenZhOHVxQisxOEh1?=
 =?utf-8?B?VXdwaktOdm5XL0dIVDkrdW1mRm1QaWJYbElsUEswbGkrc1VxVXFEVURpQkpv?=
 =?utf-8?B?eWl4Mk9lc1dXRkQwNi9QNmVEOXhId25tZDArUGxwbGZJa2tMUWRjWUNrRXhM?=
 =?utf-8?B?NVl1R1k4VUdQV2VNdVJxYU9CNHhGSXE2Q3F4dXluZzVWUWR5MDllQmMxckdk?=
 =?utf-8?B?T2NETlY4V09TWC90N1ZTdnhhMU5jMG1uK2RYaHc3VmdJbTNpSDlLUVR4Vkln?=
 =?utf-8?B?Q21kR01QMjNLSEdxaERsWHJYRlJvbXdmTGNzR1R0ZkljWXY3blVkS1ROaFNn?=
 =?utf-8?B?VmdsYjFmMU5JUFNNQkxrejdPRnB5ZEFNNXk5RDRyZk5RQ0JOeUdQSEdOWXVB?=
 =?utf-8?B?QUtaUlRJM2R1VmZ1VDBRb09MS3Z4MzdseEVKVkI1cXpUUGhnZzdYRGlML1Rw?=
 =?utf-8?B?K1p2WUxmRFVvc1pHYy9lb1Fpd2k1dFNkdjY5UitLOGFLOUJRSmNJVWtXSWQ3?=
 =?utf-8?B?S3cxeXVnUzdncjNqYlhWaDNsck1ya09RTGpvNlBOV05NdmJ1aklHbGxObFZ2?=
 =?utf-8?B?YkEzM2M1eCtEOWJMNUhaQmpIR2gxMjdhNW5Pa3ZsVmcvbUhiYTFJM0x6VGNu?=
 =?utf-8?B?UzQ2aWg5SjNYNkFvbnNiS2FpcWNiSGlMQUhDdjRYOGc3MnFLQ0ZiQzVJTXUx?=
 =?utf-8?B?d0pjTU01US9rU3I3NWFzVjQ3UVN3amlaVmNiaGVEMG01VHc2WUFCbkNWZGYz?=
 =?utf-8?Q?VRC6SnUVMyjJBp/isxStrXSeDiDCq4i8bi9Hgdg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1d846e-8b3f-42c5-3922-08d935ab12fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 18:25:12.5044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCS99H/Z32M0atiJFGkqSpap4iQzmiSF9lSqe9n1E0OEj30k4Oe1FashCPgo9vE3SuH/lc0Ci/J9K2vlcxDmfyG/L/b2DJXyLwZZYAMWXTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4806
X-OriginatorOrg: citrix.com

On 22/06/2021 16:19, Jan Beulich wrote:
> There's no xencall6(), so the version script also shouldn't mention it.
> If such a function would ever appear, it shouldn't land in version 1.0.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Ian Jackson <iwj@xenproject.org>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This really does need backporting, and it is probably worth stating
explicitly that there is no change in the resulting object, nor
abi-dumper's view of the object.

~Andrew

