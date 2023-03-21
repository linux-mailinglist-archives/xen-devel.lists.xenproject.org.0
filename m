Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A89D6C30D1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512376.792395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaV8-0003mv-Vo; Tue, 21 Mar 2023 11:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512376.792395; Tue, 21 Mar 2023 11:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peaV8-0003lm-Rp; Tue, 21 Mar 2023 11:50:02 +0000
Received: by outflank-mailman (input) for mailman id 512376;
 Tue, 21 Mar 2023 11:50:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peaV7-0003bG-SX
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:50:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c17fcf-c7de-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 12:49:59 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 PH7PR12MB6587.namprd12.prod.outlook.com (2603:10b6:510:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 11:49:52 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 11:49:52 +0000
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
X-Inumbo-ID: 80c17fcf-c7de-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pl18X6tIdvTsbHoVWX0/jkeyQwpGnPld5+zAeWI/IZyGWtstIwi0EBQ6tubX3pn6xZO6Lg1CFgIso3xFPS2Va/jHOulBx27jQWgg/gGzFofh9ICr+QdBfDIjAziBZC7wprrk6fjpXzBfEfa7QmFf0Tf9wjeirTeY+VNuKAS1Eu2tqGeKH+ZgPtrEBYVxVL0CPHn4uVknzKQ/cMqa6qnBF/4SXZeT3/yne5tD5kQ70omj6PzgGUbRJQX8RPHVLsZ7LaD1FE7B5BSIAsuGW+ftbwBGSqS9zRKXQnYSXOccDMacgscbQK8cjFlhnozF78AutwRaMGUFf09YjdsP83nqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deYyMrxKmMPRYDfalKKcUxLxBW36RW5FouMROlO/dNc=;
 b=LGykWlWn3XgjUYd3zmUB4hFawrz49+fkxJrcofki4DH0sdycIhglmIUJBh0XYu6piT0NIISu9fr3WOJYfkTOJ96s7sd3mN8M/ajAidt5ycYo3j2DZZAr7N7cP5LPpz/rhZcNA+LdtjO/B23vzy4ai4bGhou36fEplb8mwxGzoNLLnjcmDFf5w7pCq1tXKiuSHjJOtOPqActFWGI02JJQc/Xnc7ZKEBmdhOgE6U8GZ5h9skpKa+BCfStHhBlGhiDen9ZzF/htgZBdAW2/m/9ABVS58UhhTFTcQhaYDzS07b4mkyXXUTgEcd947CT2robvLDgJ6DbX24kFy8xQjtzs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deYyMrxKmMPRYDfalKKcUxLxBW36RW5FouMROlO/dNc=;
 b=eS8rtjsUaIj1cvtFO3IqMbuLADSCA12xCAG2xIizJqP+xTQ+LkOaGdau9MDWmoaidp1vPr5tBt9RPbVlOK5Nxi6VMWAfi+jUi+lmLYLfgYfnp6zzAC4m8YNy6dqcMlfY6msrwU4Wpcya3nc0YwiuSWchnTl43j07MKKv8Q+9dCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 19:49:26 +0800
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
Message-ID: <ZBmZxnyZWrni57Ry@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com>
 <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
 <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cae4e673-65d8-273b-66b8-08d374797da2@suse.com>
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|PH7PR12MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf92983-3b62-4926-893b-08db2a0261f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SRLzvXct8t0maynRUwUHzm6RdzVjBrWGqy8JfrZDapThJZIb3vtZrYFxS9vmlJRfUA59kWg12Jk9nwkDclD+QvpGfDr+TFL4EkV8gtIGCu/U1caLWKCk9e/PlXqYQSRTzNS7X45XX3bImKCuZjnF6AGqYwJoR4HHVVxrxm5EOZ8ZaBsncxh05pFi/KLksAjFN5kbPU7vxSm0cLLdahxsXyPARzAlCURN7xC0MpLGRWOFAnNLSm7DPDIR5m9AxY/jddZilSXwOc3rccXKdPIMiBO2CsXUo4hxUw3jct48Zpv3waN5CzW231hJmLYxbqaY8Sdrf3VX5WbtUE6w4VpBY84MFYwnsTG4ersQ9Qbs8BCaMYdCbOmeLNl//xZfMPst5hb6MocbyoN0n2XlnmXiUeW155DLfOt6uiGXiHk6DVEg884Hvvdmr7elm+RZNkFq1CRJEw5gzOBrE+bslLQMnaPyHJWrtvnjsXXkOwIwkewnP5WqBmgMJgHwlfbLG5d4ND5kY1Rc2F999KsJfISzt6gOepgav7GUYxXjT+VjdxUyk7BCbzHV3jatePxlBlY3Z7MWPFci2uKU07PNVrfej4GozuhxD3kjN/VKy1TcHd5JT/hME9xQh56UxuwsDDjxoO8vGXWAJEbLlIdsd3IrDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199018)(86362001)(38100700002)(83380400001)(6512007)(8676002)(54906003)(316002)(66946007)(41300700001)(36756003)(8936002)(66556008)(5660300002)(6916009)(4326008)(66476007)(2906002)(478600001)(6666004)(2616005)(6506007)(53546011)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CIL1kzDjdYtIkzcgFbWHlQfoP5sEEvbk2QGYWmkH2wTGk7fs55UeyXlCbULH?=
 =?us-ascii?Q?E/J4CN/FmakEGt0SVXab80qtERSqHIFpS3gBLU0TSLXn0PB1fvDLMw/NpJvm?=
 =?us-ascii?Q?R743OEDwvnD0iHqxzY/k6UNcmUttca3Jb6y0eEBb2LTbcvyd8tw3A+hFYKnj?=
 =?us-ascii?Q?pVimGpaRRtTpQu/dlnpq/lnwgIHjq55Yyzc7pb//BQpIqX1l9d5s3vthqPM/?=
 =?us-ascii?Q?jkNWlJ/PnLrQBis1hKxB3O1psVATvadTJMmI8b+sNfPL1kVSV33xkwVwc5H4?=
 =?us-ascii?Q?saxNC1V/b5Adq9zdhRkWdf1qdWBMGs+k3KoA5omKIU4cY8w7vvklq36mQsRn?=
 =?us-ascii?Q?Z34GorWbz7VuDwP+uv3td7F1KMCFAlRIKDRp9LkA1lQC1dYEJbOrjBaCveak?=
 =?us-ascii?Q?tJxDbjQYvqtPRhGhTgM82Fb6ChKTFrFJlNBsiSLVlM4zdkZPOUJ6nwU0vPdT?=
 =?us-ascii?Q?teMlczPTuCF4gefvzzrsI3OJLPd61g1xJf2GXhL5UC/Ex58ISZ39ncncOi0M?=
 =?us-ascii?Q?AWf4bSJBRBGcZxgxgwAXKrQPbk8fLS2FHfLti8g3NTK/Xi6823oWuZjmNOES?=
 =?us-ascii?Q?kUEIwLf/ZphM/DXqiuhRDeOYzUKKEEsctxMyLFIr5D/1X+5Thnw/GKN9kqUb?=
 =?us-ascii?Q?Yk2f3ltZTMC2qzTZfc49pZrB9eKVJqFhq58yjpqO0mKOjw8dx+grqiiJVZMP?=
 =?us-ascii?Q?GzFHf7ojZpEUKr9l4BGBMCNhNqQbU5Jtj3edLJgPRNrXmKEBsjqYGGp5A9lJ?=
 =?us-ascii?Q?VSnJdizGXGlOWlhFr9SUzdEiLijx0TTCzc9vPEEUkS74g/vBVtd2ip7v/F9G?=
 =?us-ascii?Q?j+0HpVHXdOB3TXXRoFPHor20DXFiP0rVZ0GV3VfmKwOM8QkE0Np/MJxCyjJv?=
 =?us-ascii?Q?iGhxtM0NkW59baTZOYHtx0Oc6xFy5nmWTXuqmwcg5m5BwBGOuS81cvEcs5+F?=
 =?us-ascii?Q?rVwvY18BVmQuCrCHyEZbYAwX1TxKUKNOAldgPqEe85cWb03QDJnq9cgDaW63?=
 =?us-ascii?Q?ikzklXSMOFJXnvfkwnPQ3QVn7Z6PNBkWrHU6rUHi3zKazbaegwaJ4TVxilnv?=
 =?us-ascii?Q?AHLohDClequbugEJoTT+I4qnUSIhNjbRx0REnRGoIoNhJVw0Fp/5A9U0nt8s?=
 =?us-ascii?Q?3m/+1KsmuzqECsx5moez/ueEvv10AZ29COzXqF1o/YFc7fP6hx4aD+anOIEh?=
 =?us-ascii?Q?OsfUb1mfGi1P+M4XtUQ+08yY47mKRUmiM/PpVz74Z0v9ZW76MFSTWKmmZsoR?=
 =?us-ascii?Q?T4wkF+0s7fLmBoR1+8LE/EfeSfsJjYUIEwMby0hOp/hqZZUa4JJW/ybdtpL9?=
 =?us-ascii?Q?1W/k4ewRzHjE2g49+N2V5qTC6UOK1/HOt/vPsBL+Aowhrinb3Uxo3YFxwe5B?=
 =?us-ascii?Q?Z6+0UwEXVGb1843QD1fdXdB2bWzVvhTEmXhPGOZLpZS2Jh+tM9cJ3ebR2kNJ?=
 =?us-ascii?Q?mFi8K1a3VAw/cCsVMB78gNgHzO2t/BwI/TOFrBcCLAH1h/CBVBXlzCKuqYFU?=
 =?us-ascii?Q?uhwLHmP+WUtYdexLWTopMsFi/fhmb+CKgjS0KQWNXfcx05CDB1qENw4DIT57?=
 =?us-ascii?Q?rCcxtMo/Ia6YDjo727SCNF88XSMWOhhwg7fi5mXF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf92983-3b62-4926-893b-08db2a0261f7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 11:49:52.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQfUEp3ps8ATbndS4S7AivAE/6BVPnnogJ2i3RvlJBoQXEdwFkPXDDw29Z1hB7yXQepGb0fE0OgndXDphZ3kqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6587

On Tue, Mar 21, 2023 at 06:20:03PM +0800, Jan Beulich wrote:
> On 21.03.2023 11:14, Huang Rui wrote:
> > On Tue, Mar 21, 2023 at 05:41:57PM +0800, Jan Beulich wrote:
> >> On 21.03.2023 10:36, Huang Rui wrote:
> >>> On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
> >>>> On 12.03.2023 08:54, Huang Rui wrote:
> >>>>> --- a/xen/drivers/vpci/header.c
> >>>>> +++ b/xen/drivers/vpci/header.c
> >>>>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
> >>>>>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> >>>>>       * writes as long as the BAR is not mapped into the p2m.
> >>>>>       */
> >>>>> -    if ( bar->enabled )
> >>>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> >>>>>      {
> >>>>>          /* If the value written is the current one avoid printing a warning. */
> >>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> >>>>
> >>>> ... bar->enabled doesn't properly reflect the necessary state? It
> >>>> generally shouldn't be necessary to look at the physical device's
> >>>> state here.
> >>>>
> >>>> Furthermore when you make a change in a case like this, the
> >>>> accompanying comment also needs updating (which might have clarified
> >>>> what, if anything, has been wrong).
> >>>>
> >>>
> >>> That is the problem that we start domU at the first time, the enable flag
> >>> will be set while the passthrough device would like to write the real pcie
> >>> bar on the host.
> >>
> >> A pass-through device (i.e. one already owned by a DomU) should never
> >> be allowed to write to the real BAR. But it's not clear whether I'm not
> >> misinterpreting what you said ...
> >>
> > 
> > OK. Thanks to clarify this. May I know how does a passthrough device modify
> > pci bar with correct behavior on Xen?
> 
> A pass-through device may write to the virtual BAR, changing where in its
> own memory space the MMIO range appears. But it cannot (and may not) alter
> where in host memory space the (physical) MMIO range appears.
> 

Thanks, but we found if dom0 is PV domain, the passthrough device will
access this function to write the real bar.

Thanks,
Ray

