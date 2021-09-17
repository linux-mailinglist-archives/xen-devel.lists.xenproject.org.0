Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39F940F8CD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 15:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189385.339058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDXp-0000Wv-Ft; Fri, 17 Sep 2021 13:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189385.339058; Fri, 17 Sep 2021 13:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDXp-0000V5-CT; Fri, 17 Sep 2021 13:04:45 +0000
Received: by outflank-mailman (input) for mailman id 189385;
 Fri, 17 Sep 2021 13:04:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mRDXn-0000Uz-Pi
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 13:04:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2713420-17b7-11ec-b697-12813bfff9fa;
 Fri, 17 Sep 2021 13:04:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-k3N5bST_Ocivc0jqqI1RFQ-1; Fri, 17 Sep 2021 15:04:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2959.eurprd04.prod.outlook.com (2603:10a6:802:8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 17 Sep
 2021 13:04:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 13:04:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 13:04:38 +0000
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
X-Inumbo-ID: d2713420-17b7-11ec-b697-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631883881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fLgZmeBSwiV+NTbSMwgYaCPjruwQAJUnYxmLKIu9ug=;
	b=dSrXto/wpEXuoRIefclEHsqoWdxlOd1A9LVik0NrdqA6ppPiu9XBPHxAlvHSLJjSks+Xg+
	RdxWb01ENP97y/eRg3Zn3+lJ4grh5ob6QijmvMvioTlF5gGGBcy8leUhEYrfoLobRqmJeM
	8zqHZ1lhj7tNlNG+D+BaIYZvKSLnxJw=
X-MC-Unique: k3N5bST_Ocivc0jqqI1RFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqN4ryCrainoNuzHqrMWFVqtHazMpMvMP0Od5Mir7XoVqqDnExWILcnoiWWqKuWFhjtPgyITyVY1pS8IoxvwF5/4iPoEK8IR2dpANPt7dtMQVFSJpAEy0IULNnoK+YgP6JeA4/AOjkQhOc8dZbNYdhVH6bBkLwnYFLfDB2Y+rhiTJdHqb8mrkcEv7nudq+HhtON0Zg2p5PVdIF5jq5WQOZu+r4YVdl1VcvrOi4DYm6RLgqetIiekgX7FKdKKWFuqEicroo6UiJfgTIXplpeE4w8ojOO4dEVV2fsDVCf05quqoDUiDZfPa5Jijv4DJYzUctdVxKPmeR9cpHiiNs2inA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7fLgZmeBSwiV+NTbSMwgYaCPjruwQAJUnYxmLKIu9ug=;
 b=A0Cvv3UU3w/fP1uzNYApHH4LtvG3Fj+Y4y9K4BtXNZOnlM4tOKWXOa9Kj7bHRHY8WqBl6m17FwiLCdpd8E6tBsm49wwbKWlmao3AVJvtj14uOsPKJL1IhthLNjyqlpLogaxGVQ3yEUxj/3qec8EdF5ppoQAjuUAhHkYudHeiF9N2M+tmMFuGmgO8U4QRMCEDNfoAxamRNYBHwGZbBotLYYjBgr+GExFeMJqFw+UHJu/qtSStPy6xMsFjHQMeaUNjIf+jkQ16amoKgtGtULs2geQcueAEkwD1/kcyc4Qt18qnv3q4GMOGh/tF7pAthNghU3SSp/Gx452whfoj5g0A0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/6] xen/memory: Remove tail padding from TRC_MEM_*
 records
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24fa2834-95e5-11fb-e522-a37e3d8356b3@suse.com>
Date: Fri, 17 Sep 2021 15:04:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917084559.22673-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 807b2927-8aaf-4f5d-563d-08d979dbb4bd
X-MS-TrafficTypeDiagnostic: VI1PR04MB2959:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295914C68D39B43D4A08D270B3DD9@VI1PR04MB2959.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pnNg1ddcfII4WAu3PO7D7ysjsCh06hhhtPfTCNszwPI6Gqg0NZqgKDIMTn9K+a9Ul5zdZhLgtD83avPNHNzTvfwi7Ay3xMGvRsxsKjzLWtgE/409OEA6az68sahba/xqDJQXNoYe6s2mTCa6JqebEpCI/gEYfQBvIqd661LyAsbkHdhAMLKAwix7vQTcCMDpHsHk0Ad1Uh6eg+FrP1WpzyqjHZ7jWVi1iOILtXmeDpC1H7AY9cB992Prt+gP2lMI4HwNU9CFuG7Q3A3FcaWI51U5kQIXuxtoHCWoKYzYwVy73dsh5ns3FjdRH5py7oyyTJPVSZbzNOyoikXqiocCdsudU/mFjT+fMY5ptHGUpfVW//s5x7M4+tx/WMnkbgggDsfLSPO0toul/7Armd/GlrdXMSdDNBM4EfJmo1fl1MvSJUybWUv6JjfAguFVbAP6OUyKb4onXXELba8UdFqacPgSfg3/W23VAjsudIBhjPNxP3qbrvEdvfeB7VXL0fyYt+IWqt8s7wvO50rP050r26yVEA/wtpIVBOYOe4yPsJm/BPSIcUoBV2hNJDOiTtSz8Xs9oDfwztcHN4mHvpQ1AU+2x9zMbdA/wILSmuNp+RiIy8Q4XTTsMO/visroMsAjFMj2NwE7FacR6Y/L/U80vGNUz15qX2bt1kg8tKKaLFBxk3T6/tTzGt0FfclfwwhA+tZaX2Kpzp9Bcl0WHYiNRbv3sAHVgTKvttb02lSX4d8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(66556008)(2906002)(66476007)(6486002)(956004)(31686004)(186003)(66946007)(8676002)(31696002)(508600001)(4326008)(16576012)(2616005)(4744005)(83380400001)(6916009)(38100700002)(36756003)(26005)(53546011)(5660300002)(86362001)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUZpa2hBdzV2Sm5CSHFMMGkwTk9xUFNsTmZUOEduWDBOTnFQbCtHSFFvQy9z?=
 =?utf-8?B?KyszcUhWN241RlhkaSt4KzBNZnpBWTN0SGNWZ1g4YlZKTkEvN3NKTlZQRHlZ?=
 =?utf-8?B?MGZMb29uamdKV0wvMUtDcnhLWDIxemVwQ3JGbHpYVG9qOGF5b1pPQ1p2ZHNi?=
 =?utf-8?B?ZGlFYm4zMk1hOHpidjE3YmlaVGM0cnMxZENwTFhXZURJd3ZkS1RGMWd2S2xS?=
 =?utf-8?B?WGNaeVJWT21XbXNWbnF6WUtKK01RWUdXSDFQb1MzcWlhU1l5SEpIMVpJTitJ?=
 =?utf-8?B?a2thKzdpOVhJQjVzWFd6bFpCWStpaVZBTEpXSEhySU5ZYzlQZldWak5VMG9U?=
 =?utf-8?B?bFhIMmlXRWc2dGlYTy9LbExKQkk5OHRzUDhsOVNWb2pGZmFIb0tJeU9qUU9a?=
 =?utf-8?B?dnhkQ2hrSC91MVhQVmo4Z29OTUZ3V1dUbXplemx2THMrc3VoM2NtZlMvZGRE?=
 =?utf-8?B?MTgzKzV6THd5b2YrUGwxWUlOVElycXlFM2J4VFRVUDdmQjNBY0RnY2ZmeE52?=
 =?utf-8?B?UE5XUEF3bW1yaGZoa2xQQnY3VTFoUGp5ZVZrTXpETjM5UG1VdC9PLzZJeVBl?=
 =?utf-8?B?a2s3OW5ZWXV0NjhhcUdyZnp0Y0JWaVBYVWlxZXBMbFZkYlFQZzZsc25pS0wr?=
 =?utf-8?B?cEdXQ24wVU1ZZ29qVDlLT2kzazRROUtZNXRlbmJvMGJMQVVQRElFSlF1aENt?=
 =?utf-8?B?ZHBQazRwRERoNk5aUXNVS1JoZG1zbXNzbjF0SmowOXFBaytIRE5TZ01yQk8v?=
 =?utf-8?B?SEdjTTh0T1p4ZWhuOUtiK0hvRHFEVDNKZ0F0ZEV1dndIRmJJN1FFSFpsUkwy?=
 =?utf-8?B?UFRFeUs1Sm9UZXhDOGZOSW9ZdHRNcExlb3RNRWxtSjFKZ3lOa2pvYnE3c1U4?=
 =?utf-8?B?enJNZkdMV0JZdmJZcFp4ME4ydHl4NHFQQnNHbGw0a1h2UTE5V2ZHdU9kOVRi?=
 =?utf-8?B?T2N3M1dpdjEwNmxnYUhScEtIMGVmZy9UUVdPbXcrRVR4dStUOXNIVVNaZTVz?=
 =?utf-8?B?eWh3K25XZDVxeHpyWDJ3TURFSlYzZW5ZU29sYk1hU0VqblE5NitVb25zWVpJ?=
 =?utf-8?B?T25KQ1NRNzlyUlU1bG02ZVlDa3dLdFBrUzdQcTFXVk9NUkEwRW5aNS9BSlhr?=
 =?utf-8?B?M0NhZVdLTTkvQWUzZExTcXFpNDBwK1g4TWJNaG9yRFBiZHIwb2NVV08zTGNB?=
 =?utf-8?B?QW92UnAvTVFWREdBTmVCZFVFQ1g2dmhEZ1BVUmMxS0xxemN1c2t5YnVBcUNo?=
 =?utf-8?B?WFRiTFNRR2JJZ3Eya1BRUVgxb2t3ZURONDNXVWs1TW9lVjRKVnhjWldSTDNp?=
 =?utf-8?B?NlB0NkprNFdQenIwM2p2M0RyREhhZWNvYThoNlhEenN1cE9QdlhDa0ZPcUpI?=
 =?utf-8?B?Mi96d0cvenk0VEMxUS8zajlyTStyb216bittMEF6ck9KQTU4Myt3VGdMRjBv?=
 =?utf-8?B?c21vMFBCaTh4djRTYWRoMVVNZGdsTTUvUGwyT1E1eHhQZjBQcld3akx4YnM5?=
 =?utf-8?B?aGVwTEs1VEJaQ1RpdWFxbU5zTG5YVmU3ek5XY2xXd3hvY2tLNk53eWxobHZN?=
 =?utf-8?B?eEE3eVh0ZjZtQVA0V0dLaVJSN1NJUHhvS05xTmFrS0k0WDZxSDlURWJTTDVY?=
 =?utf-8?B?SDBVVk04N0duSVdjK2pxSEtXQ1RVZnVZK2tib3VPNkI1V1F6dk85MTlhTzFF?=
 =?utf-8?B?T2JueHBRdFdiSWsxWHlZWUtUWmdMZWVYTkhScDY3cVFYbWRWdEUyRDNQMnpF?=
 =?utf-8?Q?HgGeu0J7B5ho5i6ftEEzXoWOXKKWJBUznihTWOo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807b2927-8aaf-4f5d-563d-08d979dbb4bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:04:38.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0vAFjcMUBnQDN6EKbHI3ICF+kK00iCWPI07Ripu8wQC6tdVzjRPfAZgjZcx9wHwOtjlbQlrz0AsRHL5E+fowg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2959

On 17.09.2021 10:45, Andrew Cooper wrote:
> Four TRC_MEM_* records supply custom structures with tail padding, leaking
> stack rubble into the trace buffer.  Three of the records were fine in 32-bit
> builds of Xen, due to the relaxed alignment of 64-bit integers, but
> POD_SUPERPAGE_SPLITER was broken right from the outset.
> 
> We could pack the datastructures to remove the padding, but xentrace_format
> has no way of rendering the upper half of a 16-bit field.  Instead, expand all
> 16-bit fields to 32-bit.
> 
> For POD_SUPERPAGE_SPLINTER, introduce an order field as it is relevant
> information, and to matche DECREASE_RESERVATION, and so it doesn't require a
> __packed attribute to drop tail padding.
> 
> Update xenalyze's structures to match, and introduce xentrace_format rendering
> which was absent previously.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Hypervisor part
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


