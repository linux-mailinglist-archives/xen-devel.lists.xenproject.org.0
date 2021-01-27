Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7326830569C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75851.136694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gvd-0003qJ-Pd; Wed, 27 Jan 2021 09:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75851.136694; Wed, 27 Jan 2021 09:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4gvd-0003py-MR; Wed, 27 Jan 2021 09:15:57 +0000
Received: by outflank-mailman (input) for mailman id 75851;
 Wed, 27 Jan 2021 09:15:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xld=G6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4gvc-0003pt-M2
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:15:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e672da7-11ac-4de9-8a3a-0869d963c491;
 Wed, 27 Jan 2021 09:15:54 +0000 (UTC)
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
X-Inumbo-ID: 5e672da7-11ac-4de9-8a3a-0869d963c491
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611738954;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=S2fI7yiyQaku6DDb1ZCmBuI7RMkDtxwMoKCHmFN5bIM=;
  b=dPo1GOzZVpeEaA/5tIcfet8S+Tb3/CXcKOAhJBgr9PRt0T4w6AACtGLa
   mTQ+6I4HxNvVl5cPLPoVHMOi0ODnBt2aXmrwknTrCgeRlkhZkPNqX3vkC
   NXfUTdTYPWVRtXElKyjB3X4zq0YbiJuC014dPHele/g/53tzrsidUaIoj
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I7/CW4kNaLeCyiX4y8moH6lCuJjn7/rQxTx8lTRBOpCkgPCd0inHAgQx9zF7e9XTs1B1uUrYax
 McVXW0ZtK7T7ma68XCria8dNGkSddeGOX45NOqTmkJQeFDwfv8WZZPZN8taY63P3DMOGmgVCMV
 q5slMSO3FLVZHHz+B+0HbB/i8lEFujdJz5hbwIp2TMhrV/+gDs+IjgQC/evJB1OxeK95FJGI7K
 cHZ2cy7HJOERJTqohVIASPPIj+4fW/GLYNyonNEMuf6PVELt8lD+c4cpFAvaf3CSV3T3obKD1p
 PW4=
X-SBRS: 5.2
X-MesageID: 36318167
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,378,1602561600"; 
   d="scan'208";a="36318167"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuGPW7iMQORPM+7ymINyLO3rhALc4FGXZy5ElASqQae3DH3wCmUaP+4TEgxMF3d9slsQ27JDpEoW7mJu1a5WPYNLRLAgNebF0ZTew5R+daN/UPTWTMa2m1WXb/kc9SLQu4Fn1DnrkHs9mnTDV7CzrCeUas1ZP/B6YHWAf12AwHWyekKg0QfkHOJzgAc0Dpn5N5GaRKojZzMu9ZfzDG4N5XO5fkLermgO6bt8d9o9009oWVHdfRI4HPDrQ9p3hXMrJ84zuLZLhxdZpJ5IYDxwG91VFsrzUac1hZjuEQ7/A8UrDtrdoeeUB/FxNg6PN2qKMFqJMhqtNLGdo0dDmpVWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKB4PI/p3CL2RmYCwhEiYwHtz/HqvNcJujzCBD5UKlU=;
 b=f21BFkE1p++Bxdg+Z7UFAA4Q31YvCssB3j2TRts1O30N3lfN3fPLRuU9/jDQDnUz7Z7XNLRBFtBu2vxTt1iHESxPOUIjtxM7exeuIgdFYws81YreMrkrbZPMhC819yP/k+hnXfJto1qvVpb9PxYACBYvu3b+OFUjVIQTL3ReoFDhIE632Fju6JdTPdCWIlTUTUt/cKY+3xOGr1xGo9GLZkURc5HUNEjNVaOrv+DvsZz1fvn41Kv5xeqeokIpSOMLjv6IlG08itjmbEIPH8JLSQLzf2l/aNKBmwkysiyPxc/UQv4ibdWE7YJwxyk/dZ5DidesXJb4w5eXWn9YeN+7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKB4PI/p3CL2RmYCwhEiYwHtz/HqvNcJujzCBD5UKlU=;
 b=Tnx6gg2tWUJwjgq4LnEkwL+/Dw2MvT2QtuTb4hrZmrFUJuGh2Kh6DxHLES+RGX80LV3kzTXmu1zpS2h+h26ZfblSq/h1qOcZCx6ybUvao8Odaxq4BncnJVk1Ln2gtQbetK+K8mwxoGgNj3Io429qvI0wRS7R1gqBI67N1jDii7Q=
Date: Wed, 27 Jan 2021 10:15:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 5/6] x86/vpic: issue dpci EOI for cleared pins at ICW1
Message-ID: <20210127091545.tyzqinafcw5sz5j6@Air-de-Roger>
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-6-roger.pau@citrix.com>
 <f20953be-ee22-c336-bca5-8da84af49261@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f20953be-ee22-c336-bca5-8da84af49261@suse.com>
X-ClientProxiedBy: PR0P264CA0245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 867b7f46-a22d-4ec2-7b6c-08d8c2a423f5
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590AC9AEA5502A049559E508FBB9@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /48oDZvQSKoyO7jLxgova/CaVXUKziJyZntqIyM4W04eKAcXJcmnMja3aojOR/GLa4INUE1Ax1tXzvfdxzQLevZeAZu+jInX+Cy1Ro7elS8TUdmVhLC8quFEzs0i85VtPnGM7gSNZg1XXzOVpWFeN1d9REYkVZVTAs4jEnPD1C9ZEznvBiUtNuoqmFPQzroyB0UHhQc2myXhSxNI2HHWd7/Yh6myePyyh4K1Bm5vye/Ejvr0lUKRnxEbz7pltDzhdBrFyfjLp9Wu/VXgZ6FkR19zwU4jcfIgfI5SAo9HCtjUr8+bCBxS4GKi1lsSkyKAjXnNwoQ+5NzVOKP+X5+L5Bfiv8wU3X9KhIV+XbufAS2YR7pvF0TtNBd1pME2pvK3Z4RC3sfaoNV7mZsyEnE9yBsuiOqUvBHZgLTaM1CR433fK3368ZGFyPlks1Q5lLQDX81/S9L8kNTaIlJdiKQjBpfpubDkazq799lLO5dS5iQkXiuyDSKtIrpzdcJ+z1Rcf1EEohS+uLhbzdfiRq0xDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(66946007)(9686003)(6496006)(53546011)(478600001)(26005)(8676002)(54906003)(1076003)(66556008)(8936002)(6486002)(2906002)(6666004)(33716001)(16526019)(5660300002)(6916009)(186003)(86362001)(83380400001)(85182001)(66476007)(316002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0YvSGs0K1FJWDB2Sk1RRTdkT2ZuSDJtb0V0eURTVCs3VEhreGRBbVllQTVy?=
 =?utf-8?B?Z1ZrbENqZnVMUTZXZ0FUdGMzWC9iTG9vY1o5c21Yd1RRSVJ3WUVJSGk1SDlT?=
 =?utf-8?B?Z1FLZjd6SGtlTjMvbDdJUGF5ZDhRa2NZWXNJZmVyVVVHVzFsM1VGM0tOb0lQ?=
 =?utf-8?B?M0NPV2hxN2lhTzZzY0xmVDYyZ2g1QVdvdVJOMlRKSlBzN1ZNSEFaRG5uMjJn?=
 =?utf-8?B?SkJEQk1zaVUvMWxiakNjSytZM3NEUGlsNCt5RFVsUzRqcUhvc0sxTmZkWXNo?=
 =?utf-8?B?Mm8wNHd4cUM3b085MjltaWFXZXJtMjh0WDhLMW1KYzBMRVVhZzVqUHRwbkZs?=
 =?utf-8?B?b05XYnZVRzRMUHZJbFp5MXRRcldxck4zOC85cWpOZGJwZTNRVlk0U0VJUlht?=
 =?utf-8?B?anUwbjRQaVFtV1FyRVJaSXdUZXdITXFHV3ZBckJXaDNySStEQ1VOd29pNmhl?=
 =?utf-8?B?aTF6MlkrSWc4RUhTK3VnQjltZW1FOUNXdU1nSDhNUlpJdUs4eGRnbG5KYUxs?=
 =?utf-8?B?azJRVVd2TW9iUjdDL2FDZGdmWHJYc2tSWlp6SVh5SkZNUm9xYytqSHA3YTBH?=
 =?utf-8?B?MDl5cTZ1bHhQSkNXUWd0M0tSLzNhd3NobkttMTk3UlRBbkhFTUtGaDc4cHFG?=
 =?utf-8?B?Y1dhNmh0K0FsV29lRi9lSm1SaDZ0SzN2cGVieGJpemRiTCtiOXNWYjljZTFn?=
 =?utf-8?B?WVl2eXNTRjA0eXF2VzFyWmNFazIzN2NjZ3JOb000SGFrR294TFNpTEl4bXFI?=
 =?utf-8?B?UlNTVDJxYldpUXAvMnhlN1M5bXl3UFpPZE8rMGMzajRpU1BLcEdUVmZTSkp1?=
 =?utf-8?B?b1poQSs3SnZMajY3R3pXYkRWVUhNVzllZXJzRVRtRUxRQzhxSkgrdUlmL2pr?=
 =?utf-8?B?anNLcVVBZnBDUWoyR3hTaHVEc05TY1FSd2JFc1FyNFpsVDgxT3JGZExJaTRy?=
 =?utf-8?B?YTBPWk5oVDh0d1ZXL2x3N0tFWERqWGwvTFFpRFRmcmRFcDYweGJUYm9nMytp?=
 =?utf-8?B?cGNzMldrK1R2Myt2YnBKZTlmN1pGU1Rld3JiclFrZmc4UkNsWC9LSGt4OERE?=
 =?utf-8?B?TFd1Vms2MndvS1Q1UVBSVDZPUmw4L3g2a2tNdzgrZiswTElEdnozSFl3Yndv?=
 =?utf-8?B?RDkwKzdCRTlrNEVPUm4wdmFrOERMeUVxMlk4UWp6VGxtb256bnBWcmdKcitC?=
 =?utf-8?B?ci9ITTVUbGE3QjVMaFMzRVo4VHR1SDFUckUvaWZ3aXlSaHpVa2J1REJDdVNt?=
 =?utf-8?B?am44c2lhTjRvcE5Kb0ZjenQ4bVdhNkIyc1RkT0MwbytpQ0VHdjJuMXdoVzJu?=
 =?utf-8?B?emx2aGZhTnhkbloxMUpsNlVkTHhOc0tjeDV0Z0tPNk5DNTZ1KzY2Q1FoSUdW?=
 =?utf-8?B?WmZwQVIwMDVZbWhuUktlU2tHZDJkcWprWWhRSW9CM1RPdC9ZWmdPR0lvV01E?=
 =?utf-8?B?UU1kazVvanRCb2UwcjU4SWFDa2x0QU9SbGZhaFFRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867b7f46-a22d-4ec2-7b6c-08d8c2a423f5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 09:15:50.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Oxug6JiLF1ev9PnhhWpG8jhIXY30d+iGq2RfgmzkUhXuauCV25ciDtGxCXHsh/EbzsyBWMJJKf7Xq/ZwdomVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 05:57:49PM +0100, Jan Beulich wrote:
> On 26.01.2021 14:45, Roger Pau Monne wrote:
> > When pins are cleared from either ISR or IRR as part of the
> > initialization sequence forward the clearing of those pins to the dpci
> > EOI handler, as it is equivalent to an EOI. Not doing so can bring the
> > interrupt controller state out of sync with the dpci handling logic,
> > that expects a notification when a pin has been EOI'ed.
> > 
> > Fixes: 7b3cb5e5416 ('IRQ injection changes for HVM PCI passthru.')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> As said before, under the assumption that the clearing of IRR
> and ISR that we do is correct, I agree with the change. I'd
> like to give it some time though before giving my R-b here, for
> the inquiry to hopefully get answered. After all there's still
> the possibility of us needing to instead squash that clearing
> (which then would seem to result in getting things in sync the
> other way around).

OK, let's wait a bit to see what Intel replies. I assume this would
qualify as a bugfix for getting it committed later?

Thanks, Roger.

