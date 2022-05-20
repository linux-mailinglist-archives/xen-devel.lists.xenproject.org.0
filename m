Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDC852EDF9
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334317.558321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3TX-0001FK-5T; Fri, 20 May 2022 14:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334317.558321; Fri, 20 May 2022 14:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3TX-0001CY-1J; Fri, 20 May 2022 14:19:31 +0000
Received: by outflank-mailman (input) for mailman id 334317;
 Fri, 20 May 2022 14:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns3TV-0001CS-9v
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:19:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d350ae11-d847-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 16:19:14 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-2daqM5v5PlGTEk-N5SlUcA-1; Fri, 20 May 2022 16:19:23 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4245.eurprd04.prod.outlook.com (2603:10a6:209:4f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 14:19:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 14:19:22 +0000
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
X-Inumbo-ID: d350ae11-d847-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653056368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3F+88970A8YskHn3cFMA7OZEcNc+a1V1u/CfOSPRyFk=;
	b=S0rFSHzQ2YxLVANsYhq8Ab8uYWjqoX2xfK8Qtd20ERSe8mMo99yHND2MdxXkC2qSiXhVrz
	xfH0c/PmzlrUN+/7fTScVvZUYFlYFoqAZg4kTtUTJcS3rkHBtPqYPic5c4HpIMHS7qnN2L
	mjkQszWtv0QKsVIy+RMg5AOMzsvVJMI=
X-MC-Unique: 2daqM5v5PlGTEk-N5SlUcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm/mGdVYeMJ5KE1X5MJqlojXueiMNE+Vl0y4+x9WZv4q4fCmQI/oewFAARGItaTRZrYH6dxNS/pvq9hLAUgRoS3O8lRETjMK1gkQCERFHov+OsXiY322n8JeoH79HAGltjqplTNRd3wi3FKsnxMayirlY7ENqc6LSZso2DowjZpi1J5XNZyZXCxr6RrHjo/vw+N0h2+ToqkClRsuBAX1SAVtwyCpS7wVOS64XzEbKA+s0we3lz7IijrFzr7EHMWczFWFti35xeB7p3VY2XgOAwJXBT+5Vydc+MDpkn4o6WIr6sAtlRGONOlvKjoJ7m00t9o22VxGCzuQ0brwm5yiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+k0QVKOVY2sbgCdWnc/pDspJiwA7gfRhAjH6WChs/A=;
 b=Tjq+vCEjEzX16VNC870sOiPeOQpdP1YA/wSiBds23QyPjdwPBGMBb94dmZA4gHdHkQhpRmGNQGpMgwZHsOOqqmXTmGi1j1tJ4bUbiIvgx3VUWMcZrJyFHgqh+uMdb+eXiie63zFzY/K2ryRCOlFRvSmxqDjnNmIMOWnRZURzBWdNK0l+F4Y++p2uqPP/o0v6MofLNjrRn55pn4AD5VVsi0xMxLuiCbC8iexxEf3buZM1Rg1y2mkZiz2o8KBhf+MW1LWq7NathEKooFQklXqKtW/rKywHwkMMySzKqnDjkRk9p046+2QVwJRVkAVA6LVJbhSA3wF3MBrzSbtMi/TCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42cac54e-134b-dcfd-3ce1-1d6bfae9176c@suse.com>
Date: Fri, 20 May 2022 16:19:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-4-roger.pau@citrix.com>
 <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f716b474-1b2a-46de-88fc-08da3a6bbc53
X-MS-TrafficTypeDiagnostic: AM6PR04MB4245:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4245991D688297A2DED19EDCB3D39@AM6PR04MB4245.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dycNqubeYztgXvKUe4dq89ceHY3XxIREYZkrRfikWLEjP3uW72FQyP/qXLpdFIXuAgqz3+LPCPWI/rbHTNZ3DXIlqqqRNR2/VMmfftHqj5SwuldOk0fNGXHFensQIBPzCpYxiegM2IYqZ55KrV2bD5/F4oyGZjgHzABRxvw3qx7GnUniLkDGbz7gaOOjGwDA2VC0mQPjWP3o6wDi6nDaYG+8cy6UjGEL5QX3OhW1/WirTXg7AIMRX0R+u4tk3H7wL8Q26Mj/cCmfhp1Am8pIYF+iI0zzH6ZV/QDiHFUlafcb764vEGSslVvTt5AkT21C6o6yiGUgAx9xio75cFb6dVtkEO2eolfXK/pq9HoaZrcN21QkUHV6kFUgAvxTvmjV+5ob7/zUoyW1m4G3uqq0vMs0BK/KNpPpF0hcLsG0O1yoHWDduhU+xYU54OUO/x1Wk5S0G5O1+t7hf8nDFAZ0dQPx2Hz0O99B2mpRzr3bZHS3kTas2vj3o03sNvXfnqfPDSBkIDQ6jPVXMSZ+aM89zGHSXhynUJtlr4P0KJNHa+rw72rftV5kAeZR3J6evW1kRtKypKbgWBFOljLbuPbILQj0pn/Whb2kwJJraG0bUx4va5eGsm+obpL5ZNfHOZ594Q7FeOwNiRcL2KoBdup0e1uxbw5PWXlDWNdxI9UD8CodyFP2n3Hdqyg22B9mSYgZjz30kAlJXO9Y47+lvBT5u7JhB9YnYC+ElF2f6VMYoRG4+D2YSMnlh8qD0C1anadq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6666004)(31696002)(8936002)(508600001)(38100700002)(86362001)(83380400001)(53546011)(6506007)(26005)(5660300002)(6486002)(31686004)(2616005)(2906002)(66476007)(66946007)(66556008)(316002)(4326008)(6916009)(8676002)(36756003)(54906003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bSfZI3YIeVTGmZG/qVaH/nBGzenkSGBiBaF5jb8e1LFhvSYUBnQTvXnEN2fU?=
 =?us-ascii?Q?VBk7BA/fPnZqlFE+CrXrKXLuHWYdnwMk5Y1BYTfYba04CDuZtTp9vWr1qMtz?=
 =?us-ascii?Q?smHVkiCa2n3DUdDPg71JjnwoLs01t7v5kksSbSJSf4d67UgUZCfXud+fONm9?=
 =?us-ascii?Q?JND76Xv2mtUhaRhjue5GRyTyQdMeP2QUq6HgZt5kpXmd/otGv884IUmFIIQr?=
 =?us-ascii?Q?hC2KceIx3rEDxpTDhHKwiCG/AarzRQCBaBZxDPKq4vXPonN4DkeSBzPhzOjk?=
 =?us-ascii?Q?3vnBvAhgxdxmTxQRq05/H+fPWm6zcnO95PYFBUMphIjc1RxByB54sPpOylqz?=
 =?us-ascii?Q?ljbNMJu4o+I0oo88MOVdFCAqxlvfgOQ4Y9z5mKXb8ZZy9oV6jCH65spjatqI?=
 =?us-ascii?Q?Eig6We5eGeRC27/4/AJyZnlwJTSslsxkMK8iBOARjD0q479zNcfuUSikE7Cg?=
 =?us-ascii?Q?6OiANzUIweMU8Yenyp8JVpDoe+tN9iB7RQmQ5KW/vJb0Xez4UkN4Q1ihogj3?=
 =?us-ascii?Q?oIexEcwYKPQ9IoPwkzKVN0teVOe8UODldfQ7/BW9X4UPyuR2tBXe9pxS5Hbz?=
 =?us-ascii?Q?NBsMsrolM2FybEld75Y9A1DEHdS4r3V5XfFy5mLFc2W4b4vGuWGaVr2NHzH6?=
 =?us-ascii?Q?rdS29r8jRk2cJiWFhw/77kMrpjHpu+GYoP5A9yNHifTxVwQMHag0PgmrRsA3?=
 =?us-ascii?Q?JNN29UL1bts1BJeNcmkWI/MwQdT/KtWh3ur4agvZbJvrNvM4863Wo1+ne4Nj?=
 =?us-ascii?Q?4kdi64FPNcjIb5FHbBWNroVtRH9TudL/IUN2NCeZ2MJJTFj6KdiE1eGekLYn?=
 =?us-ascii?Q?NmtsQOGMTjA1aAWCwj6NqYkbv820F8Xei8DoyXR8pE5R/XHNJ9bTOYm2FG+u?=
 =?us-ascii?Q?ik/P7aQoaAtx1UO6BOGEyAq1hjeXIuf8Llt/0m000gySFzmhuD0mLlgrIxUb?=
 =?us-ascii?Q?8c0PmiT8x7vpmzzccnT0F+Pnm84Z/LSzmyzI/WP7yKSpDS0sDfVwhOggQFbG?=
 =?us-ascii?Q?OPE58oBDGAtxKxX5O8J2Vi4DgvDhamvYN/hBkfjwv712dgVe2D+g0BC7bX8r?=
 =?us-ascii?Q?YlNp6bg/34e1fBACrkS2BRKWA2rsTbsPyB7ts04wNg98AN8cKAfowen8NFJe?=
 =?us-ascii?Q?qxc+RFfqWhH1/1bwoHy/lHBA6DoLjpmcVCJPElNVIE4b9lxcleUbICR/5ofW?=
 =?us-ascii?Q?rxxA3wVkd9bwc70mB6+iO1GD2iyMT7ut6C/WcpFFzC+42lHmd25NgYR05HDv?=
 =?us-ascii?Q?4rHtJNq/rC/PLjtWXs2c+ZfV7v+9ojyV5zCxe0xCNcm1Y3W/XBRviM0BOESw?=
 =?us-ascii?Q?ILCiCjCZpqV5/svcZ9iJ6lMcETvdFWwAOJBJOE6BciNhTRrvP7ZVMrLVm8eG?=
 =?us-ascii?Q?C7bXe7TZNCdVCDmn80njv0GPrGecjdOoKzeB1Hk73bwUuChYAplYSBWerJMc?=
 =?us-ascii?Q?As0LmauJXBiNUamNEi/iyQVFIptI2niRcfDGbWq8oTWAWDATIgPpg1g6W73S?=
 =?us-ascii?Q?hU0ZYhglj0ZWR0EW2DT0ynXBInMWmH4T0NtoLO1WYHvk7hjGpWpfoJ4ib+pD?=
 =?us-ascii?Q?lzm2cca+uv+UOoRjoIf0qLhVmtTUIICWqe/S4MFUY/S19Lb+SoJ0UvlhVxCb?=
 =?us-ascii?Q?GxVVlcVpVF3HFyfKyCLK92RHtZfKDjykSzjuGJ9Hi7qdozMkTeIZtygHB21L?=
 =?us-ascii?Q?onP1xohNNc8JY7Rhd9ztV2vsICoYHoBUouH6f9Uwm0uqkLiVT0dzwAd4+Fqq?=
 =?us-ascii?Q?hKXeaUGNHA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f716b474-1b2a-46de-88fc-08da3a6bbc53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 14:19:22.2943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3noTQxROOGb82qVGDNU9wr7jBMjzS5KiJLL/lOUInE9GbZFvttgbxAHYI364++az0zIdUCYHHoxVEWq2eULjEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4245

On 20.05.2022 16:10, Andrew Cooper wrote:
> On 20/05/2022 14:37, Roger Pau Monne wrote:
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -135,7 +135,7 @@ XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Suppleme=
ntal Streaming SIMD Extensio
>>  XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
>>  XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
>>  XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages=
 */
>> -XEN_CPUFEATURE(PDCM,          1*32+15) /*   Perf/Debug Capability MSR *=
/
>> +XEN_CPUFEATURE(PDCM,          1*32+15) /*S  Perf/Debug Capability MSR *=
/
>=20
> This is the bit which requires more toolstack logic to safely enable.=C2=
=A0
> Using 's' for off-by-default is fine if we want to get the series in now.
>=20
> But before we expose the MSR generally, we need to:
>=20
> 1) Put the configuration in msr_policy so the toolstack can reason about =
it
> 2) Reject migration attempts to destinations where the LBR format changes

Since this could be quite restrictive, and since people needing to know
they need to hide this feature for migration to work, I guess this would
further want qualifying by "did the guest actually use LBRs so far"?

Jan

> 3) Actually put the lBR registers in the migration stream
>=20
> ~Andrew


