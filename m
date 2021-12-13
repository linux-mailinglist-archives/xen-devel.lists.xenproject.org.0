Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF2472A72
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 11:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245963.424273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwimI-0007ci-LF; Mon, 13 Dec 2021 10:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245963.424273; Mon, 13 Dec 2021 10:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwimI-0007Zf-HH; Mon, 13 Dec 2021 10:41:54 +0000
Received: by outflank-mailman (input) for mailman id 245963;
 Mon, 13 Dec 2021 10:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwimH-0007ZZ-H5
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 10:41:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4894349e-5c01-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 11:41:52 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-dPnismtnNsGmIHMk2X4_rw-1; Mon, 13 Dec 2021 11:41:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 10:41:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 10:41:49 +0000
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
X-Inumbo-ID: 4894349e-5c01-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639392112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gt5Wrpj3bli62eYMBaRyArp6W3jJQ+cMRWxxz5xG4yw=;
	b=n7Y6Groy+nbsdxGkpQ9ArX8j69hiQFLqMbFXSeyprxaCCxbW1GrVHsQe95xXsB0ECxbHAc
	g3IilYR1ggX4eOQXP+/2rpJ651d0f9gM8nPDvkWiaNyOp4sSW3LLMAzSt6020/jMRTOMM0
	SZO2YFUEnuhIABmZ7qqRKNTn2Tbj9Ko=
X-MC-Unique: dPnismtnNsGmIHMk2X4_rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDDSrGf1URAFwQ78YiXfp5x8KjedaeXkO894LtP+yk65OZB9X/fdu+h06wtpqGs3RHSXdykJLhOnURLLz7wPLsrHkx6YVWbHyqM8otMosHvLzJN/ZLnlFFiaXeoABbGUyNM8irQ4e9RvNeO7PdOZv2A/HKWs0sI5pHtO2sEBoaxYq1X07S7PSI34UC4r+tB8GLvfk8mHLA27wcm3nRYF7In9W6eum9/ES3xmKiYe6F/JAlTzGCwZ5Fv6eDFsJKI+Ak8c7wW0lf9SfEiCGNaTbKou6seYG75VaBLHZx2FIDu8oAx7d8lictImqDxRys3bP8I/FmG9O8+RWb3jd+cN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7mJMBykJWmCUntx3UtDwnrciJYkBrAn68YyoT7SlSo=;
 b=EnA+dvV0NT25V6bXo8dGN9t9jl199fX7fd2h76CPpht6TZd4t9pSP941P7ySeaZtskc9GfyO82ZxYAVLje4P08j+qzbn45XilTyDzQoXStWS2Sr7Meo3RV6ADbkhrVxz6xnBjvy+2LZ8fPvoJmnUYb56Npmebj18WvyYzOldfvwjr8m3G0xmmHKZYMJOr7srkaj6PAi2tE51YLvXCWxcNokCiFEOLJwce/ZAD/0Fg/S+HsnAkUUQb6ONv0LA6NaFZiCI56C5YcvtSdIfHIATLhSbOfPG7PWrV5FkO7RGNGZhxPr9dM5SSaljlrjQUTYG29+8sgWO6y+dJYVxT+UHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21694610-178d-42c3-e5db-ee59ad011103@suse.com>
Date: Mon, 13 Dec 2021 11:41:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 12/18] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
 <YbNtBPv1M1lIyEOd@Air-de-Roger>
 <d472fbb5-95f3-dc6b-8103-e7d76e71290a@suse.com>
 <YbcWVRFFXerNqBPy@Air-de-Roger>
 <b766e6a4-3a28-7cd1-b35d-7bd36e80a552@suse.com>
 <YbchcYGImB92onhR@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbchcYGImB92onhR@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0202CA0051.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be56d90-d300-4700-dbd3-08d9be252aaa
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68646A3421EA6FC900A59F0EB3749@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AW6kcQsoY7ZHNvucdX+vYAL9T45ocKRYyFlZCYT0JAlZsfDJM/Y6O7DLhrvwBOMWExU1o2edTpNNPQzMWkJTehsEm6TtD9t8JA+vPyfna/u9WZ+ZLiS9J+WnRBuyzkxcABC0dM9B83ZcX4Kg1f77i5qfDlneoJIFwNOFELEaZmFrJRW7hBicHqgzOEbqXF9HRDTTrQgNskqcmalrOhQ/hyPWQHk3Yaj0nNyDiQ8B0gxsFok1lCB4xunhGOsy1E9XxtVaoDHCdoVfCtujpWREMmWb7zkRzD+oEb5by5QYguqv3qNNao8GWs9xaJDurX1tkuzjMbF9yRZ2MADVUZK2bZznvp0uXsut54YNtPoJX8xt/XU72ePm1yQJtDU9aR2EzYrOpLSBSQrdRunefX/kXfTVII82wjCwkoWEd3W/O8NwnT9ar9KY/BBgfYH9+ATEFXEVpGLMyNicedfkgrB9yZXhoYjjpC54AnobAIsIqBxKSOSYfzkHEGvdUM5fvxWwLKG/qnJ1T8BSMV4E0kUXhYqYl5joLH3cKNbOer4RK84IUuKTsfPRwKVadRPo9VN/A6AEVd/k3KkTI+1c+gTpYfj4y7Yn3TmOyIPblY+h+Tt8gAle8Zhe81sSVJE4cQffpFrIOINipczLuYG8IwBU1kM4pOQB7TGreSOnOTa/0OQIl+FJ1CI/a6DScH/sRpQpJnG3hZPVYhAMtpl1EskPfvwxTjqviKb+OPSPSPjF8XI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(31696002)(66476007)(66556008)(66946007)(2616005)(6666004)(53546011)(26005)(6506007)(8936002)(31686004)(5660300002)(186003)(6486002)(36756003)(6916009)(38100700002)(6512007)(83380400001)(54906003)(86362001)(316002)(508600001)(4744005)(2906002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1nDpQXSDlDLCp8sajN3nwA4/d/s+joqnVZEbw6ra3TfyLr4zlsgO9wjLP3L?=
 =?us-ascii?Q?DlfhwsOg/+PSK4l1u1ltASapDX1BHDyZvI1RPMZoZ0GV2nw72XYdeL0dYzAY?=
 =?us-ascii?Q?jNgwQOTJKH0MU/QKYrD0t2aP2i4grjkNlKJDpVSQOPcdW3VVKf4OuTCu1Ruy?=
 =?us-ascii?Q?E5oVijjpZhFZUn3wlLrOh15By3cg5NaesyxZPkxaPU0cr0rum1qWwL+F5BM0?=
 =?us-ascii?Q?/oDTY1djtKbVE9PngAqYxs1CV+qCXMrNEtaWgSfzJq2vexfjUamiGaDl5Rbo?=
 =?us-ascii?Q?RXbw4DqLyV7sSLEUHwAhFvnEL4uwv5AkEY0tueK1tD8QrmsQhNeGneSyRNMA?=
 =?us-ascii?Q?bsXjfoo6SmT21uDCf9Z7pumQFlyhkd6Ymao5x7herwGRQ69uhV4L3LQMB95Q?=
 =?us-ascii?Q?LxaV8T2skzIij9EJqd0UxtPDZ2N92nw2HPSBPgoWqIN+8X8lN4ZmjqsJqnR1?=
 =?us-ascii?Q?XEU3JGe3rkyVcQ7Sdz67Ej4bpVJS9oefrImaXQvHriuMfJpfW3KaYkmq+9dC?=
 =?us-ascii?Q?jNaj2oF86r2eQthbcqBRuZCkQDIDaC8cj4N4P2pv/lny7h4YVp5YcH6pDErx?=
 =?us-ascii?Q?MzeLB95wE3W6C2mzi0Q5+vUbAYBUkYllKjQEfBPYeFV6rIum0q9vODQTV9L5?=
 =?us-ascii?Q?3TJcDMuRuin+LpFpmNljmSMsBgk0CKHC9vXb2eQo+dm54W7coMfA+RXIGOAb?=
 =?us-ascii?Q?Cef0a5amKfeuf8d0t0m2ENMsZU1EKU+Jzyutm/0JhYas8CZJRuFbnUQUkziT?=
 =?us-ascii?Q?C7rvH0j896PHzR+oF1yoV1sYWqkm1mvHbHn1Fbw/dPqrU3TD24bCQUSOzBBw?=
 =?us-ascii?Q?lbOkkpLX+y+q7Q9kbS259NRNO0+yxPo86MEfTLM+XBZWICJ7Bzuj+oSQj6YD?=
 =?us-ascii?Q?b3OAoK8lQ41i5VuhnlwYwWR77c6HuTOiIxekh+J5K+Atn9yviB8HyNQ7I9fF?=
 =?us-ascii?Q?tMba0sjD+nZATVoph+Ly4bB0RxHWpfPab5NsxIRcnSHbiIi+Ec77gY7ctU9S?=
 =?us-ascii?Q?OLGlalVoOlzkYJkc/W5SBPbf9KdXmqiECvv+c10oDUuYBFavdSSbCVx6lj4B?=
 =?us-ascii?Q?7NIWMxqlE0mLLQFtRBXXFbyGxp3rfdIbxj/bcSHOj5mvUQsfr4Yz9XbiaV75?=
 =?us-ascii?Q?KZHOrVvbNu34MEslMYB+/VsqSfxdIwq4GQc99aALpS9iOmX8OUaObD+vlmhj?=
 =?us-ascii?Q?j76LLCMYHrH0VdWawTyEosW1V6PEGFRBU0evJKm7rtBYdMEnX+o8kxnJAanm?=
 =?us-ascii?Q?+sIE5htFuXUwsUx25KbNgYflCChVQmczkXGjgeVZk9x7pjfg02SewIEn+tzi?=
 =?us-ascii?Q?zgh29eux/zKNyi6s8AL/XxhC/rhcVFCWuEWJni9DmeKcc1cQ4UIYf9CjSHB9?=
 =?us-ascii?Q?ahNeoexw0cfHe/cDzqzLLL08b9O98igblHdXNwVzxHFr/PC8x0PKfJbBxx4o?=
 =?us-ascii?Q?BEOTFgxG6fN+O6nCWc68x+bYSBEkCuulD3/4k8/0LBlaDsjPANlyX+SAun8s?=
 =?us-ascii?Q?/EAealZxRiEcof6++h7qYOJgcqdTVyGhhKe0hj1Df5KGP1QxflCf9xzslpQN?=
 =?us-ascii?Q?GUVnUsyWP364u9PdAqY57UQWNn3qQ8CRaiFDh60Akv/mpG4oNn1/6JB/4DGK?=
 =?us-ascii?Q?tMAWhba9eylcdxUybWjkxZE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be56d90-d300-4700-dbd3-08d9be252aaa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 10:41:49.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7D8VOgQo3GYak8S1tyrA6ZlkhRaTEF9JWuNGuikVtEqb+TkzT1z7WOUwNe5W5r5AX5hXZfjlosqyhN7Z6VnSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 13.12.2021 11:33, Roger Pau Monn=C3=A9 wrote:
> On Mon, Dec 13, 2021 at 11:00:23AM +0100, Jan Beulich wrote:
>> On 13.12.2021 10:45, Roger Pau Monn=C3=A9 wrote:
>>> It would be better if we could somehow account this in a per-vCPU way,
>>> kind of similar to what we do with vPCI BAR mappings.
>>
>> But recording them per-vCPU wouldn't make any difference to the
>> number of pages that could accumulate in a single run. Maybe I'm
>> missing something in what you're thinking about here ...
>=20
> If Xen somehow did the free in guest vCPU context before resuming
> guest execution then you could yield when events are pending and thus
> allow other guests to run without hogging the pCPU, and the freeing
> would be accounted to vCPU sched slice time.

That's an interesting thought. Shouldn't be difficult to arrange for
HVM (from {svm,vmx}_vmenter_helper()), but I can't immediately see a
clean way of having the same for PV (short of an ad hoc call out of
assembly code somewhere after test_all_events).

Jan


