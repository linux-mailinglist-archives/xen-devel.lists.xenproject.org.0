Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3CD6C31EE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512598.792585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebK9-00042V-QV; Tue, 21 Mar 2023 12:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512598.792585; Tue, 21 Mar 2023 12:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebK9-00040o-NN; Tue, 21 Mar 2023 12:42:45 +0000
Received: by outflank-mailman (input) for mailman id 512598;
 Tue, 21 Mar 2023 12:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pebK8-00040i-QQ
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 12:42:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deeae6dc-c7e5-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 13:42:43 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 12:42:38 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:42:38 +0000
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
X-Inumbo-ID: deeae6dc-c7e5-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxWJNcBhHBVfAFlI+eE461b/2/ulFVZFyXS5W4jT8Gvs0ccAXZ9mrrYfEosXJbvqD4+xMIZiRK5oAl1qPEe/e7VKWpUPlP7YAy+rKs54jREMo9Vm3YENZD+uAzS3ZauFJo+PK+X2A4f9XdTjdttvEB8/DNq5oxv/i89RFlVGNwIVI8O4qaPBwn8JSAX/dwojp3+UiBK9ExRFEZKDa0sJ0EV7j6p/xJMGKpfPFG/Z7SdApAM9w+ctee+Y+FSr20Nj+3VhQ5n0bA2t66MSvy3NJqv5LGSpEeoArzDF2IrU6tENUSRKoqchrOraROxsyWqr9/ITwEAIhpkM8XkzqutsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNQqY1lHRIpnYmj/0DUh7O3AApFcb0K1Mt8IbaocVko=;
 b=bca0qf1SGcl+6N53CiBbQN8XpvvAVWyjE2s56vJaQTcqG38XeNQTmXYAiBl/+uE7jfsTMtTOMjwtSDZwUgmONyCyS550D6X0KKPvAXpotpqc7zhV0zOcR1qfYEbdrE5C5dw5sppwMyhnfcNFu68GQ88F5BOFZxmtoxSI6OCs5yAEjkz5izOWgs+oYDlmCKL46FXUar4qWTsAD17HrhO8E2Q4OIZ0mu2+mz9Gex4DvQIpFeXNhDoaxl31PkQtQQmSM361HgA+wzLJltZ1/YsxW3H3feAnkI4IxZAm6x9ZdI1zacA1pXQjoxZG1GaNnebaOImifAQfsFAV0Wr+TeFSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNQqY1lHRIpnYmj/0DUh7O3AApFcb0K1Mt8IbaocVko=;
 b=SwcBpsI0pMOZ3gDAxjfj+XQ5jq5RbStZqmlLUtbCzoD9IUNIEMaObMSzJXsByjtFnVIk8GTPN99/sztDKBJ3h9zR878e3EpKcw3WGSuetxAXrh2aAMrx8GjPr2sLGT+nM+YM5ilg+cfm26zdL2lk9FTMDfWnHC0w00Zby/STl+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 20:42:10 +0800
From: Huang Rui <ray.huang@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
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
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need
 PHYSDEVOP_setup_gsi call
Message-ID: <ZBmmIhNpEfLsVBQo@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-5-ray.huang@amd.com>
 <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
 <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ad7729-26ab-4eaa-8e32-08db2a09c105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JRVO417ceCHXV+SHTRALRRy5M4fKje/NPPp52v8KfsGIzz0pkQt8PHQ3bcRk1sMErai9m+T6+/yRNXoTGU11b/ZqVUkvcKwVPyvY0TZrUN21wDLuhvJG0w2s4xjP5seU8zxJMpZF/VZLy362tJlo/b9bRQcdvofCFOEQrM5YzMqlIqANLh5DZcWh1p2tdZ2XSxXbBq1XNr4UJ11yMfJxD3qwcSU04Ozp+C/5mxoWE82Ry3zmg+PdepGH6YmV3ZTMDbB5ndfXa/60TmUYN8yf+b7HCKIbO9FONFqDirM5WdAk1pgjni12njFEQ3laCDYyWkFC1Rje9dla8CUQKw1CiuJxZKGqcPcT2LaBoyHoLNOAPjl7PjuDFLt17MukseDAJHrQCn0mDcWdaoPbrLEaturFHA81cWQP8GkMEJWurnY7iG2OgN0A1ptCopLTXTPC5Xg6e2hsEkTsYDPmpH9bAG3uWTne+Z1sIz1Y0mPloHfTvK5+fAWwUgGVjJY7UkRzwnpudkPNioDwFrIYHLR6kHx/HiPzgzF93Styt2ROgAdoxmMq4taTz8rQdjVd/ZBtG2ah2BC49z1L8qS98VPkgl2p8jk5D/VyCnx8Yq7qGgPxseeL+4qsFZ4Bhca09id2edYOfd+Fq2Hee8wOaSeKGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199018)(41300700001)(478600001)(316002)(66946007)(6916009)(8676002)(66476007)(66556008)(4326008)(54906003)(186003)(2616005)(6512007)(26005)(53546011)(6506007)(86362001)(36756003)(6666004)(2906002)(5660300002)(8936002)(4744005)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k8+gzXPHKyzW3QstT8hK4KtoZbpnvZmmJlKxvyCHZhlYiaVh45raflVQqouw?=
 =?us-ascii?Q?NANe0IRJxJZEJ6CjM7X8r8CxvA4dfitjf9isbE33N/rAoM+ggFSOMndt9o+P?=
 =?us-ascii?Q?lqH+XAav5lBFNWfz1vsqmeGSHo0RcueWMkfjNWdTlVrq1xB2Pse9v6WfHQG/?=
 =?us-ascii?Q?2UULSDM6b6XMF1L8kqc9r6+dTOmbRAJdaw2k8tUYvDQryUqEBhHMHR99NvjQ?=
 =?us-ascii?Q?PakJeZim2iz3/wKDPRw4zODo+A66beNbz4YCHw7NeZR0UmjE9V5kUBVVDzoY?=
 =?us-ascii?Q?EauRZPv4Zj7u9C5vXrrB0tQlmjzkNuhrTiTvm/W2PXV2lmC0MRZ75c4Dx38q?=
 =?us-ascii?Q?yLu3nPgTOXkx4+jk0dkJFLJjP3cona/w/3se3RyxLulIlW5fEUJzzbvxwVSG?=
 =?us-ascii?Q?oksWKft8DL+pgb2hZnl4OOn6xtAnT00S0OkBiRDaatvFhM2JWXYV0b9F9CFp?=
 =?us-ascii?Q?zb+phA9KKuj1m2goSj59spefeSfDLrPdtquyhWz4YvJUr1GF5KRryD4NKCEp?=
 =?us-ascii?Q?1ztgqh5VjG8so3AfgpwlC7RmhOkAVgLnT8La5zN1cs5NQq2rz6jElDiPdffe?=
 =?us-ascii?Q?IhOeImOhIXjw7ees/5r6D8+x01ETMXCS1Yi4vUXr+gMv92iwzNRAUn8heBet?=
 =?us-ascii?Q?0mZxsjQpsKeYNntCUtYRNIouLg+vIibG95yYBSu+zOF9eQkQIYJqbURdeUIw?=
 =?us-ascii?Q?CUbgSjrl/AIgP6GfgwyEErTRKIREN/+r16BXzoZ6hGkgtkL4KeiDvF9GdQFj?=
 =?us-ascii?Q?yV+9znfAOaXTXoNVPXV63YXY1h48TJ8DXEXO6ATn9wNJxwVc5EioUPwE9nmZ?=
 =?us-ascii?Q?na2DB7hPha+dZcEk8mUXcHlsiVsJ0H6hDAqbIl0tAa7E1xdRnhjFfcGM4CmN?=
 =?us-ascii?Q?rliwAdChv+Vi61PdHSwXlQCAwXYIRAK/C4JeX3ZHiRNtrKtxd1wU1gjljRqm?=
 =?us-ascii?Q?m3OeaMoAG0y+6HGowzAs/P0emdIW/r6cn/7XaNO9yMqY7yqvQupMce1BmJLb?=
 =?us-ascii?Q?OQAkP5w2XBTSV7UMsZuDRsyAmjE3pSVqgCGm3ppF/bHFTVO4KvL0W2jUSEmM?=
 =?us-ascii?Q?P3whuWCvzlLFUvFngY0673IM6XiFFPkO7MaXhh1cMMnPQ3b/drqY/qES6Djs?=
 =?us-ascii?Q?y3vG9c3t3iDCkp84GCBAe5gi8fSgX7penB5APtLl8h5J78p9v4bn7N0pDZKT?=
 =?us-ascii?Q?EN+8MCg2Y9WClTdbfkf+EYAur1lyi1P1AdeMef7X+ASMQ2ze0wCpF7rZ1iX4?=
 =?us-ascii?Q?Ihe7+Z+trEpvx5y5guKBEwVwI5sUXh/mHQ9wZPdxkkQX+tB9vPnMxj7n/7G+?=
 =?us-ascii?Q?fWY2zRs4BEi9oER+kepZUuWyd9lxI4CSwmClDjKk08BVlTVOHVWad3zqeDXa?=
 =?us-ascii?Q?4eml8KWxsGChyVAEKXm5zTBEzBE2yZZDpnUzKlCg2WA/y9nLPInAPAgV2ZrA?=
 =?us-ascii?Q?U/AyVTloC0iexDCy3DDIGLP9g8M01kWqzFWOaOatZpe+lR4fz1gg7DEyWEJU?=
 =?us-ascii?Q?zRsc1U68aEQCUNvZ8VQ5Ri+6kgqSAc1SwJ+NBqB6JCwNImPEhC7InYc4QSBS?=
 =?us-ascii?Q?wThK0LLI5EohgI0XjlJFiz2Wka/Y4Py2RZWLRVhb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ad7729-26ab-4eaa-8e32-08db2a09c105
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:42:38.6683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q18uJxNk5Jk+UoA3T0YiTZT4MRZGCSI3NiRgTRVupGutBR59aYd3s7clsSZbDRVwBbQICZ2UJr/YRm17YxXrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761

On Thu, Mar 16, 2023 at 01:01:52AM +0800, Andrew Cooper wrote:
> On 14/03/2023 4:30 pm, Jan Beulich wrote:
> > On 12.03.2023 08:54, Huang Rui wrote:
> >> From: Chen Jiqian <Jiqian.Chen@amd.com>
> > An empty description won't do here. First of all you need to address the Why?
> > As already hinted at in the reply to the earlier patch, it looks like you're
> > breaking the intended IRQ model for PVH.
> 
> I think this is rather unfair.
> 
> Until you can point to the document which describes how IRQs are
> intended to work in PVH, I'd say this series is pretty damn good attempt
> to make something that functions, in the absence of any guidance.
> 

Thank you, Andrew! This is the first time we submit Xen patches, any
comments are warm for us. :-)

Thanks,
Ray

