Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4255A8188A5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:28:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656815.1025259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFa96-00064P-Ob; Tue, 19 Dec 2023 13:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656815.1025259; Tue, 19 Dec 2023 13:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFa96-00061c-L1; Tue, 19 Dec 2023 13:28:28 +0000
Received: by outflank-mailman (input) for mailman id 656815;
 Tue, 19 Dec 2023 13:28:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFa94-00061W-L7
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:28:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e88::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b36b73d-9e72-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 14:28:24 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Tue, 19 Dec
 2023 13:28:19 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 13:28:19 +0000
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
X-Inumbo-ID: 7b36b73d-9e72-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+x5Tz5uDdQAJKkLmZmdnn6kJif37yO5jVERjo9Jl5v6aKskm16IekAyW6IWykO8EJ397cw+qvHgWEjjq3VHwkeDorUwxcP6D3LHVrCbeWjU2aZeNQNcFycZpzbTAwAgDhppD2HWQnmPS8/uoJwU5Jn/I0CrJO5MxGRIex5635fhpP3RxJ5rOFrGsX24wiYxpIOn8jF6saQWpqNJJIms7zFPdwlbECPLP8JI55erwZkLH5kU2I0pIJsxSpI4W7KWdQ8nZj/J+EhFWw9bV7rxqtTWeGtQGD4gNUhAmhtzuEDkIcuxyYZimeeLKglNNgDOfa8/ZMT0U4JkP4Q2UWaK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA9V2cry6lNUc0fzumPIn+mZFn1DBsHLjuOq5S9jt7A=;
 b=OieaD3sXWdqVZietc/scLOXtQErgStvb3a0GKKglvTPy6d9KFtAKEV2FB7YlThCITdopoRPBwQdkJ7bUXq9LbkgqK+Hn9/JteVHLMPwW0suyIKRz9zlcFb4lpBIydJ6bbYvQ8aOa0ZdDYtjsx1u7CGm18aIyxBDKU9zG9ihhyKrV6/NfkFZqKcMIHlNvmqcdmCBDDpcqlQqLIAP73S3YTylNEHWv9XMoZ92xfQTjqsTXbgX9IGYyeRtaJGqsZ44gsPh38mNjkeGbxfW6WEUn4lpEJ5dWVG6Rp8LYc68Q11BNGRe48JdyOeyOdUA+8HhYUSNg7E1p40aHIkdGI3ZKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA9V2cry6lNUc0fzumPIn+mZFn1DBsHLjuOq5S9jt7A=;
 b=jLctgIgsS684GIoCKUYxwi2focCkbgZtFNAD4kKX2Xd3eD76rGmpmZwP5qZhqBfzePNHpBApjZnNdRhn1DDxCwCUAJOnp4ZquBqmLxeLq0OfkWkVLw2vOLczLlJkvHKxJ+1oeZPzTSEGxtRR7T+ACvYSIqCLCnzKs65iEdzP89s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 19 Dec 2023 21:27:54 +0800
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 05/11] virtio-gpu: Introduce virgl_gpu_resource
 structure
Message-ID: <ZYGaWs6OmZpaMH46@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-6-ray.huang@amd.com>
 <3105531c-bfc4-4421-a197-4ab8ddb9f4a5@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3105531c-bfc4-4421-a197-4ab8ddb9f4a5@daynix.com>
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 85cf398d-8981-4541-5c3b-08dc00965d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xg8o2Zio9Fxsu2AAIh7FuHAxuiGYX81ko0W2Ij8+JiHmbRA3XkcZ2EZEV5NhNuv4RW62tqeK2knwmtAJ0aGVyl9Jw18BbmxG6YXFSlz6CfZBdZX770fcjaOmeYS6c04nMdnY9pQyJPD4V1xrPpr9cdJv9oXm9MYQZAs2ZZuUhw3l4EUM59Bg1FPKwMmdOoVqIX0GvLB5mRqbZaw1fA9qu7RnwN4cVouKTXIl51Wms7NjRw7eMFHo8lq2yqujpcWhhUMRuIDMDQeZq/Yx/ig/BNWA3L+SVQpb1mMMsgp9BnzxJPz1HYYQPXXlqBdDr1Bg9PWOZTQrW8ZG58VjNNqFnJG/2MMxFOA3H17MjNliGSjF8T5AzEXdz30kPr+c/+7GKCtSfTrqHaj+k242wjNuJC3QNwn9owbh9Wf7jIWHZxB8XaoCvixX65u7m+R1un6jQ03uPeKccD8TdYnXfqgmzsDTpZAY4SH8NihViVObqShZSpQsxHJdNzyQDUA+YTbubNMlSDL7mCHFo7Yht/jYbGrOdbxuA1bwVBkRLgK2/6YG9MYRZqgQfBrpoU8zenIZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(86362001)(8676002)(8936002)(66476007)(66556008)(7416002)(2906002)(4744005)(6916009)(316002)(54906003)(66946007)(6486002)(4326008)(36756003)(5660300002)(478600001)(53546011)(38100700002)(6666004)(6512007)(6506007)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3A8mODSCOA9MsXwokylT+60WJIzzB86CugdotAVJAoMG9p2lI0K9itu21W3n?=
 =?us-ascii?Q?u+G0b1+SV/qYHaJeJ7OP3flPYyuUtoFG17Q74qE1uIkC+Cgt9mghFwJf2obz?=
 =?us-ascii?Q?zWaP4IVJ3rqaVHg33EbiG6oFkq2ebZZGwA/TjixDXu8KDVPfxq0qOxu7X33K?=
 =?us-ascii?Q?eDJABFBWfEew6KDIucp4WUcp48o5UraFUJc2xNSSGcYa8Au76L7o08FdjHLo?=
 =?us-ascii?Q?1um71el7vmeRm50Oovgxk3Qs+NXTSbpzjSqXS9mLQWsxBEYP9IUA+Iq7Jhn9?=
 =?us-ascii?Q?C2mhEEwMAxznjYikb+JBWErIW1/5j6ts1DMqTICM5rqMS/DxaqASAauE7E+x?=
 =?us-ascii?Q?WiFj2GurUqcX2UrpRKN0FdS9eLdGpgJ66wixM+K3rU5847bfIQE/N9UGR4NG?=
 =?us-ascii?Q?mDn0J3ZjOM8SvPNAAazNx8xHMNlQts96EdCS7lFQKl9cbdCg7dwn32XKWF8Z?=
 =?us-ascii?Q?enSlw/qWnqmmemKQ1yhaGUm4GbRiFf6iPLKAnPOomoSR41nCY82HNfvJizgY?=
 =?us-ascii?Q?ZYYiPlH8w+SdIb2zP2dI95+MwwJIC+/uM6YbFZzsXY6cGntFDWtT6wwE6Lr1?=
 =?us-ascii?Q?QUqn2gKX2j46FdPDXcNuAvvnSrIzyrn+DVEx9bAfiAq2idyFjYX7CIovVt24?=
 =?us-ascii?Q?vWxnF0D0JT+ULuNjKU4fYMI5Q4ZX5fINpkUcy6EL4/3iFwD8JD0eOCxZ5JrF?=
 =?us-ascii?Q?3oQr405xdtbcvZxcjUXWy9EV1Fav1fVPUeBRh+jQms2ZhJ6ubM+e5wGh3jj2?=
 =?us-ascii?Q?d37FTu+7ZWwcG+qOruZM/6LB3q/mqgodPxdkhE2orngYWURJ8X/LGs7FfJ7d?=
 =?us-ascii?Q?FY4UByW904NOYEvxBMa+y55U7wQjlCbPTzTM7h5sZLUiaPNSAGtTjtfkagtn?=
 =?us-ascii?Q?XfkY7WaUV0vBBHvqYOAPeYQZszacEedgKTuOS+pq/MuPgQIwekscZLASCKhx?=
 =?us-ascii?Q?1kKdjMs551MwHd6e6tz3O53/ieFqJ+jEngBIZ1U7N5cgVVpJoxughngFI0BA?=
 =?us-ascii?Q?ZrxXL0372/2vqa1PobTNbbR0hDejcBXeIsgxx6TOpa747B1j9yoCvWeBdDM9?=
 =?us-ascii?Q?s9CbMhkbhSx+NuAY2sMiDmv40R0EQ28aaGq7uF0iPPBXcDWgY/CLjRWtB/Vt?=
 =?us-ascii?Q?amYuzdwcsP7X8gl0Pdxu9S2TzfPzaK4ckBiTo+Ow3ysVJMAlmrztzGkET4dh?=
 =?us-ascii?Q?6tntANCbPjUllCNAk3A99TJfFrbTIwfdT9LEk05YoupgZb51Zw6EfSoMvHfg?=
 =?us-ascii?Q?6WE6aliMKmN1mvTGmAP2/mp9Z82GMOJ+zOpDDjm/bOB0iSDCR7b718mN9R59?=
 =?us-ascii?Q?h97ltN4t/7hVPfQly5aTq5YU+T7ZAWs6Nmdv7gRmcdRkERdAMXkJQ5yZ3xfb?=
 =?us-ascii?Q?FywSzO+t0Dscf7oaK6UygAtjTefKQnDQKnu7Sy/5pJkYEUIaiaTQE8BqKAUT?=
 =?us-ascii?Q?FmQ98LqmbmnuxkSpZS6rdDTM2MGxD8ajHPj8eRymk+SaSVgWDIuAVkwlNXwc?=
 =?us-ascii?Q?jPH2Erp0nLF3VBcHIX53O3IUEONvfL5dnqFywKcw574pF1nOzLmQLrNJluw0?=
 =?us-ascii?Q?cypfOCVDh87VJeVdaEvE7UyLC7da19RS9ZRcx4MC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cf398d-8981-4541-5c3b-08dc00965d97
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 13:28:19.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LojIp1/lrqHWxw/WuDmbix+FRuhDwqKHCoITXlp+1YqXJeDghyJ56gYijiarm5IpubUlV68iWerTX1NgYdZp6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822

On Tue, Dec 19, 2023 at 08:35:27PM +0800, Akihiko Odaki wrote:
> On 2023/12/19 16:53, Huang Rui wrote:
> > Introduce a new virgl_gpu_resource data structure and helper functions
> > for virgl. It's used to add new member which is specific for virgl in
> > following patches of blob memory support.
> 
> The name is ambigious. It should tell that it's specific for virgl.

How about "virgl_resource" which inherits virtio_gpu_simple_resource? But
this name is exactly same with the name in virglrenderer.

Thanks,
Ray

