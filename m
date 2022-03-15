Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068294D9D3A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290821.493340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80J-0001g0-Qz; Tue, 15 Mar 2022 14:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290821.493340; Tue, 15 Mar 2022 14:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80J-0001e2-NK; Tue, 15 Mar 2022 14:18:27 +0000
Received: by outflank-mailman (input) for mailman id 290821;
 Tue, 15 Mar 2022 14:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU80I-0001dw-Li
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:18:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c53a3bc3-a46a-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 15:18:24 +0100 (CET)
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
X-Inumbo-ID: c53a3bc3-a46a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647353904;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=tluMWh6jAeaWvyZmULYct3wk37bdHQOQKk1VmBtS/EU=;
  b=DPyUDuT3KWRETXsV7z7Fca0xAK1lgaSmuQPogVl98/tVrI5kaI3mIY6q
   tazeudDVQU3Bu9lVL1pJuB/OWq8LOHGNDS6CsGvzHM1CQJkCR9X63cvFx
   Ae8x55DA9OYG4CCtrRSZPUsOqsd5miQjZKa1oadeFFWd6IVdZ5C+avhoH
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66685535
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jbBnzqx8oeTE+eOSxt16t+cgxirEfRIJ4+MujC+fZmUNrF6WrkUAy
 2YeWT/VPa2LZDP8ct0gaYu+8R5UsJDcx9M2HQZpqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IXhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplp8WIbFYCMbT2vs8ebDYHAzNXFqlN9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J4QTauDP
 JdxhTxHZQ36eiNSNAsuEMw9uduXu3yibnpzgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE9WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYOAuJ1QsY18Tur4anrzFmJFEEvSjVOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSvbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFQHpU
 J8swZT20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mv2svfh4zYp9eI1cFh
 XM/XysKvfe/21PwMcdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0ECbygOHaLqdBPRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:Luukla3JrY3SmL0pZgV71QqjBNEkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWYtN98YhsdcLO7WZVoP0myyXcd2+B4AV7IZmXbUQWTQr1f0Q==
X-IronPort-AV: E=Sophos;i="5.90,183,1643691600"; 
   d="scan'208";a="66685535"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBJaLXkdFWrrBKdyxkk54eAeV0StClXDneqv606POtqfEuzwNnMpNnUFjSdFmdLksJNU8O9oamAScNu42Qmz2DQ4QX4ySkGzRAVOCFDNAJcXzdDwfo48aL8ZNIlNG25xRm+C4d22z4hhnlwRnx082CHw5tZ1tB27/L16gwqWfKXUyzwNAFNBaW2HR5hBYyJ6iqUH5aEv2VdiG6GzpN4boYaHD3X4rV2XxH81yop9jT62q08YmQeTKI/fk9FZfs7d3LXTvcd+aZ8lppM0EDJ5bNt/Aco4Di24pGDZ6zu3FKwv6Xf3xkDUSqnm1cCtTCj0P/lR/lvGNOobM1aN2x/5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg8XsokNI9BTbZP2j0kZdtOCd/WehMCLEDrmvQYDE00=;
 b=T/gpEThYBaBrsfzhOgBfvcGNm9fEI6nOVV7NkMltlpS8lbXoqUEfQqWHfBjvLmq/WU1cwh+JKD48LnU4LgXBXTL4daUiE+ucOnRnUwowIoN+NSOWWa4qSypr5ydS8wPtHAbC1NxFGd/u12r/Olo9QOJxDDLxZDDkmAqJVHpKJB9dsJX109vOIZq70IYscPkK+ZOfTKvhmu4fn9CJPLbLIj8QUMMNA3/fAbPJuz53Eb6wVvUQtO4DuwfwZEk830dD/xYooWdgrcYt5PgA/F7kRpef8o87/RQwUX+1k756ZsAecExPsUqEJJNVe62YzOyuqBSfFGjMLxMuO8vVFGNm7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg8XsokNI9BTbZP2j0kZdtOCd/WehMCLEDrmvQYDE00=;
 b=Um95l9wKzchcvwbW0S66Q80VwLD1ftCyGXyhwpShthRHw3H5KzTh/YFbdNCn3B6gyxdytJ0DvuleX2GyYECkCvD4WBCIclzD17R89k5n0YFuzgcMXM5SdoEtKuiyAA0M5uJtLUOw7O7dOgpQ3mueEUl2k3/QBgmK78dMSiL8vi4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Date: Tue, 15 Mar 2022 15:18:04 +0100
Message-ID: <20220315141807.22770-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ec9e0b0-6cbd-4d5d-0fa2-08da068ea6b5
X-MS-TrafficTypeDiagnostic: CY4PR03MB2902:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB2902E38DB3D47226291770408F109@CY4PR03MB2902.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMUc9ARbg5nq6FfcwARSbood3JFjgiQny7CiNIkN1PD9ih7JzeW5n/g3ddYZr+p28xCCOHGceLdSoB7NhtSn5u7KRRANjzGczJqJfJkP9RhXlfb6QsCMevr/8NAR+tML4/YMxrmWeY3Pe/OE6W8mbqd5bSiE8L0dO/4QnGJGyquFXaYIBnfd2F3NJ/A8q+Mqwz8/+x1K8mOBsK6VykFAB4XeJSgPMmnS8WR37baSK6vhab5gntdfhS6yefkG6v8CjwbYx9WkRIoqhPmfRrIGL9QPtgBjRJpFhgjBhu3rfuH92Lgk4jWgPR+KfL4xSGthY6gjEaOBIdSDHUNUC2vTZFNphGKlFKlZ1iAK7Z3MJpJfQfGwfgQCUftBXSz4/1ewojcxB2o/8SEdKMHiKaop/ctP7s3zwsy0P5j2T/kvvjlK4V5ZRb9Ergqfyr1/TdJ0jljqeyaiYnt2ezQ3p0zuIMQ513qllwXectN9r6NJepnRquEBOAmpQ8iAyKOAFOga39+iRWKqml1u0VRr7BNNRVQG2AtM/XQrxy091LGamMK3Z6KjkIVqblSqZL0x+oHGiHaTFgXZXXSLnKPGahJsGn24eb6pk7oDtluLONj1eVDFXWyYtc7NEsk4MNoLknePsHZccl8cRT0+v747X35pWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(6506007)(38100700002)(8936002)(6486002)(6916009)(8676002)(36756003)(508600001)(82960400001)(186003)(26005)(1076003)(83380400001)(66556008)(66476007)(66946007)(86362001)(6666004)(2906002)(316002)(2616005)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkRqMWsydDlOdDNheVVOKzFmS0pvMG5WL3NmcCtpdStnS01qZkZ3Nyt5akpq?=
 =?utf-8?B?Uk9aYWdSMVlEbjI2dkpHckhzZ0k0M2d0YUYyTHVBcmxRcjAxZ2pNSTZwMGhv?=
 =?utf-8?B?NlhnakxBQTRvbjZmdnZGR0swNmo2bi9iY2I0ejdiNi9qYkswb2gwNU9lQjJn?=
 =?utf-8?B?cFI2Q1NsdEdYSVdtQ3ErT3FmOVlMOGFwYytaWXJZbERmWDNWbmZCVmVnS0hx?=
 =?utf-8?B?VFllQjlmam01NEJHa1RFbzBBYUFXVHdsbEk3aEtJaUk0ekhQeTgremxpcm9D?=
 =?utf-8?B?Zlc2NTFCMXNtUDNlWlBXRkFyUnBncVpURlNVWG5CY3k3cW83T2ZXdDVsbkhO?=
 =?utf-8?B?VGhFV2txdktQa1pIa2NYZHJQWkttZGZEb1ArT0srbC9aRmNTSjFzNlo5a2dm?=
 =?utf-8?B?QkJMRS9kUzVpd0IwcnliTktjZkdrTUtCYjZmcWd1OHc2VEx3K2hROFhhMnlR?=
 =?utf-8?B?Nmw3VTZOc2w1c2VUOEk3ZmNXZnBjYjQ5dFZnUEJnQWJKd0pjVzU5SEFiYXJS?=
 =?utf-8?B?MnpRazVPRHY5SUVpZ3pOcmNTMU1sSVNjSHl2TEhpMS82bkwvNzh0TWplRDRC?=
 =?utf-8?B?YkZYYjJoVEYreXJtNmEydzVzbE1ORkU3NitucTlBNDUrc2piOEpnVHRFakVE?=
 =?utf-8?B?REw2NHJqQmhmOEZGOUZ6MW94alVNKytCYVJLelI4R0JoYW1FQ2ljbG9jdnFU?=
 =?utf-8?B?dHdoVnBreG0vYlI1M1F6TWpIM1lYMXR4TktMUzBMSCtEVVk0aUNmeFhRQVg3?=
 =?utf-8?B?b1RpK1BnSXc3Y2FVOUQ2Y2lvSEpTUi95WjhaTkVUZU5SMkFnNDk2ZFFqN3Ru?=
 =?utf-8?B?bGhjTU1LenR0QTRMK3FONXB5b0lBeXNsK0pqUE03SW1MaHdzeFRweXZMUmsx?=
 =?utf-8?B?YWF6OFdsR1AxemhXaGdHMnp0djhtMENJTUViR3QwdllxV3dSL1JXL3Z0eHFq?=
 =?utf-8?B?ZjI1TGI3WGIwUzVXMUp4ZHA2SXduUFNmVXQ2R0pIU3RIb3llamdaTDdlNktT?=
 =?utf-8?B?TlFDdUhKa3B1SEhLVnhySHN1bWhsNWZOWHBDZUEyaHVYR1dxQkpXRktpanZ0?=
 =?utf-8?B?Z3preVZVeUE0NG11d1J3VUVTNHhyNnAwVXFXc1R6aEcvM0l3U09XYk5zc0pm?=
 =?utf-8?B?YkdTNldML2thamd3cXVsTU0wM2YzV2grNXF2cmxtQkRpUVJueENmcFMyNUp5?=
 =?utf-8?B?aHJHaWN6Wi9ZdlMzYzhsTjl0MFUxRlBEWWs4NkwvVEtjMTAzb1VZcmtoM2g3?=
 =?utf-8?B?TURaQlhNWElRRHY3ditCNWNHNGQxU2RIVzY1YjZWSi9kcmVQZ3MvczU4cXdl?=
 =?utf-8?B?MHZ6MzNTTFVqZS9nT1VKZHRSK2FteExkZ2FaVjNTb3JYc2Y4NjE3QnVxYjhF?=
 =?utf-8?B?S0RlRG1Tb1FFcC85OUNEOHFLTllROEJYS2QzaU9teFp4OExDT1hZSm5HdXQ3?=
 =?utf-8?B?RFVCOUQvV3VLTUd1U3p1LzlUck1GcWFHUzNvLzUxOTVxaGVjTW55RzRtVFZ4?=
 =?utf-8?B?TGdXTjl2a2toTDZjUU5kb2dxd1VpTXBjTWRHRFBJOURreTNEVDgrZGlCa2d0?=
 =?utf-8?B?eUxHV2l1THdnaDBPTnVIdTFReFczMlhDRnd0amowNGY5ZWFCczR3RVFJTzNp?=
 =?utf-8?B?ZW81K0k0MklQZXNHKzlsVk5FRStIY0VWUVV3SDJ0RmZmakI1SHN0dnBHVlZZ?=
 =?utf-8?B?UWJDWUFIQ0pqSElJaDVRUFFDTzd2QmxQZHFjL1QyVWUxb3M0a09KK2lvZDJn?=
 =?utf-8?B?cXFoMUtzNWVwT0RYTDVGOCs3dU5rNFFtb2ZkaWFyMi8zTnAvQ2piTW1kSDVD?=
 =?utf-8?B?ZkZsSUV4UGtQRnFiLzZVZUM3VkdQQ3BnWWJkdkRsZXJGWnFUcXBwaUo5Uk50?=
 =?utf-8?B?NU1RWlVMTVp1bVVGNSsyWnA1eHM3eUtuenBvVUJuUnBVSlpCNUNFcEdKYUE2?=
 =?utf-8?Q?1MkcDhXGJLbtjYShPhYkFjb3QETvnSP4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec9e0b0-6cbd-4d5d-0fa2-08da068ea6b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:18:18.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWanpaslFzZMLnD54U3BSidL2K9GaXk1AZGU9Z2vO9OrrR5yWHRS3tUW92HpBcOx2yeElAsN2CJGtJSQ1GtgXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2902
X-OriginatorOrg: citrix.com

Hello,

The following series implements support for MSR_VIRT_SPEC_CTRL
(VIRT_SSBD) on different AMD CPU families.

Note that the support is added backwards, starting with the newer CPUs
that support MSR_SPEC_CTRL and moving to the older ones either using
MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.

Xen is still free to use it's own SSBD setting, as the selection is
context switched on vm{entry,exit}.

On Zen2 and later, SPEC_CTRL.SSBD exists and should be used in
preference to VIRT_SPEC_CTRL.SSBD.  However, for migration
compatibility, Xen offers VIRT_SSBD to guests (in the max CPUID policy,
not default) implemented in terms of SPEC_CTRL.SSBD.

On Fam15h thru Zen1, Xen exposes VIRT_SSBD to guests by default to
abstract away the model and/or hypervisor specific differences in
MSR_LS_CFG/MSR_VIRT_SPEC_CTRL.

Note that if the hardware itself does offer VIRT_SSBD (ie: very likely
when running virtualized on < Zen2 hardware) and not AMD_SSBD Xen will
allow untrapped access to MSR_VIRT_SPEC_CTRL for HVM guests.

So the implementation of VIRT_SSBD exposed to HVM guests will use one of
the following underlying mechanisms, in the preference order listed
below:

 * SPEC_CTRL.SSBD. (patch 1)
 * VIRT_SPEC_CTRL.SSBD (untrapped). (patch 2).
 * Non-architectural way using LS_CFG. (patch 3)

Thanks, Roger.

Roger Pau Monne (3):
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
  amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

 xen/arch/x86/cpu/amd.c                      | 116 +++++++++++++++++---
 xen/arch/x86/cpuid.c                        |  28 +++++
 xen/arch/x86/hvm/hvm.c                      |   1 +
 xen/arch/x86/hvm/svm/entry.S                |   6 +
 xen/arch/x86/hvm/svm/svm.c                  |  49 +++++++++
 xen/arch/x86/include/asm/amd.h              |   4 +
 xen/arch/x86/include/asm/cpufeatures.h      |   1 +
 xen/arch/x86/include/asm/msr.h              |  14 +++
 xen/arch/x86/msr.c                          |  27 +++++
 xen/arch/x86/spec_ctrl.c                    |  12 +-
 xen/include/public/arch-x86/cpufeatureset.h |   2 +-
 11 files changed, 241 insertions(+), 19 deletions(-)

-- 
2.34.1


