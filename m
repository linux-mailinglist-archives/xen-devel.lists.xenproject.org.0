Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC87923E6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 17:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595757.929366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXtD-00064X-JT; Tue, 05 Sep 2023 15:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595757.929366; Tue, 05 Sep 2023 15:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdXtD-00061g-Ff; Tue, 05 Sep 2023 15:22:51 +0000
Received: by outflank-mailman (input) for mailman id 595757;
 Tue, 05 Sep 2023 15:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JXF+=EV=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdXtB-00061Y-ON
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 15:22:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11495ae0-4c00-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 17:22:48 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 15:22:42 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 15:22:42 +0000
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
X-Inumbo-ID: 11495ae0-4c00-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jw0VTKN0qBaN372W/HMTYlDdSDoSGegSMIht9ctozb4ldXxdFBxZhzuYntnGZlatAHaGgS8PdLMiXwk//rRsk6jm2bQkGyIBLHldxVD1vw+X+ElQUrXg8BRucnZpUBSgzbVpYuD6KMoPW3N9Hv/4nEhJtK8b/HSmaiDp76lHnkESK/WjYggNip4Zi/7F/scAN3gJC4xJFv52yFJJrHXhqETeFjX+elEQum9uZ3KdKQxO7NRBHuNXLPLnFrkO0WoUDorVt8eps5+WUzQ2D9vcbY11AM6UGUXN/sGJaG0Y0i4o8V3+fY82LWdeVoiHFRpl54exB6iozcWK3F2kQYIXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7IyLr8CHuhpDduBWOMWoe1GGPPTXFXEx9y4UKXR5lw=;
 b=JaaMrWmHhz4fHy8RuipDz4PMbZ0j4TyAcay2YtjCawmHrvL2JVN5Wkbqe+FfCi68yuxo4/I7W7lbYybKFfyjDws9nTbjs3lldWAsJJJVCjsc+t2774d5xZL2HPsgELmkszYpmpnoJQUwVVK3d9zYQJ0+QksWxrWM9AVEN+6Qy4QX3KwYeLSum/fttUIw/Nad9av74LgZSbMVoBZYIPhEpgz36rMFwVbR3s7VvkB2BpYJqs3z1kqTwly4fBeGvbA/d2mi52SuSYt4YlclW/Oeo0Zi0D/+ilaXhf0piojoBRA5Liu2q3zn4yWxX0T25Ltpkvy5BvwL0vghxCIWIpqKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7IyLr8CHuhpDduBWOMWoe1GGPPTXFXEx9y4UKXR5lw=;
 b=5acgDSIBAuVwFy/wuG7bsSx0X76ExKFgMm5pg2+5UWlvPrzJPphQsjxJ0y6uV4KskzV5AsnrSrBYTTRiSBwstxBmqoF271U7WoLUD5asdTZuzhx8dFoALhQVSY0xjRWLPwqm9AM7zkjOUP9KpB+izqSp+o7+23wqg4CyWGIY1FQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 5 Sep 2023 11:22:33 -0400
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org,
	Rahul Singh <rahul.singh@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v11 12/20] xen/smmu: Add remove_device callback for
 smmu_iommu ops
Message-ID: <ZPdHuVUOqjmdEWdD@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
 <20230901045947.32351-13-vikram.garhwal@amd.com>
 <dca9c2b9-aeaf-3628-de2a-846e1b92a0c4@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dca9c2b9-aeaf-3628-de2a-846e1b92a0c4@amd.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4cae4d-3a95-4173-7545-08dbae23f2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kPCMZ8+dnJSuPPeEFJb9BUtZBUABVk8FpNXw+YJJJ5Si+RjEyb1ORApJJYviTEQcNR4lrNKePRmmBHE2SOrYQidCuoGu5s90/B6xpgc4A/kNZ3kcfJbbN8y8ebOswKj1GFKSKY8/OsL9DCIWG7SpFpCh7kMVj38oISj8oueN1B6JoRinP4/EYJXyI2QAAXIJspAFZGEhfT2EV2rfGtcZEvlKY3pwpaBn436ehJxY9l+IyEG5qWw0xeNcFS3kD2JWonxPRVXZ2y3NK3x6uSuF5hhYMTiewWDMqVDq0qv7Vupo4vvH+Wv9EewlYRI8cO+3ggTnBfSU8PeMMVGrJk5KElwYPDEmhl9Janmx7QhxRPe8CykhFFCw0Gm00TKXf6dlf+2e4nhio/dC7c9cb9SZGyidM2blb92umCdEUnZNQz0mEzBSBhHBYDc+AE4PE9bcigMObhg+Ymh2yy6sHji1jGSHBWhhCmKwM2/dKfjqBTinAzPotJ7+DmTi/LTYgsSFBAKkVCFIIj3wnB8qdi2lfM3XHHP6QR7+VjBgQf0q0MxykuB13h3g0LTlLvr2lwVJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(396003)(346002)(186009)(1800799009)(451199024)(26005)(4744005)(2906002)(8676002)(8936002)(53546011)(6512007)(2616005)(6486002)(6506007)(86362001)(36756003)(44832011)(38100700002)(5660300002)(478600001)(6666004)(4326008)(6862004)(6636002)(316002)(37006003)(66556008)(66476007)(66946007)(54906003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTBUU1NUVVRMQUNxcVMvVElrOVVRY25OeXVMRFFYU2pDR05sN3JKUWh5U2oz?=
 =?utf-8?B?UHlIS01JQ3JLWDk4bEVpWkZjNkYvQmxjanE4bGIwU3FJNWxOUWdZT05KaTFZ?=
 =?utf-8?B?NCtCQnU1Um0zN2ZydUZVWVhXNEp2MmFPc0NNbVBPaDk2cnZjVmVnNmN2K3px?=
 =?utf-8?B?OENKYXc0MGd0RmRJTUQ1aXRaSER4anlrWVRNRTNod1EyQVhtWVJzdHE4QjNF?=
 =?utf-8?B?TzkyaFNGYnB4cGxqKzNrOVFOSlBmbjJKM3k4dlVvK1c0STVrZUpJM1RTdGJp?=
 =?utf-8?B?Zk1wV1hma25Yb0FJbFZGYzJKR01LYmUyN1ZKbCtZRFZoTnRrNUxqNlpPY0tP?=
 =?utf-8?B?T3RhVnFueEZzUURqK05oemU2S2doWnN2eWxvWUs3VXlYMnptZ083WFpCTCtP?=
 =?utf-8?B?aS9uMU9OTnkrY1hRRjB0eU56Szg4c0pXc1hNY3A1K2h0ZXJDMmxsS21DWmZW?=
 =?utf-8?B?bzlwMGErV1BOM1VCOVQxNGFkK2t2eWg5Zk9yUFlBVVJLUHg3Mnl5aXZENG9D?=
 =?utf-8?B?YWhISWY1ODRTOEVWQ3pUdms2YUJFR01waklqdFBwbjdSeFZEMXpoV2ZaQ3g5?=
 =?utf-8?B?aWtTVlI1Y1dpMEdsanVneHQzYmZMTGllYTNZM1BLNW03aUluSUFoSW5odG5W?=
 =?utf-8?B?M2wvZmU2dGtjYTQvdXZzanN3R0dSalJFTis1RzByUTVZT0pKRHlIbFZrVkFF?=
 =?utf-8?B?aExHN1lsU25xdytOeVpxQnpGRWs2NzhrVGVwOXdxK2tMLzkyekZwZEsxajdw?=
 =?utf-8?B?c1ZZRzQ4dVlJSHNsTE4yOHUzalBtOTFqQ0RPYUZwb2wxdzV3SEtwcWFXaWpU?=
 =?utf-8?B?dHNDYUxhNVpkYkFVMWlVOTIzV08yNERJOTUyOTZSeUZ4NlVSSEJ2SWhGNGtM?=
 =?utf-8?B?L1JXa2piL0kzTnNjSHl4RXVFUWp3QmhpemgzY1lYMlNWR2ZoTDBVdFVNL3hv?=
 =?utf-8?B?R21waXU2VkVGUTlYcTZRdWtEUTFKQTZmZlZoV0Z2em50NXU5QjRFM0pxbGMw?=
 =?utf-8?B?cFplb1d1d2ZzNzVhOFdncWNBWnpBY1Ridzd1UVlUc0pPU0wwL0lnVk9ndnZo?=
 =?utf-8?B?Qmk2YzUyZVdhcU9hVGxJTkw2ZXRyUEhCUnd6bUt1RllDbEcySjAzeTVoc0hM?=
 =?utf-8?B?YVNMNnRCTFNxNzc0cmhRVkFTMUM3RHo3RVZrSUdWOXNWb2RLdHJMeHJ1bjkx?=
 =?utf-8?B?RzZHY05LMmxncTlRdG1LeVQ1NTRoMjlQTXVlOVpUSTlwdFpZVVlOamdTbDF5?=
 =?utf-8?B?UlFCRDdNSTRjYnF1bDFMUktBOEVPV2lHYjIycHlURXIxWWQ2SVNodDRxL2Uy?=
 =?utf-8?B?SHpBQVZ6aUp6d2ZGVGxzdWtITGlYc3VvZmszL29PZ1FPaGM4QWo4c2NXVVNw?=
 =?utf-8?B?aHNxeFZmVEJuYk0wUE5IeVQza1M1WTZQYVBycld1YzM1M1VnM2J2VjM2VUdl?=
 =?utf-8?B?aWU1bWFtUVhKdEVja1NKOWZFcWFQR21acStHRUlWTmVFaDFTbDlOc2NVUFpC?=
 =?utf-8?B?aHIzdjc2QTdWTGpnY0wwei9HY0JPeVlLdnJSZnpQYW43WFhHWmJjTWtYbldl?=
 =?utf-8?B?YytEQjBOdjZJeWd0RnRsbnNoOXpIbUoxdzEwTEoyUWZ6K2lBRG1pWDVvUHZq?=
 =?utf-8?B?QlVtREpESDZ2VEJVL1pXSzhFamN4dEQySW8ya0dIYUlCaUZ2aklScDAzdjJY?=
 =?utf-8?B?NzRDREMxQ3lkV3I0TDJOOU0yVzdWUnRVYmdVTVlRbUVITHlTQkF4TVlDUEdO?=
 =?utf-8?B?N3FjaGRRaVBnQjlEYWZHRnM2NXJOb0x3TFNST0NpV1R3ZDBrdklacVZqNDNX?=
 =?utf-8?B?NGlsdmF2cFF2aXFLNW1UT005dlM0NEwxYkZ4YTZVL3BWSG1KL2dpNFpKNTFT?=
 =?utf-8?B?NlVGd3pTTzVBd0RFR3F4L1Q1dDg3STF0QjdpdE5PcUcxRFZUWDAvQXZ6Vlo1?=
 =?utf-8?B?SFV2czJCcmJVNXI2Z0lhRmJxbnNad2Zrc1I4UG0zQk5xOHdxZHdwY1pUcHFx?=
 =?utf-8?B?cTIwNlFSU1hSMTlncW5pNlV4dm5ZeXd6NUhINkFLRkZjOG5jNThsVENwZ2hy?=
 =?utf-8?B?M3JFQWdtbWJ2RFRVNkxkbEhMZXpSaThHbEhadU5iYWpmQUxvdjZtWkJ3NFJU?=
 =?utf-8?Q?i1vMMvXbBnMp/fry+mT/cUl84?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4cae4d-3a95-4173-7545-08dbae23f2c2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 15:22:42.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I7quiGy0CeMikIglQoRJU+jWk+lhgTfvogpzk++7G0ss6lIjZLjeCOCu68HtJ2CL+FlwXvXZO4cuHkNW/jIXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974

Hi Michal, 
On Mon, Sep 04, 2023 at 12:38:01PM +0200, Michal Orzel wrote:
> 
> 
> On 01/09/2023 06:59, Vikram Garhwal wrote:
> > Add remove_device callback for removing the device entry from smmu-master using
> > following steps:
> > 1. Find if SMMU master exists for the device node.
> > 2. Check if device is currently in use.
> Just like in v10: you are not checking it. I asked you to add a check following Julien suggestion
> but you did not reply to it. Even if you do not want to add this extra layer of protection, you
> should mention that you rely on a check in iommu_remove_dt_device() instead. You can wait for Stefano
> to give his opinion (and possibly ack this patch as is).
> 
Caller checks it already so that was the reason for not adding here. IIUC, Stefano
was okay with v10 patch so that's why i didn't make changes.

> ~Michal

