Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D350E6C323D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512614.792621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebep-00089n-6z; Tue, 21 Mar 2023 13:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512614.792621; Tue, 21 Mar 2023 13:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebep-000872-3V; Tue, 21 Mar 2023 13:04:07 +0000
Received: by outflank-mailman (input) for mailman id 512614;
 Tue, 21 Mar 2023 13:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peben-00086u-44
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:04:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8e35107-c7e8-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 14:04:01 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 PH0PR12MB5451.namprd12.prod.outlook.com (2603:10b6:510:ee::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 13:03:58 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:03:58 +0000
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
X-Inumbo-ID: d8e35107-c7e8-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZFNFoMG4EkrVY94BOq09YUIbFxNy6lsKchTHeFAXXrsf7Ydz1REeoeWQt8bYcb7+B9pSekqL+GQbOZjrj9qa6Ob9pdd1OFG5rxZ5jQbxmeWYXAChCHrbPdph8qij3c1QbOB4+IMX5wU3GCuc6GPk2ymAMCRykfETUez5fj59uqe+kBJWZ6k85yh/K8ojY6aDiVODIZ5E8RLqapZmhgAYUZNs8fLNKZdns9Y+K7tdvpYSn8fN+fSuOlTnvLug/rsjahxPyiGvHb7CJtHskV+yLQtm755rDDcBWpRO8ucjFO1cdqbBnJw7SOpmozYbWqCc3xe50BQkeAnI6UNdhgCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNsBw1f0c9VM2c4M+5DsjAFNfnwqeTLoDS+Q9oCWx/U=;
 b=TSaZwo8Bzuz98gNQUnearfNztrF42Gb6y1xg7b+kSyPIwK+y53CRG+gEeFdCS1/mjugjHVNC4B8qT+5rQcdV3Xvy+jIrwLcdULTGxNBUTqwOp6eY/XkOwr95lPra2jODmR0r0DSHVLn9iqq4RIgNzQF9KoZ8ziuesnOXG2Bu5KlWAnvsF6y1dSd3z9SwCKi1hZv99EKLeplFGgOKhQvKiumQO+mBE0OlZIGLndUP3B+ayAyJ1h+pys3BEa4OB+zN3Kc5lnetAEBeGyD3Y53h3pN14QfYGfth2dgGhx0vlyXlVbGES6SwOZtX12SaMFwxhx9G+2rS+MW0ClJdH0g/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNsBw1f0c9VM2c4M+5DsjAFNfnwqeTLoDS+Q9oCWx/U=;
 b=ql4uPnRTPbaT7p3y1gzIHe0IMkaJhuxE9m279NoCWo24xE0pX6ofYw3yQxtV08tP8auxUtx1Svuw8hGNkp6cAbb7cYZSXSbSTsByLRJ62bYwQLlO9VQ8LFv48VFHwZO9YoQZd9geHG4AYdV8gt3BGiMR9j+O2nDMwF350rQN/Ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 21:03:31 +0800
From: Huang Rui <ray.huang@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZBmrI3wrrwsK5Q+0@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
 <ZBmZxnyZWrni57Ry@amd.com>
 <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|PH0PR12MB5451:EE_
X-MS-Office365-Filtering-Correlation-Id: 78611c81-86fe-4e69-e277-08db2a0cbbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+z/xr6i2SSthK7hodvQT41ZHnTr2Ypsaig/fYIKfc0umoqKwJS3lJlDwsWa/oYDP3rlz1XLy5ZfVj3c1VcabQMa49A3HRzFz0b5pT2Qgkdz9zfR7dNnL2oks+4KjcgTyLmLO/q37/dAFXutaWmSW3tB5lvP/zbwH/IBIbiusXN5q45pF/Zs8z7FcTnSumPf9QuhekXS7SfMpGHvvz0fHrAfxWbgKUbdjPQEOyBTHBUaAW0VlthJJrqbl+cDoynOjbXz6HWaRtIOHFRgqdsWOFukv93tkLDTf1iDzG22+V5u6ima4I8neC8bl4TmfLw3MqS/Jw4egSlLgDdT2GsUybjmLnX+HB34G8+l6rGjhNQX0eiSg4mQXkHSqUc8L4usLMEjMNNj608Es/Xf1C5Mf+yZ4JyjrqgDmFrNyhAll8tydbGN93n2C1Fij+59lUhhl8e4m03W6xNQJiYt75izf5RFR1axKBS33/340b+e6IswzsOxAIJOeZBioKQJCt6f8WOZE5v0uvgkkKTnnX+kQJaG0166woMeWPDVngQKj78gsZ3Gi4ayl9jDEyffocS+y8kRq+Gb9fn7BsgMOGjASleyVWE5Nvnp3dLoZD4V24ZS5lWt5HP5gHEYb/K5xQYZhO+B0XAx859Qv72eaBeSkH8wkO/gjxOkkUa21+EptXDeUJsLfxk6tc7/B0BaN4g+/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(83380400001)(2616005)(38100700002)(86362001)(66476007)(6486002)(66946007)(54906003)(41300700001)(66556008)(36756003)(8936002)(8676002)(6916009)(2906002)(5660300002)(4744005)(186003)(4326008)(26005)(478600001)(316002)(6512007)(53546011)(6506007)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jz+K/YwArp7Ljhey2EowOkvpTELtWQgor1LpkWIPPE2BJJiWvDxpIcoheuyI?=
 =?us-ascii?Q?OgtF+SlJ5OdJbJE5hV1FZsOIje9xAQhBuFwcqqzz/OiFq1j2ub8Amj61ci14?=
 =?us-ascii?Q?1nULoYncj3rziw9vVK8/yBtCSt0elJagFMmuRZh37MD2y43LZxf413n0fhI/?=
 =?us-ascii?Q?A0+DSyYyUk/20077JcJ/TO6kKkkuHc3SKlWytfijBx6fK8kGLieVGtpeE9iz?=
 =?us-ascii?Q?qjeUQs1EsBldADf2DrUyJFa6J7YEYdIYZ9aeYA+GmZ6Lf82fh9oXT/WksA+f?=
 =?us-ascii?Q?ykL0q0Yp/VL1d4Mr0o9uWjdDnU+yVs95tcBx17xfVKx2ZNwFSRUTkI0p4t1+?=
 =?us-ascii?Q?WprTyGQUmlOUIogPGBHwAQif7jrqWuufK78IUsiWvw84EGFY6hFbwWiyPRUZ?=
 =?us-ascii?Q?atqTlb9Q7K4MoECqtDDae00qjkzD9p5umWZjBglD/YBA5RqaF3UOhugV1ZPe?=
 =?us-ascii?Q?rqgZfsGVa+a2Ls2JEC2086M1JDt1MlfU2zBv+sHkgwmTbooQTDFzDf9UI6Ix?=
 =?us-ascii?Q?j6MjHfMHfddSODHUgm/yRwN/k+Qd0amlQvEPR8sbMVZ49WA2SVO9eVFNCvZk?=
 =?us-ascii?Q?k58ixHJZoPdN3uPwxRXEK1WITkR4CIPb0q0urIFey8mmWYtkbTV7PFaHCk/b?=
 =?us-ascii?Q?xrEQrEBF2jG3ufxL+JZ3ztBUdm/zMVFomTnM7lRK8fhselJ2BQ1aOKvOVrB8?=
 =?us-ascii?Q?UmPV421qlAnihMYiLSfVcnVrLZ7JLcDGtekxTU20pT6cE9tonY8NCwbOQi8M?=
 =?us-ascii?Q?4sfKFUnq5ESu9H1AwzczIwvwvtfRIGvTU79NIEtO4rD6WS8YEoenEgJ+xg4c?=
 =?us-ascii?Q?zjFEQxAI3neZS1YmST+T1JWNcA8+SQ8DspTsYeo4Tv+tHoLrySue8Xme4e+s?=
 =?us-ascii?Q?XgUoZe+n5kw1Gx+qk70UKVicrAMCoDtaNAWJNySDHCPTHwJnKou33u/4zVIh?=
 =?us-ascii?Q?9tSLuhllxWUnV2tGoDVDn4sxraelQiOBLAEqGyfskvn/JK3/3dhl7KKQCkqy?=
 =?us-ascii?Q?DIT1ROAjo7bIOIWRBcseso1qsojvPpVJCyv4QcMHMbuJ9NyzjybZkCZYUg0A?=
 =?us-ascii?Q?ePeOGBg19Lu/MC2oH5oVvF2cwvoji69muNl05wEHc5SIPZxYg8So/gANTkJX?=
 =?us-ascii?Q?ovQ1lzwgs6cMhZ0hSK5nDjLJ7//601ATKYVtNqU55+WbYge/XvWgbm47Unvj?=
 =?us-ascii?Q?N2XifMmWs+H7C5T9yyNdtMDAnspGtVi9PHHlHlUqycUHeScZXX7VrzemV962?=
 =?us-ascii?Q?MQkr2zZasgDHzCLvjTTApNVn2sv4ziUYIMnKwIijiytLwjkA5h3G/0LBNuOr?=
 =?us-ascii?Q?y6AaPqkd+LcSwucVEykNypGKHFBF+srPV5CHhNdtw4wHMLT0b82vtZ0bDSdN?=
 =?us-ascii?Q?Um5xCB+rHXXb1DGWSv1NYpVPmMEtooAgp0F6qRsYCRp2jwSPr9Vt66q8jgIx?=
 =?us-ascii?Q?SJRbhWv9hDJqosoOzZZgtdF3er2TdGDYY/REJfr1NJggKnRIkwUa9HevM5Uj?=
 =?us-ascii?Q?iW60n0BmPNj30R352PbPtbN8a1iybz1VxsIrAQ+MkbJDrwVUFNZwigXB5Y+W?=
 =?us-ascii?Q?xH0KuTozPHTINrN3e0XkSFf47QRSxxzZ/wOz8+ft?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78611c81-86fe-4e69-e277-08db2a0cbbb7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 13:03:58.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hby9UtYHWHofbebKzWBrL3zHXE5/oNn/6Fe+JTCcRKO799mZuqPxrT5YfNTOkpm7bsaPa4g3CKAv4wJuDr9UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5451

On Tue, Mar 21, 2023 at 08:27:21PM +0800, Jan Beulich wrote:
> On 21.03.2023 12:49, Huang Rui wrote:
> > Thanks, but we found if dom0 is PV domain, the passthrough device will
> > access this function to write the real bar.
> 
> Can you please be quite a bit more detailed about this? The specific code
> paths taken (in upstream software) to result in such would of of interest.
> 

yes, please wait for a moment. let me capture a trace dump in my side.

Thanks,
Ray

