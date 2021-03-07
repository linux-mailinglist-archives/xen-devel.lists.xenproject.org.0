Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41399330031
	for <lists+xen-devel@lfdr.de>; Sun,  7 Mar 2021 11:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94487.178055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIr6j-0007ne-DZ; Sun, 07 Mar 2021 10:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94487.178055; Sun, 07 Mar 2021 10:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIr6j-0007nF-A0; Sun, 07 Mar 2021 10:57:57 +0000
Received: by outflank-mailman (input) for mailman id 94487;
 Sun, 07 Mar 2021 10:57:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RtG4=IF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lIr6h-0007nA-Lf
 for xen-devel@lists.xenproject.org; Sun, 07 Mar 2021 10:57:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df73b351-dbc4-4d50-bb36-31f08d3aedd1;
 Sun, 07 Mar 2021 10:57:54 +0000 (UTC)
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
X-Inumbo-ID: df73b351-dbc4-4d50-bb36-31f08d3aedd1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615114674;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2q6pRxdIZ78xQ6v4Nih3FvoWX7GJOxta40npktxnXUw=;
  b=hKvbGvjjfWJKqxKQ6QEAomyCFDpdtY7vpDciaB+HrhAtnvl2CSvcTPJf
   c6179Qj4T/Bc3n1Lwajm2rb9VGOqNhZpuKvdYVkqPMW8iy+jKB1U+x4l8
   f4LY4P3QYDVXFG2N3j40mw8qKz/XIfaMJ+rLTV3AWhM+Ek6b1bBx6iX1v
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dKDLkF2Mzv5teOYrtc3oFCYIpYxSH89BvwqjOIfH371FWqD6S2zUDAYoOMfzpvCN4XO6ndeIWh
 mQymJSYDJ48iXZB2A0UvNMzOy6mQ23hmRgxx/I2gfcQWAdWNiVp5EVyQ06ITlQTKBDQHV51EqE
 TBISRJOpCw/xljy5Gu4xkQBkB9Gri/MM3C32eu+MDlXcUeK9fAY5MYyyh+DkglQP4NLZY4uNZF
 qOMHAhfidpnDT7Uk6o0UW5puDoA0D66WdPzmyAis0Bfiatr3CKbNbveb6u1cdpTJ9b4Otm/MmD
 hck=
X-SBRS: 5.2
X-MesageID: 39083910
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,230,1610427600"; 
   d="scan'208";a="39083910"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMrwM5Er08/sAsGJNCMvCji8rQ7tOyT8NYyxNZ1sQhB7PxO+XtO1ld5JvwZxhvTgw/TpRUAUa9YKPi76tAkY1TMcxQs0IzzNm8dvtfKAAocf2JOUzDtRC1oGia8CmNR6X06d4kIObsWJM/XokKsfULKnAvw6WnLuzxUpdbze7lELJ26LgHQ+6R5t1ht5XDtdz4GgUnrfqWoECKWyGE/1+suSxXO/2k+7mb5AaJmxXreXDbC6JMM/vK5f12jvd3UWXeNqQ8RdlddJZmgAobh0XVQNcx0OmcInZzAk09ZOV9awGJwUE5mJDYpxGKg5RtM2rc2i5lTzvBux4IIKAgg/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/kcEvGz1tQFHCcP3t01GSZz7P2SJD1K3ySFGeFsoys=;
 b=MR27zqym5gN3mtm9PvbUhKloBtuNPXvwFlbWRgJUf4Q9PoYchUzeVjMc30nZGjpdlZIpjcW05U38CtcfavgjJgIPaBOzzuF/V9W0RSkupOtVDSrrFAayw4+13JQjXa3qLxmskboq9kZ5wnj0+xuwSV/yee06hs02sWgdyO7Sl57KCkiu8U7eAHaYmGY+WZSSPFhYWq8QTly/m825xSDrNSIF78TaNr92cQjo/WP3gk/C5zHi8AKZujLbxz63FY8Lb6nJp/75VBLApD8eTmFjfC0r9NCJWeDpGHzBc550c0G/lM3CZxZRvD+9ysB2m6GNTrQWalkGOD5LgNRip67sGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/kcEvGz1tQFHCcP3t01GSZz7P2SJD1K3ySFGeFsoys=;
 b=kT8p2AkCJYAsLrGvmXOGjgtbt+MUTpfuP4aGbKyKOVfn3LGmB513pvmarjseKcGpapSfr6DPDSDMAqJxXHlqu3JG6Prujz7GeobXOGiXH1LnWF/b8jIks2Ud1say3nelGYVpRPoXkcl1fq5B8c+O82Sb8PU/XgQrJiAu2q+jM0k=
Date: Sun, 7 Mar 2021 11:57:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
Message-ID: <YESxpOByQ+7gXeI0@Air-de-Roger>
References: <20210306214148.27021-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210306214148.27021-1-julien@xen.org>
X-ClientProxiedBy: AS8PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5cbe62e-1454-4d85-95c0-08d8e157d7af
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5606829C8F2243CBF99C71588F949@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ARkgZczLAZqWBquOaWHytLeu1WSXcP16SZvRptyLfrI8mzKVgZGg+1/bzFZxk+UR+PmMvat0Apa4f02M4plG3Yzy+Sqxu+i8ZSXVL2OX4rTCYVQ1k3XQocGbv86p0BW/HSg5TM+wpAlgtgUCMpygW+qBdaDKdjoUxoaMngyH04A4LUvANKe6FFHJp73eo+t9rN30ZgwnyxzTjbZz+QWn5NtFCPU531pVrFx6NfG0RKVYQFryDYMfUxz126NhInfwTzRlcqCBZVCgT3O1ctQMjqLVETOMmNp9XlWgC5HT3/xpYPaGQ3GdG49FeEyurWwviHKjMSqdXhFsKuDx/tKvDVrV4rP3zTgCbU1LPD13fpZlF8MyuQqZnsxFQ5hV1cU5wTrjUbvjd1ow1Y1ps1PM+TvuYBWgut7d51qft/CJKwmfJuJKKtAWopqaJC5K2tAli9RBfFVwajX6THR+Ct/6MRpLumqzp/7Jg0IG/JM1Rw1fIPkrh1Dz67PLHT2wBehoZxig6fNRcXkGwnmfFXfDcHlq2VuOjLN0JFJZs3GPGIwtJdOr0uECwh/KNpu+nCdGpcDXiBlVeXu31mojghoYqrHztYIGImiJMWfUfrQaOX1G+s8RLNn4xMtSWrnabc9mEVRwyzMi8zsFXVL8YFktOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(6486002)(26005)(66476007)(186003)(66946007)(66556008)(16526019)(9686003)(8676002)(85182001)(966005)(6496006)(6666004)(8936002)(86362001)(956004)(4744005)(316002)(33716001)(4326008)(2906002)(54906003)(478600001)(5660300002)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXFrS3lVUU9qRGFoWmhsM2lXWnliSjhwb1hNcW8wdFFQTGxtL3JPd3p0TlNr?=
 =?utf-8?B?b0hON3F1Z1gxNWpDZEcxY0pKRmtDM1AwSjhRakp5eFVVSWV6V3hac3I4ZnNq?=
 =?utf-8?B?MGV3cXBrTlF5cEF5eFBkVkRjdnU3Ky9UMWZoRXhYN2ZtT1BKU3ZZcnQvVlFU?=
 =?utf-8?B?VUVSZXJBckIwUnJWb2RLWHc3S3Jjb1g1a3oyNkhXdFNxNytpY0NCelVIaTlL?=
 =?utf-8?B?ZFlwemJ5TUtYKzFCaGhoM2p2WFd6aDVoM2pWeHhURXVmaHY4RXM0QXBnV3RE?=
 =?utf-8?B?OEl0QTEyNG5tZWVCTHpPNmhQRVVLTFB2dWZWSG9YcCtMZXFjRHZGd005MUdM?=
 =?utf-8?B?MzlsK0tzQm01ZENCM1oyMWdITlhURTJlRTNkN0EyZmNyWVI2L09VM3gwN1h5?=
 =?utf-8?B?NE9GeXVVTStmVGNjMERkVGlveGhiTHNQS2oyNnQvYXBVZzlMSTFFbHphb0VR?=
 =?utf-8?B?M21NNjJxeUE2UWZSc1IrOHhxRFFvVWN0VVZoOWJvcllXcm83T1N5NHZCTm9E?=
 =?utf-8?B?UTdvanlyTkZFRkRaazV1TTRYaWpsWUU1eVR6b3BsVGtkMEVab1F4ZXlxZlg1?=
 =?utf-8?B?ZlUxUW9WUEQ2RVlmWWVmb3l4eDFFK1oxVzRuVFRkT3dsdnNSaDNhVnBSNXhZ?=
 =?utf-8?B?WVlhVGc4R0dWSkFxbUFRTWhKYVpxeitmMm1lVElVdFI2QUtieks4cjVvbU5F?=
 =?utf-8?B?eUlWdHFVakZySTNTbFNUNXRLV1JCUDFtak5BRjJPeTlmZ1pjZC9MWmJudTVD?=
 =?utf-8?B?Q3o4dk9BVk9ITTRpVGY5bHlRL08yc1V6NWtjWXQxaEkvRnkvM2xXTGd3bE9X?=
 =?utf-8?B?ZHd1akJCTzhYL2g3eTJ5aEZCMUlpYkRsMUZqSHlwdG1PNmxmSitKS3lJVEZ6?=
 =?utf-8?B?VFJjNzJVSW9mbUNNUmw3cXZUcVlLRm1QRnFwSVA0MUhmNUMvS1hFS0p5Yi9l?=
 =?utf-8?B?Mlp1bSs2cDdmaGtKM0s5NnM2TWlTbFJEMHNoL1plSEdpd1JvblFNcUVlMTcx?=
 =?utf-8?B?ekJyais4ekxqUHIwczRSOWhlOGRsTEo0cTRpa242UmlXcHoyUFhpOHlqeWRZ?=
 =?utf-8?B?NmpwRCtBYmtOS2hVS0FKby9yYXpzMjJFS0VLeWxweVNhb2dBVjJnamRKVnlR?=
 =?utf-8?B?aHFYMzJMbG1ueXJmM0dObzRFSXNPUU5zeXM5VFJDNHVHNGFqNDY3enViSlJr?=
 =?utf-8?B?RC9vU0p6R01WdW93cENjeTNYZHpMQkQva21XUENRbU5JOWFkOVN2UUdReVpN?=
 =?utf-8?B?NmpmYXZ2ZWRVQ2RJRVRxQWlJeVIvMzVFdytmdS9EQjJkRnlFdkNoM29neEZR?=
 =?utf-8?B?RkVyMk1JNFpnUVZPcXgzKzllazRhRjdaaG0rVzJxZ3UyKzkvMlpEeWdIem1j?=
 =?utf-8?B?V1dIMlQ3bG0wcjFNWE51aklJQktpM3pkV0hIMzhSemhJK0NNTXAxWGN4ZHJY?=
 =?utf-8?B?RkhsL2x0SzVWekJSTGtZdGFMRkxNYjN2NmFldnM1ZTZWckRvQmIxZ3B5Nmdv?=
 =?utf-8?B?aHhkN00ySCtUQkpkTHc5ckd0QWsyWkt1RzNDOUVsR1JsS3Vqa1BHTVBuaDAx?=
 =?utf-8?B?NE8xUVNHWC9mMHR5bnpZK3EwdHM3b3ppMVNaMTFtNUV3ekdJeGd2bm5GTDFV?=
 =?utf-8?B?cUw2VGhKWkkzUFh6UUlYT3FWS2pKU05wMGduSGtxUWQ2Mm1zTDMwQ1QxS3Vt?=
 =?utf-8?B?ZG11bUZnL25ZdEgyQ2xnc0c0NVZ2NDBaT3RpVlptVnBRUHgzUWM5TkZFVmVr?=
 =?utf-8?Q?whT/GUNeuuZOJnjegb9ZN/U78vfVNIJLvLV2YKJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cbe62e-1454-4d85-95c0-08d8e157d7af
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2021 10:57:47.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9/rd12eueuO2qL504q95aSkVEqD63O4hKLlqdOuaHRDO2hYN3LMNe2oqjqdIzQpBFInfBmdWWoBqLduF7d59Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Sat, Mar 06, 2021 at 09:41:48PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Compilers older than 4.8 have known codegen issues which can lead to
> silent miscompilation:
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
> 
> Furthermore, pre-4.9 GCC have known bugs (including things like
> internal compiler errors on Arm) which would require workaround (I
> haven't checked if we have any in Xen).
> 
> The minimum version of GCC to build the hypervisor is now raised to 4.9.

The README entry doesn't differentiate between tools and hypervisor
GCC version, can the bug above also manifest in toolstack code?

I don't think it makes much sense to have diverging requirements for
tools vs hypervisor builds, but if the bug(s) can also manifest in
toolstack code we might want to add a GCC version check to
tools/configure.ac.

Thanks, Roger.

