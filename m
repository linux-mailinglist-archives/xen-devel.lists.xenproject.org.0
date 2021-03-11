Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A033792D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 17:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96686.183203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO4W-0002jK-M6; Thu, 11 Mar 2021 16:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96686.183203; Thu, 11 Mar 2021 16:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKO4W-0002iv-IW; Thu, 11 Mar 2021 16:22:00 +0000
Received: by outflank-mailman (input) for mailman id 96686;
 Thu, 11 Mar 2021 16:21:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKO4V-0002in-Fq
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:21:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b116271-6d95-4853-ac47-b09784e448d1;
 Thu, 11 Mar 2021 16:21:58 +0000 (UTC)
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
X-Inumbo-ID: 3b116271-6d95-4853-ac47-b09784e448d1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615479718;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EV7AjTLC0TFcuDw+q+bKCKhZ4CC8dWU76xVWFd5a6SE=;
  b=ZxuMJBqPzdD+50dz0UR4X8w1CnRQOuuzxyiVA9gAKX9L/Q1/zFp0Xp/a
   Vy/wVNeWyMEaU8tgSwnICbdSesD8vA8PuzjItam+BVWkCSMgzStyhhW6y
   C9pZikDMHChR89CKP+CXY5IyknU7BCq1luMkdxhe2z60W7B7tgL7iiMnV
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1bC2Bhdl5EJt07OcrDko0UUv9iRN3v+bE7ZCDa2n2g8QdB81Wj7nP65UMkMN0RpA91f9Oxuoqo
 G98XOsCyGTSUoLahRAMy03et+rQAcAfP0w76BwwJHOr5pcJ56cgMszPEj6hnx6xYBiU3WcQCTC
 FhficPxyU/nnv6H80SRs6Iop3Ru7HUkHdI3oMFkcI1Gpqwe3hUmWMcxj69UWG9FzK5zKFPWTU0
 YY5yE9ipFpdZv/5L77uqSsRVg15gVO+Xr6+Zt2LqPhgqsgt42LhrlfhLD7cU0YnWUC2Dc/qhyg
 mkA=
X-SBRS: 5.2
X-MesageID: 40490546
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QmphW6g2VCAp78tispaUPvnYwXBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.81,241,1610427600"; 
   d="scan'208";a="40490546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7lzQv9MNF7O2GOrB5JjMbetIH9Gp/exudPvqUcebn2tBKfaRk4f6jdsr3wprYTs2nlOc4LdH96+Aav71OfeYOtOTT7iCdaBaWfIFwNPbzl2PeJGALCG2alzMWL4zzOC71q8iSZxRdba7QauW4Nub501DjI2uyVEfdHjr8l8cRBMqSzhOrBzj/6cPtUl02zU+nDDSq3oWDTAz5MC93zXFEKNAfqjZIWmbVn2uLWuI31GYCPN1yIwimVTNSAM8bszSQ2A0OzKY8kKZvdLt5833uSSyHFe+iKM3tqjFldXHSh6cdecCT63th1cMUIhQPRAsktpL/T9q6PaGXhrj0dXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsbX3b0NSX/ShaOyXjQ6Rh6gdTVgcTVOKz9f1MHxwCo=;
 b=XUUPcZc6FHYnsQf88OkQRFIFoIE0/0/uex2MG79H+W2UnUeYFBg0C2PTW0RS4EdncThSj0qVHf8VoOrDzBlrN8Pj0VlZid3ed0mWCnlCaQ8FNVa4g0fvUljEUsR11m+G2WNXtuiudEakZfClEmT7S2yfYrgCVMl3kM9w91oELDn+aW+/eGm8daGPfscWN2SJ9oPheJbuIPp8bgLb8BwB72iEZB4Sntq+q6wRPgoHgFFztVmKuf1Ez7GOHFsyhK/CdlEp2zWsIrhgmR+K2WdLrGTwrFfyXN/yxh28UnGxydzypddlQq7E03ByrnrA7Cg9RSJhBalgYw6zRQJDls3wQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsbX3b0NSX/ShaOyXjQ6Rh6gdTVgcTVOKz9f1MHxwCo=;
 b=b5zXCbLt5ktOoaK2Vo3DPdrgJt+wfN35zbHJIE5/aXEPmWs5v6keTfYQShZcp/7eQn/4Zgg8IGerFpVCFeMlQzVQMJJKekiV8BnOQIawpIKA6a/J2d4aTNI2fsZKtZsi6BOiIQ++o2oeVU3PXvYa5tXw39avXbLqRh0YpeOauUU=
Date: Thu, 11 Mar 2021 17:21:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h
 every time
Message-ID: <YEpDkoNmBikimmaN@Air-de-Roger>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
 <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
 <YEo3VzlTRTaBUkqw@Air-de-Roger>
 <bb055af8-f69b-f87a-fc35-4d8b8d3ce1a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb055af8-f69b-f87a-fc35-4d8b8d3ce1a9@suse.com>
X-ClientProxiedBy: PR2PR09CA0021.eurprd09.prod.outlook.com
 (2603:10a6:101:16::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12a5f52a-85e8-4a59-295d-08d8e4a9c2fa
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2969EE1D1F3CA0CB4EF729688F909@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9r0MmWlFDGmuh3pwD0OxcjvdXy2IUZaRgLpym7fejiOBgFDOtG1FFSFQd0p4f6xrNV0JCcIGZagFPAM3B1C1Dy+mQsz7OVOxSm+qmvKQUI2AeHNOmSuXhiA5uqy5+9IhKSX6pW3g9ukQ5VYc4XLfBygo4LFdUod+r6XN8WI0iP54kDe8GKTntOBdfBPHP62B7QllRJ1X8/odJsaClQkqMDtjSjCr82AP6rnltfdt/EQi3DPDVZ3aaiammmPHhbGyMl6CJJkdBRHsOFYuUJdgELMUAdbwr0TT8ik3OWqXGdAbbWsK+eyX1Z/5apxkgHiPtrpUex7nfsrJs1yo7/AP0fwha9Ff3UoNtV9aBFiDtxc8vXUdkV2vfNigPfPhNVaOaKN4u/l65UYIkTGpJZRz3RVe9VgPXFVIcBDbhFRkQ2Oj1jBOXpTFBK0Grpoq80Am26K0RMj08tz+xA4hRFKntY9XclWYnhkIRpf4byhDHAfdGSDhP6sh3FE6fnkqOpMIec1GxB2g51hu/Hir22NSzRvT0z4V5cjagg5cj0QYS/XcGv1lcEho909MQ+c0We5h4aPxlt5hgPfBtwnnnI4W5SB4Okrurpd3asrhFcy2q+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(2906002)(85182001)(6916009)(8936002)(8676002)(6486002)(4326008)(6666004)(478600001)(33716001)(5660300002)(966005)(186003)(16526019)(26005)(86362001)(66946007)(956004)(66476007)(66556008)(9686003)(316002)(54906003)(6496006)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZkZ4UGdoeHRlSGQ5Sk9nNTRJNmUvNTAwVHpjTWdwWElacVZ0NlE4UEhwTGNW?=
 =?utf-8?B?UzU4VmhaaDlLNDlSZmRpMGwrUzJrRTNMYUwrOVBvYTQ4Wk5rODNBTzQ4M0FS?=
 =?utf-8?B?RWNVS2NZZHBVYmMvYSsremJmVWpDYzl4OHZOb3F4cTR0OUtpSFNndzljcEZ1?=
 =?utf-8?B?c08rUWxIZVQwLzE4dUl6RG9Hd2tYaVUzSzRaMWxCam1jZlBXNnJuelFROHJj?=
 =?utf-8?B?WnBkUXVxd1p5ZWtHYXpMYnhnSThEN1NBMlRTVExSYXVUU3JxMWFRWnBMTEFT?=
 =?utf-8?B?OUpBUmM2cGYyTWVXd0lCSHJQOThXdXVqOHpjOUJPblp1SktuYTFIRXJVVmFR?=
 =?utf-8?B?b0JrR1RwZEpFcnhBblNrZlozbkhKeTJpQ0lPYmYzUXV2VVRPdjNxV3QzU0pj?=
 =?utf-8?B?OEFaZTJQckRaOGRyZStub0plZGNEMDM1RytKZVo4Q3BxL3FzZkMvalczRmFu?=
 =?utf-8?B?aGRkV0crSnhuWWNVK2RKSEFIOHVkZ0lBU2xNY1pORlFnSVlTbzN3WGpRcmRF?=
 =?utf-8?B?bXhPOU9IOWM1WVhXRTFDekkxYjk5aTBtZTJPQTE5cUNIT1kvSHQ1S3RGS3J5?=
 =?utf-8?B?MEQ0SnJaL3p3dFl6NWRWNDNMY2pPWUYvOFYxRlQzOGkydEJVc2tONE56YjVO?=
 =?utf-8?B?eitSZlArNloya0w0RE9YTEw1YjlaUHJKSXRSbmJ0cmJKVVFWYTk5dzRnTmFF?=
 =?utf-8?B?UDl0RktiMGpWdnF0NGFrQ1djeXZ2ZHhJTWpjRXFpRG05TVZRNWdVVTRUbmY3?=
 =?utf-8?B?eUJIdnJFNzlsbTBmSVltNFREczVJbWkwNUpDUUh6eFhqZUx0WWJlaDlMWVFh?=
 =?utf-8?B?SVpnSStyM3BBSmN4eDQrYWxuMm1WbUE4eFZJRHo3WVdob3FsTlQzcjdUY3JV?=
 =?utf-8?B?dlV2TUZBSkduKzF5ZFpaMUs5MW9Jb2dXQkVtV3c4UEh2Rk9Oek43QzdWOGND?=
 =?utf-8?B?YTZ6Vm5WNkxWL1NVRG1WamM2SFFodzFsVi9ZekhUNXIvdTQ1WFlGZFFFcHdu?=
 =?utf-8?B?T01rSkdWV2tCRWh3N0NpZnBCNnRpckc1c2s3dlBWMEg4VjNXMGdZc3hxOEk0?=
 =?utf-8?B?bEpZazZ2SkpnR21jMytWeUhHQWZHM1dRK3ozM29aRDFpalcrY3E4alNVZkZN?=
 =?utf-8?B?LzZ0Wko0amhPeHlTY1A1RGZPYzY2L0tIcThpa3JsU28xYjF1UGxHcUZtSUUw?=
 =?utf-8?B?WmVLZ0c0RXIrazF6NWtZb0VoVFUzV3BTVkN3aGVpN2g5SDB1VTFaS3R3Sk1X?=
 =?utf-8?B?RnBWaGVCUnUyRDZUSWU3SlZnVEgzanpUWE1IVlZQVmZuQXhSV2o3WDI4V3ow?=
 =?utf-8?B?bGRnbFUrMTZxV29vbFF1RUEzVDVVYUdsYnpXUmJZalJkMkYrUjhMYzhHN1dE?=
 =?utf-8?B?Z1J2U0IwdGtpdUkzNWNaNUkwamdYaE5VS2VuTkpSMHFkNHlobVdtZ2xiT0Jr?=
 =?utf-8?B?MFk2aVF6VFBCOGZXSDgzSjNwYmF0RnhXRi9Id1QrRSszOUdaWGF6S3BNc0Va?=
 =?utf-8?B?WXpmNHY1cUlmUjR0T1FDTng0WHhlN3RDMUVpWkorTGVScGJTRVJPd1RWMFJW?=
 =?utf-8?B?R0ExM3Z3ZytCd1U0TjhkOWZ1VmdxVVcxTmpTcjlleGdMU0VsZTFIR1o2T2RY?=
 =?utf-8?B?Z3A2MVM4SllBRUFGTjdQUUc2RjlWK1AwNDFGZXp0elFsWEc3dERrem5yV3ZQ?=
 =?utf-8?B?T1NJa2FlTHdUNU1ZYTJ0c0pwMGFxL0RJSU1KSVpCTVZiODZrVXhJYzViSUNX?=
 =?utf-8?Q?F/n6r+wQ9BYqzzdw3wzRAae9IhWb0xvm6g5x/n1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a5f52a-85e8-4a59-295d-08d8e4a9c2fa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:21:44.6477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTmRdF5yke0TwMNFALfh2Ji/MomRuWmJWNKnb9siFwzI3MXp7Sjs/R7tYYLou70fL9MQGn9zgq3So2WoXpPCnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 05:00:12PM +0100, Jan Beulich wrote:
> On 11.03.2021 16:29, Roger Pau Monné wrote:
> > On Thu, Mar 11, 2021 at 03:40:05PM +0100, Jan Beulich wrote:
> >> The first thing the "xen-dir" rule does is delete the entire xen/
> >> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
> >> result there's no original version for $(move-if-changed ...) to compare
> >> against, and hence the file and all its consumers would get rebuilt
> >> every time. Instead only find and delete all the symlinks.
> >>
> >> Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v2: Different approach.
> >> ---
> >> Ian did suggest to pass -0r to xargs (and -print0 to find), but I
> >> couldn't convince myself that these are standard compliant options. We
> >> don't use any special characters in file names, so -print0 / -0
> >> shouldn't be necessary at all. The stray rm invocation when there is no
> >> output from find can be taken care of by passing -f to it.
> > 
> > Why not use `-exec rm -f {} +` instead? That seems to be part of
> > POSIX and is likely nicer than piping to xargs?
> 
> Hmm, I avoided it because I was under the impression that there
> are (compatibility) issues with it, and Ian suggesting xargs
> seemed to support that. I'd be more than happy to avoid xargs,
> of which I've never been a friend.

All I can tell is that '-exec ... {} +'  is part of POSIX [0], and I
can confirm it works on FreeBSD. I have a slight preference for -exec
instead of xargs because I think it's cleaner, but I think your
current one is correct, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

For either one.

> >> --- a/tools/include/Makefile
> >> +++ b/tools/include/Makefile
> >> @@ -19,7 +19,7 @@ xen-foreign:
> >>  	$(MAKE) -C xen-foreign
> >>  
> >>  xen-dir:
> >> -	@rm -rf xen acpi
> >> +	find xen/ acpi/ -type l 2>/dev/null | xargs rm -f --
> > 
> > Do we care about leaving an empty xen/libelf directory behind?
> 
> Why would we? It'll get created immediately afterwards if it's
> not there, and it'll initially be empty (not for long of course).

Right, also the 'clean' target will still rm the whole directory.

Thanks, Roger.

[0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/find.html

