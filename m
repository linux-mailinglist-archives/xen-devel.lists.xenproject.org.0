Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA113166AA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 13:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83586.155890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ocH-0007qN-RX; Wed, 10 Feb 2021 12:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83586.155890; Wed, 10 Feb 2021 12:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ocH-0007py-O0; Wed, 10 Feb 2021 12:29:09 +0000
Received: by outflank-mailman (input) for mailman id 83586;
 Wed, 10 Feb 2021 12:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9ocF-0007pt-P1
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 12:29:07 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30f7e9e0-5a82-40a3-822b-1da4cd404d24;
 Wed, 10 Feb 2021 12:29:06 +0000 (UTC)
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
X-Inumbo-ID: 30f7e9e0-5a82-40a3-822b-1da4cd404d24
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612960146;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=11GhLA/pbKAn6c/TrvS2UJYAbz1yXGhTnOC934fh44g=;
  b=S+1TCOLqOVP3TO8KsjmJJJDZFio0qDKbi1IfztlwfAkA7F8AjMzqeJrX
   1BwR5275NBbW9NSlE0MqSwVYOj81sNfDpbHRlSEMN+lfFESrU+qJ9geWF
   AEoKCEUqL/DYNoFAptRUuwIctmlZPUuOEzyVvKR6fBL9ji0l+RiFYUNYL
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rp6gEOFqwAkEuMirGyd3zr+VVakdmnR580AxKm4yGRdz1R7K7LFR+xd5qJ/N19defPKsx23yCe
 JaMJhWFF/D6A8+AGmh8IiDWCUWyrq5kvBwXpskebUhM9UQRsqXXlNFjjfhkaAXn+Hs+ZvSv7xh
 oso8yg5EAh2J8ALmA/yxgoxZZUln4GVcGq5CT1AjJOHOPsuikBK20Kxdg/eQ1dijtILLEuiKbb
 CPh8pPwdois7ay2zcK/1J53FTt/OnGaSKd8RT2OKrJ9BDEMpW9fIzXlRPejIOue2B8nY8RDmKk
 6pQ=
X-SBRS: 5.2
X-MesageID: 36886994
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="36886994"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCCkj2Pp+zkhKuZUB7ZIc+5RAxK1HanQzO5CLeMhf+0N6n3tjxaiO5CaU6+zqoCgStcUv9wW/00f7SkcxPPigDLcFbcmyH8T4VRRtyt6pNXS9UYCNp1ETgCjCfQu/VGbbSqSwek/yqvP8n3q5AYncY3orIofYgWE16OlSFOmM/YXDRAXb5qma9+vfidhoMCahQ8xusd2PZu6/EDYEEWIW/pDOpP1VUILErNJAJcxSr0M1JqMmcXKTf0mEwFV+wlM1kFTDfOXTPauBqihkkTaTPn9CIp7PNHvXMZnnNzWjVkDb6yJhRTvaEIKzDNL0CM0MlXMtyzvAzvcumS3EtMPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emJHKddwaIBMSXWDUgZuUuneTdw1N3nliZ2Shn8ET5c=;
 b=jw/VKx8r5dK1GZlus91tk/j9F8NuzBQ8TGjA+/XQrzJZ4/NJyc+W4bRubTvS3lxKbHaiqDT+U15odoSJCSe7n1xQDI3DozCT6DZXCSJg9ONeqB7Fo6PHyT0Cf9odvlRTG5g7WY2ydsCPumyjtGjld5do0MHaHSXqADzpQpsgE4Qhh6JPz4UE9kn1fFVhFW2FXAhc3T/xUafxo6bY61Sdqs2IxawDSITO0rriXYvbYKsYeskGxKJ7u+dqq0rX0CxqVqDPL+vw23npO2G7+BlzOI1MpRKstmQRT1hGrFEOvUgnEEos2OLt9VxlFa7qaYzZcNQ23e8vFf+wTv55JBuf1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emJHKddwaIBMSXWDUgZuUuneTdw1N3nliZ2Shn8ET5c=;
 b=KTTDYYxJt2RI5QgivRtWSbSYmqRaXHx/kNqByj338rRIjkEZuDJVs1tW9ZFqVoWnn3t/tKLpBnrUtgt6aewg/69rvAoeN3JfYoc0/1bt5tNphtd7bGUNvC5Yc4Yu0s01mENTWq7yrjTTagJegHLOrZfpdbyXvb/pLLopvsyMYO4=
Subject: Re: [PATCH] x86emul: fix SYSENTER/SYSCALL switching into 64-bit mode
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <7ce15e4b-8bf1-0cfd-ca9e-5f6eba12cac1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d66cce4b-6563-4857-30be-5889788ca6c8@citrix.com>
Date: Wed, 10 Feb 2021 12:28:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <7ce15e4b-8bf1-0cfd-ca9e-5f6eba12cac1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1cb453-4ebc-4e50-21d6-08d8cdbf67bf
X-MS-TrafficTypeDiagnostic: BYAPR03MB3432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3432BEC146FEA9E6C1FCDAC7BA8D9@BYAPR03MB3432.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sUmzMDdp6ZZhEwNRoQkjnO0ixDntg5wb0xwWqVnF4Lz+qKKE/e+UzKHqHNz61KfSYiquZG5zUkaGcklf5r8gGHZxPqr6vdlPPBsStZHIxlXliqdQN+orpKnhR2xh2qM9dGo5wxaOYlBFNI8b0Xfldhk0g10ZCcOwGZckm0SfmJxUjLHNiOuakXq6d0chsPoUPl3IMVYWVEELWdKEhVncp1isZmV+BfF3hW/LBHiPwCgnlhljrl40lxRuEdz4+yHAFSkoIpxSXWVoB0Mj9mRXco1rEaZi5I1Gv4tpUS0XQ+fFhBx4w9CQjfE12ES7ZmMnhhnQZ9nYnNPls155pSYjJuzJeHJ+sKNCxQ17YbHUrv+MffkGSb0LygtZfW0elJNDFi+/OG3zi5JvjewpQcGxP2Wqdm13bw95A2gOmgRZzg8VTg0gIR17YKl0SdSjxnSDLEm2D2k2qJbSfGTD4f0TtZC1dPPrGhym9pajrSunfAN1pmIDIF+1duHGeeruhWwr1t8kgNCeH6FSGmuANyxbgCE7f7Nqw9urObHpEBT3U1B7rxWkeoSurpkVETsbJk7WyM6Oi1GI6YVkuiXQYp8hTh0ihxMXPsfe/7yAi3ifYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(4326008)(6666004)(107886003)(8676002)(2906002)(31686004)(110136005)(66556008)(54906003)(66476007)(53546011)(83380400001)(2616005)(956004)(478600001)(5660300002)(26005)(86362001)(8936002)(6486002)(66946007)(316002)(16576012)(31696002)(186003)(16526019)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTIweUxvUVFvaWp1YW5zdlZjM3BZVEVYYlcyeVRqTDdtYzltRTlIZ0QxNkps?=
 =?utf-8?B?eEJYdzgyOHI4VDlrMVRod1UrL0hXWWxlSkZRZlR6dFhTR3hMNzdWdGlkRFk1?=
 =?utf-8?B?NzBtMlBBa3o0emtGRWNTYk9ETFB2allWZFYvVktaL3lqVDJZdHFocVlQaDFn?=
 =?utf-8?B?MitZRnc5d3lPV2NXenVYQjFXeno4K1JQOWV2R3VSUnJUK0FNNTVNN2ZZYmNr?=
 =?utf-8?B?VWhDYlp5OTZLZm11clhObEozZXl0bzlOajZESk14NTVIODZaS04xZVJmSmRN?=
 =?utf-8?B?WXRiaml1RVJSVVJIWVJoRVJzQldVaFhlclFxcndiaVRIbFUrTHkwNW0yRnFJ?=
 =?utf-8?B?a0hDRjFRaitiM1ZGRlkzZ1hXR2ZuTHVVMFFyUXl3cjJKM2VoTVpQdS9ySUtN?=
 =?utf-8?B?QjRkT0JoTjFiTDYrQUpmTFZHNDlZWWw4VDBPRHF0SkFUNzZIbE1BTFJWd1Zt?=
 =?utf-8?B?L01HRWJObTBJTFBGTXQ1SjBWZzhXUzF2WEFGOUFsOXdCNDg0MXJ6bzV2L01t?=
 =?utf-8?B?WlJXbkdoTzdqSnNGWTVLeTJpNFdUWURBZjJzOHQxVjNOYmEvQ2p6UGd3TEY3?=
 =?utf-8?B?S1gvWllNOXo0WFV2Zkx5WmFwU29qVVpERUF3Vk9WVDNIOXVjNUhhdWNxSmxr?=
 =?utf-8?B?K0dCUzAxM3M0UnpWT0JGSUY0WjlHUVB1S3ZwT0NoV2NTWnFGOXZaMFFod0oy?=
 =?utf-8?B?cXhrZ2dzTC9kdUFpZ1dFejMxRnlUM1NHTCtCQVlaakRjQUlJR0N5dTRubmNJ?=
 =?utf-8?B?TkE3WFpvZTNxbXhkcVE1SUhPRjV0bEU5eE5jazdsbjc1Rkg1dm1HaEU5WFFI?=
 =?utf-8?B?V3lURmF1TW5TMWt5NHFjV1M2SitIRXpSQU5WLzNvZ0UybHBZL0JFemN2Rnc1?=
 =?utf-8?B?MmF2N0JMZGo3VUI0MlNFbEozYk5MMTdhRjJuMTFUT0RESUN3c2xuTDVMY2ZI?=
 =?utf-8?B?MFMrRkFsRWd6eFFJR2w4M2ZPYmx3cWJSZ2Q2UmtIWlVUUW9OUWVqSWVVbzJm?=
 =?utf-8?B?ZXdwc0h2ZlAybkFUVXYyaGoyTEhxeXE0N2Z1YTV5ZEdoR1V6ZFJwRzRTNFRj?=
 =?utf-8?B?cDRLZ3FBUkpYRTR5eTlqVkRtUXRiY3RlcmpseXVadUpsamV4TDUvcmlRa3Rr?=
 =?utf-8?B?bnh6YUlqVXN0NnBXRUdsTW5EaVQ0RC84UEZWUzJiWmcvTHoweUtpb2c3UWxB?=
 =?utf-8?B?a2YrUVhwMGs0dzNVOEVMcTM2Sjk0TGs3TmNhR0pXeHAweStFdnl6MTVLQmhX?=
 =?utf-8?B?OTg1M2ZwWUpiZi9yMUpET1JpeWtsdVdoU0wvcUY5SmZDZ3JWcmZyenhwUERK?=
 =?utf-8?B?SHF1alJGbDZncXMzZWVic0Z3OE9wSkY0Z2hzRkpCQjN4QmRSZzF5NFdiWU1F?=
 =?utf-8?B?MHRJd3Nxa0lrazVHdGhJMzhOYjZQQlNIeUw3VG14ODRBSDZyazlEdmJ6bUR4?=
 =?utf-8?B?SjFsTHA3bzF3blBFSmJVcVhyQzBXSjFlTTZvZk1CTFhHMEcrd1BoRm90NTdn?=
 =?utf-8?B?R0c4RjBRdjFlRU9ENENWS1J5UktZS01oMGljeDFDc2s1K2lOMUl5UE9BZTBJ?=
 =?utf-8?B?bERUdUEvcCsvQ21zMUQ4eEQ0SmJ4WHQrTE5IZVduMDExYjNidTlmVDIzR0gz?=
 =?utf-8?B?UUZVWEhta1RDZFB2SXlzZXd1RVJmb0NUTWtTZDhvaUluN3hoWWIzZm1TN3Vz?=
 =?utf-8?B?R0RyMXRzVW5uZ2ZwUWNuRnF0bDlkSSt1NCtNWUNoN3RmWk1yWUxBb3NLVDNK?=
 =?utf-8?Q?VlNN7z3u8izknnRyc0X0gEOiiqiTw1mKZLHWDtg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1cb453-4ebc-4e50-21d6-08d8cdbf67bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 12:28:43.7900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ja7pRMjRN1oXImvU+1WFnQG3tfjXUVfkzhYcR63fJ7dvwQI3VgAc0Dx9nuEv6Moj5Jb8xFqE6NNqTgYqG5qbEXv+6iBfHrkZ5gWrrMltgXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3432
X-OriginatorOrg: citrix.com

On 10/02/2021 09:57, Jan Beulich wrote:
> When invoked by compat mode, mode_64bit() will be false at the start of
> emulation. The logic after complete_insn, however, needs to consider the
> mode switched into, in particular to avoid truncating RIP.
>
> Inspired by / paralleling and extending Linux commit 943dea8af21b ("KVM:
> x86: Update emulator context mode if SYSENTER xfers to 64-bit mode").
>
> While there, tighten a related assertion in x86_emulate_wrapper() - we
> want to be sure to not switch into an impossible mode when the code gets
> built for 32-bit only (as is possible for the test harness).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In principle we could drop SYSENTER's ctxt->lma dependency when setting
> _regs.r(ip). I wasn't certain whether leaving it as is serves as kind of
> documentation ...
>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -6127,6 +6127,10 @@ x86_emulate(
>               (rc = ops->write_segment(x86_seg_ss, &sreg, ctxt)) )
>              goto done;
>  
> +        if ( ctxt->lma )
> +            /* In particular mode_64bit() needs to return true from here on. */
> +            ctxt->addr_size = ctxt->sp_size = 64;

I think this is fine as presented, but don't we want the logical
opposite for SYSRET/SYSEXIT ?

We truncate rip suitably already, but don't know what other checks may
appear in the future.

~Andrew

