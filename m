Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487624C4051
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278847.476250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWB1-0006SL-MQ; Fri, 25 Feb 2022 08:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278847.476250; Fri, 25 Feb 2022 08:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWB1-0006Q6-J1; Fri, 25 Feb 2022 08:42:11 +0000
Received: by outflank-mailman (input) for mailman id 278847;
 Fri, 25 Feb 2022 08:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNWAz-0006Q0-CM
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:42:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf5120b3-9616-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:42:07 +0100 (CET)
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
X-Inumbo-ID: cf5120b3-9616-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645778526;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BZMuj71EISq22FzGn64YJv3TZOVthmanBRcprhqTZOI=;
  b=MrEUfsnloQGzU+dC4muC02U3sdHVv5r/yr/4JpZqNmgUeF1gyM6X2rPT
   zC6JGDWDjNtfufVmkS56iSKNrkiPD3tAmDecm0qCyaGHDYD2i+l0krtEu
   qN19O9k5ZvHh4Za/whiKkNku7t1t0NBooOdHl4ER6t1TUeUmejRQCak6D
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65384799
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lcpLb6KGKL3EBj4iFE+RJ5UlxSXFcZb7ZxGr2PjKsXjdYENShmdTz
 mIWXGuGaauOYGegLo92PIW/oxkBsZTUzNZkSQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ixi74OBUToAAq2WgL0WeRsFECRfZpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glt3ZASQqePD
 yYfQWA2dQ3gXhNPAV0OUMwZl9qqumfgTgQN/Tp5ooJoujOOnWSdyoPFM9fLe9rMWcRcmG6Zo
 H7L+yLyBRRyHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3I
 koY4HB29fAa+0miT927VBq9yFactwMYc8pdFas98g7l4qje7hudB2MEZiVcc9Fgv8gzLRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAXMGsDaCksXQYDpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s71OFRyJSjwHn7g2i0/5PjTFM24ySMZzfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C8RLwJtdiON7Kih6SdkifdrUmCgmbKggjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ymkEj+jefGPCbNIVvgDLdoRrpohE9jiF+Im
 +uzyuPQk0kPOAEASnO/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3Lc7nK4sE
 qJcIJ3o7zYmYm2vxgnxpKLV9eRKXB+qmRiPL2yiZj0+dIRnXAvH5pnveQ6HycXEJnPfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:peeN9KnCOCjKctnlRFAGuxlSBzrpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65384799"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn8hGov3hzz1RsT4spuSrBPLKdToDraEUP5ytk4Db22XdNd93l+AoQ+OPpIksNXwHqHLRKPwNdQK1k/BVb/rBN1J76VZx+kJRVEVgechZsiKQmlqqirJaDR+9SsU0QKuYHDIlkvT3rlYy5ZXcPr99Yywv4F1CujpM78oCH/5OUymiiagr8sDxSGVAZqRx3y2RC+EfMkR+noaKqlBxBRm1EAiNOsPrMbsqbtVbqBu2JFh9Pn51mf3Jz7X5yeuk7LezLu9a79s4Bqix1twfT3Qsob7uR4bhjqKaZg7KBXZHeKMeUMIgVn1fSI5zIPDVagYbV36vH+Cf8wIAhxRP53QUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=362OdD7Yjtrz9CvyKnpo87g0J1BeJXvv+MalHiJzF4E=;
 b=LCAeYKFyGJPJGAPOmTINwCWMDKf9T6VoXO5aM08IDq351HR29/Y7sXa7KeYciYdxjCe8jfiMCrnvW2Iq0M/ovU+v2bIBOrvjHZ2Ocx80ENWXm94P3Tba7DEhU8U4Zmq+Pilql8jhDM/4Yx1+6Yby9NK3zBZ7lOX31Hx29gmLFrJjhbj4+YBx3pq0/kYFJ8XLHty/IFnFbcqH/ZZKxwl84JjZmCNZvlzuWS8yM/iKcO2vlV3t4P7otUM1nkPE1D77qQzw1NP5cKimHi0aIdaox02qAY8Yy+6N/ABcZLOFVpU+k4vVIwK+TivGjlmLiIjaRUgyO8KMWD7ULOuz/trSBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=362OdD7Yjtrz9CvyKnpo87g0J1BeJXvv+MalHiJzF4E=;
 b=WAiiQnH6XVipc4wR67FaZXLvVFynJkOZq+Ev4HX0tVH8/dy3PDSCmS2hxYd6oP61j7sO1cghiMNPOEs3lxra0MLrjMa9GH8EPpCYtbWhQn1QaA8xJ1och549ffn/9UscbB6JMaS0C53GnRljxqI0DYhK0IZ6UsJYK8nonjZJ9fI=
Date: Fri, 25 Feb 2022 09:41:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] pci/ats: do not allow broken devices to be assigned
 to guests
Message-ID: <YhiWU+7Q9/Fbsig+@Air-de-Roger>
References: <20220224163701.89404-1-roger.pau@citrix.com>
 <87b47562-7689-de37-f2ee-df05ef01c923@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87b47562-7689-de37-f2ee-df05ef01c923@suse.com>
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebb513b9-be01-490a-763f-08d9f83ab0c3
X-MS-TrafficTypeDiagnostic: MWHPR03MB2943:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR03MB2943C52AE15A8B97489234078F3E9@MWHPR03MB2943.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8HbE3i0L4bKfxSwvRnnxjtuM+FV8UcqzFFS46kcthmZAN21IVVho26RKqmdsj2GCFCTGO2REkA7QOwgiqFoA9ZMZ/aO1QvtKOGwTSfAY1a0IdofjGlghJgkYYA1qy8fvoLpoe2zE9jSHEpJcB52+XLHVTaQz8Y3yY1KAI+iYCc2Ligv7Hq0Gv3pAaNHY5zfQVzitoivXpvscyFtfmlHTxaR0pS1J+S6KQLLrDEDBEhuJzL0wKj7v+pcgdPV6tbbgGbDOd5M/rX0YyKUzeNinYA/2ilHTZTE/XsaGyQXVab0/jMcArqUFylLHWZ6kAy9/s0qmkZ9mlbXIOWfs94im9PnkFDTaRQKyePc60jbt6gL7dW04U0ghuZssHVAwujSYROMRa+3VHN6B7bcO3gml5vJ4MGPHOwMd86XEpFubYNSDd0VK7Dod9JmkRji5Xdulr2EpxPbfE+/TYIpquizTMUn+NeO5OdUQsR2Mz2ddAdFboLx+EZAoCRiwrdLDDwGfFVcMea9Di0wlcGFTBsSfxc1Q1Te7eWJKGIuCYiHsm46MdplPiW3GnzZyS1B8M9lMwhtcXY+74huQzphPFVIxCC8ce9rijHsWAqgNdGgSwc0OqWqY+S9yZrrsuJ4VzuJxzxO3UHSfqD3EygQS9NVPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(83380400001)(66946007)(66476007)(66556008)(316002)(85182001)(54906003)(86362001)(2906002)(6916009)(4326008)(8676002)(8936002)(5660300002)(82960400001)(26005)(186003)(6506007)(6512007)(6666004)(9686003)(38100700002)(53546011)(33716001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVhlRXl3ck4xbkVuQlNSL1VER2hMZkdzT3ptVms2ZTAxdnBaWExGZ3VpcWdB?=
 =?utf-8?B?N3dFRTNWalNUZjRsTFBGa2dsYVQ3cVV5b09sQjVUeVVvcDNPR2hhMC8xRWN3?=
 =?utf-8?B?OHNOYVRDUU1TRnBFV2J3cjZIUk54bjl2RU1xZHNtZ1MzRThpN2R0amZBMW1W?=
 =?utf-8?B?WGlFcitUTUdENjRub3pBbldQMEEzS1NGTXVtQTJPU0c5V2x0Y3k4dS8yK2kr?=
 =?utf-8?B?K0V4UFVQenNvcGNadXNjam5EbXMremphelBBTjBFR1FuVld3czZUNmtXOStU?=
 =?utf-8?B?UGZvYlpjMkxhSkQxb3VXMlRrMjBHMVVhejZ3RlpxM1VDb2kvSEhjSEpWaG5Z?=
 =?utf-8?B?YlczeExseTNHN05XTDhEd2ZyRHdDZk9Zb0wzTnBRNW0xSE4vZ3RyUlRpdVIx?=
 =?utf-8?B?NWo1Mm1PSC95blRLWm5WNU4wcGQ5WlZPNlNuSjAvaHdjNDNNQ2wrWXFIZlVS?=
 =?utf-8?B?MEh5cVErTDViQkQvM3BvS2pZaGd0LzB3SEN5SG5qL3FCVXNzdk9Yc3FqVE9j?=
 =?utf-8?B?Wm43ckp1OHBxMExUempWdndFYlJLczVzWlI3eVoxOE9OZ0pYSGtVWld3dW9K?=
 =?utf-8?B?ZEk1UXhzQUdxUEVEMlpsRGQyVE5hYTQrTERaOU0wcWxZY1UyRXA0V1Y0dWd5?=
 =?utf-8?B?Qk9TU2hLS3pxb0tHSm0rb2ZSc1lpWHRMRTd6SEJJdWxLcTFMVDkzb1dacU0r?=
 =?utf-8?B?VDI5ZzJtMUErTWJhL3VJYzVEd0ZNdUJkbGpHVnEyUEQzUEd1MVNZaXNaTE1O?=
 =?utf-8?B?L0pYVllRRnVUT2hEZkJVUnZYaTVxa2F0NXRRZk13eVV2YUE5YjZUMkY0V0JD?=
 =?utf-8?B?QVBrNDNkSnVjTVRoK3lPTVJoMitNcCtYU3FEU1BEOTd6WFZKQnpFSUtoUk85?=
 =?utf-8?B?TFd5QWtYYTdVTFVJVzhLTDV3dGNxR3dRZmM1b3p0NGxJeEtMeFhpN0g1dmVU?=
 =?utf-8?B?RW5uaUhWKzJzZHpxN1FwOFhtYnBrL2hnNDdMWWpERHlZdk5uR3c5SkZrVG5S?=
 =?utf-8?B?bEtsNEF0b1UyWkVkcUEwejlWNlhqTFB0MS9RL1FxTDlvdVNrODFyNWRvRUZP?=
 =?utf-8?B?VkdGekVhTkljNjQ2TG9LMDVMWmZ0Z3Zaa2pxU2laNDZTTW9KR0xPVXFtWkx2?=
 =?utf-8?B?NXNEUkxkYlVmaXBFU3JPQ2R3Q0pWY2grQTJ2N2grZElrWTRPblFQclR5emJB?=
 =?utf-8?B?c3dvWURJWkNkeHF1dWQ4Uks0WlJqS29Id2hzMkROL1c3Y0VUcEpPcmljVS9h?=
 =?utf-8?B?dG5wQWJ2SkhiNTFiZy8xdWlVUStFVjE0b244UWVOQ2RTalR2Y09SWjhYenJk?=
 =?utf-8?B?cU1YbFZKMDRKaXhxZTNYdDNjM3FzZlIrc1lIVFl4RTdJM0poMkY0ZGlLQkJl?=
 =?utf-8?B?S1V1cDlUM0sxQ0dvVE9taThwNk5NbXBxZlZ6VVRLSHlMRjhSdGFrcURBVEN1?=
 =?utf-8?B?NmFqM1hGeDNSTVZhMm1BT0Q2emYvQzJYd2ZIRHYxSkd3NHd4aXIxNHh1L3o1?=
 =?utf-8?B?MlVZTDRqNnNsc0tzSFp0UEorSHErVVBQM1B0YitudWhBNjZVNm5zWVE2N1dl?=
 =?utf-8?B?eUloQVJhK1F3UXZuMU9DQkNZZUNPWlNQNFpBYnBJM0YyR3RYQ2RwYy9lTXJm?=
 =?utf-8?B?TmVHdmw2bk1URnZEWTFaOWlNeTJERTRBS1pWOXl0YXFsRzdRaUNTVWRGdVpa?=
 =?utf-8?B?VzBSclBPVkUwa21sNmlTS1ZxWG9QZXhQd0pyZFhoWlZEeW0zUmdWTjN4Kzl2?=
 =?utf-8?B?Zkp3ZVlFOENXOXRlYytXWHVybms2N1FKaHliWUtRVUdCd2lZV28zaGh0aWN5?=
 =?utf-8?B?Nnp5ejZIWk54RFJNellJODlDWm9wUTNkS3ZBOXhFcElNSUQ4WjdNdFZvUlA2?=
 =?utf-8?B?OWJOZDl2S0NXS01HZGptOE8rVXg2NmFEOWNnSlNHT0t2bnNjWFZkYXExSXVa?=
 =?utf-8?B?MEVWU0QrNXpadGVtNXoydGh3SksxUjBTWDlaZHF5UGQrRHYwaEw3M0dyLzNN?=
 =?utf-8?B?TjNVbXViQngzK0JocldYZVhXcHNkZXFQTHlLMVUzSlo1QmFVaWNuZ3NjbHI3?=
 =?utf-8?B?UGY2Yy9EMVdOVnkyQVVBWEJ3QnBMSUN1MHJGd1NKNDZHajEydDQ1U0c0QW9H?=
 =?utf-8?B?KzQ4dHJ5T1gyQkd3Vnh5TnRFWjZCWTRxdmt0dmlHeVlzZ2xsMVRwQWtiOE1H?=
 =?utf-8?Q?OnEllEoUfXSEzZ5kOwt4mfs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb513b9-be01-490a-763f-08d9f83ab0c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:42:00.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMkGNmxhiCcQp47wsJGcYqPGhCZ62c8zsF+EsQFzOEbl6Ye+E91ImqZmNhOcgIHHe/3rKh7pb5XY8ZGR7YwThg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2943
X-OriginatorOrg: citrix.com

On Thu, Feb 24, 2022 at 05:43:13PM +0100, Jan Beulich wrote:
> On 24.02.2022 17:37, Roger Pau Monne wrote:
> > Introduce a new field to mark devices as broken: having it set
> > prevents the device from being assigned to guests. Use the field in
> > order to mark ATS devices that have failed a flush as broken, thus
> > preventing them to be assigned to any guest.
> > 
> > This allows the device IOMMU context entry to be cleaned up properly,
> > as calling _pci_hide_device will just change the ownership of the
> > device, but the IOMMU context entry of the device would be left as-is.
> > It would also leak a Domain ID, as removing the device from it's
> > previous owner will allow releasing the DID used by the device without
> > having cleaned up the context entry.
> 
> This DID aspect is VT-d specific, isn't it? I'd be inclined to ask to
> make this explicit (which could be done while committing if no other
> need for a v3 arises).

Indeed. AMD doesn't use iommu_dev_iotlb_flush_timeout so the function
is VT-d specific. What about using:

"Introduce a new field to mark devices as broken: having it set
prevents the device from being assigned to guests. Use the field in
order to mark ATS devices that have failed a flush when using VT-d as
broken, thus preventing them to be assigned to any guest.

This allows the device IOMMU context entry to be cleaned up properly,
as calling _pci_hide_device will just change the ownership of the
device, but the IOMMU context entry of the device would be left as-is.
It would also leak a VT-d Domain ID if using one, as removing the
device from it's previous owner will allow releasing the IOMMU DID
used by the device without having cleaned up the context entry."

Thanks, Roger.

