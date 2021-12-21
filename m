Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A647C152
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 15:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250459.431397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfyV-0004QC-32; Tue, 21 Dec 2021 14:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250459.431397; Tue, 21 Dec 2021 14:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzfyU-0004ON-Vq; Tue, 21 Dec 2021 14:18:42 +0000
Received: by outflank-mailman (input) for mailman id 250459;
 Tue, 21 Dec 2021 14:18:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzfyT-0004OF-W0
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 14:18:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55cfce6-6268-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 15:18:40 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-Il-hyxKzPzCwCxp-Co6m7w-1; Tue, 21 Dec 2021 15:18:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.18; Tue, 21 Dec
 2021 14:18:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 14:18:37 +0000
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
X-Inumbo-ID: e55cfce6-6268-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640096320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFdK8Csh04J9ZOQwVZ2hfSpX8LkVbiKpVijZD4+eDvE=;
	b=gbSZ7sWDpIerPDByatlUw0IMVpJYpruYvYutNd9JZVmcsyHPnCHRs8obKIMQBnLE/N5cvh
	+Xk3Zy+yo9yw2/cXfBHqxIeP3yRGa1WMyoSUapSuQBrSACUXcnNyXHxAxg69rb6C6SN/Sl
	9YQ4Vw9naBfe4bngwytPGOz4ca4VV6g=
X-MC-Unique: Il-hyxKzPzCwCxp-Co6m7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLoovx6eqYinrhkzTNrqK/AkNtr+DWcm8et306RjMvJWV6Bd1PvhGxUxVGCdcXtgkgzUQPdp8VoihFDG5+Z0cZcc/Lp4jPr7dCScXbh0UeHTSIimFHL9UcdLOuanN00WLtbXT53megSKhzKoBi7Xx3Zr6nPP8PAB95MlQIre5xLc+xKh7INoMrMBlaFaWcB5nwRp6ghfQJ4mFWSpr5xW6PEYGPXi7pR3wID6UibjJrrUrMnSmD7IhqPkVAX3Uy43obgE40s+BS0qV46hGOx6sAlEOQl5qv4vTqSbp8bAz6siD7DsGs7h9ZX20/mMsUwki4H+t27vjftnbJBRns3aKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFdK8Csh04J9ZOQwVZ2hfSpX8LkVbiKpVijZD4+eDvE=;
 b=ee/uBDHCRgkufvFscn4YhO+eve4ZsyEKRbDafYwvoUXi7p8+uySwbjp1TiWmfH0Ddxfclf4AnpLip9oODZcjaFeH6pdOUByFZrDFDdW9irruLGYtZjly7t4F96Qg8SMtTd/EA/xUhTm5Tg+ABddP24RgdadwcxIHT85MV3zrVmSZlW51WY+vcA1SyEI4K4JwQwsJQOwlMg8+73nCUaSq6xktm3n990r2GwnVytxsSWPf2KrYl63aOtURZ0MZQ4DNlB4riPF0D5KvfPXMfurMdemQJQtbUboiPAt9tNxek7tazvxniJkrtTbXjN8b4u2beA9a8lIXFKqE8wZofLnQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b583cd0-216e-37a9-7f67-ec0e04123f54@suse.com>
Date: Tue, 21 Dec 2021 15:18:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 32/47] build: shuffle main Makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-33-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-33-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0130.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ccedc34-7de6-4ec2-caaf-08d9c48cc767
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233507DF834C3DA4695603D5B37C9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xjv84qtmakrYG2aHXMCDlX12oZAudEzHgazB5dZLa2n/yevFAhGyS4/3yzpcw7lI2H6pxy0icQI5XTTHQV+QMde2GSGzXe9HJMcGLZ62W4vKkSaZG6SR4Uh2bBmUHdkfbIbE1ObobefQ75d5S09peGEP4+OQIj0TDMocAYLHmVp0USoA9KYbFVQa+mstuTrplL0eC8AisgEd35VU31oTaq3elyhKRw0EzU1SmOUxh9J6vBc4gOqWNQwmLFRYIqbQnhuBrwpQAEJny5V8quuNU7KCQZQP3lBfV+vsh81IOjBMGZ10/CiQW+woIKKp6xGRoaDHwW4l20ajp54JbYPO6ZIvJJeI1s0SN18LHdzoHyS8lrYmGS3CcWhskb5mjlu1u9wW/p3VZyuSYhpajXeLx4/LG1tkO9pjs+j8k139RaFAq4QFvAF1Nm6KvDiZ4tp1++1Qv+RxfuCxTsiMgIe2Z3YWk1jJc+12YaLlt5xpz1s66FhCtVX5Z5qM11iVT2mWs4+Ai8ysaK5rEJzf9T1WCGJS7l4zOuacJGqt2b15VaBn0nTKRM8UQa0In/Jja4CQjreHBRmedJ4kgu6WrRf+kIyO+k0IvIcuHJwacGNxou0K8IxNu50NsgwxFRuHr00OXvNrT6yDIl19vs5vSdaY4dRN4eUUp4DD42ID0SWzJLuSX2cW00R0oKS77A1OEmwzZ2NJ02JG46JAuLJPoUQDozrUdHeqDBeBZZXMMNI4UHQ4WsMT8fN5tNyMPAr+Fqy0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(6916009)(8936002)(86362001)(54906003)(2616005)(6506007)(83380400001)(5660300002)(316002)(53546011)(6666004)(4326008)(66946007)(26005)(4744005)(31696002)(6486002)(6512007)(66556008)(66476007)(38100700002)(8676002)(186003)(508600001)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekE4RTNMSXRKNWUxVEhLbTE4ZlJQR1pWL1haUlNwNXlPMGYvWTFVamtaUi94?=
 =?utf-8?B?RHduMUp2WElBNEtwNlpwQ2drVFRIQmZabFJQTktKWnNHU040RVF3QTViL0tG?=
 =?utf-8?B?UjlRNStvK1BrUGlMeTdhd2lyUHVBRXNtZGo1b25TK00rQnVDUFMwUnNOcDZN?=
 =?utf-8?B?aVdGUTd2Vm9IeEF3N0diK3F4U05sQjZiMWcxeElxblFMTjRVcUpxeE1wbkFy?=
 =?utf-8?B?MFVZZjV3MmVSRW9GREI3Uk9RRW0rdGh5QVdETVlpa3VqRzE3aElZdnNTdWxS?=
 =?utf-8?B?TXpEVjNCMFUwazlMNnI0cE5qQXN3ODhKcmhxbXVBSmlKbEVEdXY3aVEyRXVR?=
 =?utf-8?B?aER4Q0htdkp3anBPOUZuY2I3WWNFOUdYN3NNQzN2bFZlSzMwYzA1dFRma2ho?=
 =?utf-8?B?ZUVTaDBic2VmbmMwNmtINklOWmxSeE9ETlkxZjgrNDFBSk0vdEQyZ3lsLzFV?=
 =?utf-8?B?cXJDdzRCTjVrc3BVajlSSURER1lrbFVxZ1pJU0dyMHRPemExTm15Y2VWUVdJ?=
 =?utf-8?B?M3FHUHdMZ1hJOC9ZQzlIdVJ2UFAyeDZicU1VL05rZzlOQ3djUHNMZmRWZXRF?=
 =?utf-8?B?TlJGZDE0YmpjOFFjRWJWazVDcytSSUxrMlpFL2JtWnRTNmNXWkdITTJYb3hh?=
 =?utf-8?B?RWJwWnd5cTMxaHczRGhIUUFDeE13dlRHMzU3RmMzeVVRdXhVZ2pBdlJXRTlB?=
 =?utf-8?B?aWhwK0x2dGkyQUtnVFFwanRyMVFvNFVEbjNGSlJhWVZibzFoanRGams5SUxF?=
 =?utf-8?B?YWo4Z0pSbXE3QXNwZUVmdnA5eFd4Y09PM2NjaGQwVnN6STdZSC8vS0FRMU9Q?=
 =?utf-8?B?OFdLeUlvMW1rZEQ4K3ZxL256U0xhb2lHeW9uaC9NQXR6Q2Q3d1NwQXNnNlFw?=
 =?utf-8?B?ZkJPeDN0YlFweENOSjBNTmVsSHowQ3BtM3dSdkFva0dnS0VVbzRvcGIwYWl0?=
 =?utf-8?B?cDFOQ3JkckJGTW4zRGNpV0dIVEhPbEE5UkdFMFoxZGF0RWhaYWpFRStQL0Q4?=
 =?utf-8?B?L0VqNWdKSHZMbXI5Ui9KeXN2Uk5BZmhpd3BVY2psaFRVT1ZucEVsMEpPSjFm?=
 =?utf-8?B?L1ZKclNYejdaZk10bHhIUGdwTWh2Mi9ZL0E4aExVbHFCUUJaY014dmgrclpL?=
 =?utf-8?B?TURoTTZ4WWs0Ly95QWVpL3pDOXFOM0t5MWVJam9VU0hoemZod29YZXVJQThh?=
 =?utf-8?B?YjQwUzJsSlU3d3hZajRCR1VJMlQ4emF1S1VWS3gwRHUvVlRwdkN2ZXc3NWZV?=
 =?utf-8?B?NkE0a3RYWTZ6VkJrQVdhY1MzYVJRbnpkanJmbjlDb1A1QU9qZDRuVTcxZS94?=
 =?utf-8?B?YWtxOXVIbmdSbC9RYUVPNDBubEJkbU9KVysza0tXNXdnQ1hyMU9zcTZVTHhZ?=
 =?utf-8?B?TndUcWFRUW9CWTVMZDJTVHpVVmFEd2tTcGJmSGFtbjh4OTcyR3g1Y0NNUlcx?=
 =?utf-8?B?V1RUN0E0NlY3alZBV1NMUjF4NHJyNk0yYi9DZzI4ZXRCdXp3SXhxbWMyci9I?=
 =?utf-8?B?TEcxaDZaRDdYbHdiVEJwbzJyQ3VsdldrK0VaU2diaERrR3VYQ2M4MHVBNHUv?=
 =?utf-8?B?cFk4eHg0VWdzS2s2VURFY3ZFRGppMy96Nm1UV2VLRFY5VVFLTXRzVmhvSzk0?=
 =?utf-8?B?Y3FlZ0VOVmp1aDN4M1JlWW9Pb21lRHdWUW50RzFLSnNHc20wS2pmSUtpVjBt?=
 =?utf-8?B?dXBhYXAzU2JPc1ltTTFXWjI4N1kwdzl5dFJ1azJTU2VJZjc4VkQ1dXQ0aFFp?=
 =?utf-8?B?QkFzTDVsRFJsYi9BTGtIWUg0Z3V4dXIwMlZsY0dwYTJpWDc2S05ieEdRTFdo?=
 =?utf-8?B?b2VEUXFnOHcydnNFak5IcDhwTGg1OHhaOWhpdi8zNGlyY2hzVlEyRFJFSGxW?=
 =?utf-8?B?cWRoamJuQ3h5emY4RnJrMFhOV28vUUwwY2svRGJiOFE2UGJVcUY1VUIyU0lI?=
 =?utf-8?B?RUdidk5ZRXJSb3ZpWFlnbW1pRGRjZWRJUyszWndjWkVpSjZVUnhHOUI1cy9j?=
 =?utf-8?B?RFlkcWJ0clBTQVpkTk9ERm9QbkgxVXhpZVhtbDBTQUhXTVFtd3UrZklNRHRS?=
 =?utf-8?B?Y1pqSkJxdGFFREsrMW5uMUxuTVAyTVRmUzlWaTBjdlE0Y1NxRkoxNmZzTXlC?=
 =?utf-8?B?MDA5eS91VUhjT2xKMmlqMnVEU3dMTlA3dERxZWhjVVB6ZlZhUUIyNG9oV1VE?=
 =?utf-8?Q?VgDCkkb3+7VSvQV+2imNaH8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccedc34-7de6-4ec2-caaf-08d9c48cc767
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 14:18:37.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOwUsDJjXHHMPcFtfHaEwL2r4STho2FyU6dp8L265re3/hIljUYGLD8/620pXDrrHI9uf8bMJAUAJgD5Dgeybw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 25.11.2021 14:39, Anthony PERARD wrote:
> Reorganize a bit the Makefile ahead of patch
> "build: adding out-of-tree support to the xen build"

Without you saying so it's not clear why that's good of even
necessary. Moving things around always has the potential of
breaking subtle ordering requirements, so I'd prefer to see
what good the movement does.

Jan


