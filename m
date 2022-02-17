Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B924B9FBA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 13:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274749.470337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfZm-0002QZ-FV; Thu, 17 Feb 2022 12:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274749.470337; Thu, 17 Feb 2022 12:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfZm-0002OY-Aa; Thu, 17 Feb 2022 12:07:58 +0000
Received: by outflank-mailman (input) for mailman id 274749;
 Thu, 17 Feb 2022 12:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKfZk-0002OO-TM
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 12:07:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c4fe699-8fea-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 13:07:55 +0100 (CET)
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
X-Inumbo-ID: 3c4fe699-8fea-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645099675;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AKzo7k6MF2/SvLdlcQUAA5rd1y8YQypPjmbIZK+Ohro=;
  b=C9YyYlv3DVPdt/JI9X69qYnJL1KIudNs1/gpZud+3Rmf2Uf4vxOXAIs4
   EVICzHWNewSDylQTpDdP753sfHPNiaf1FBlioilsa6cBlBv3cg0/ArT0E
   YT/qw8/0VQcqbBFWQiEmjuDxt4yqGUvjRBMI95DfrFWj3zs6oRSYXf4bB
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W/EH3YmRnDiMMPhBL+F7YKbiaPXkmtB7AyRr8JvHR7DG8hnG6z5waofCi7TNwI3q2WLCCx+hB/
 FPjhSBCn6yn2bWhoXSwIGF31OaKVJxfR/L/OOODk1ukidTR8NI8sVVCVFHgCIyQUz0Rs6V6mQG
 q0QbN3E1KiPPib/pRXvaFyGUc4WAJMCnY2HeictEzISVc74BqAnc6nJKX9VRwT7C1KlOxzy4iM
 lN9A0a+p9IBnypMFAWgtulDJVt09o1DzE85jXIzhAE0AMLrpMUPYdWjZyGvcacCKYFDIS7xXtA
 PrZ7dZprhaqab6dmRKxUEgG4
X-SBRS: 5.1
X-MesageID: 66664464
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ql4F/qs4GhxmQNYlyEnfXU6SQufnVNJZMUV32f8akzHdYApBsoF/q
 tZmKWHQafyLZDH0L4h3YNm1/RlXvpTTndcwS1dq/H8xHiMb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IfhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl8rjodgs0J5L1mvksSzIEKXFyFvEX5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J4QQ6qCO
 ZZxhTxHQA3cQzYSN2stE5MUnLbroUDhMGMFkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqEaI2mUZBRkSVF26ifq0kEizX5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYeRt5RHusS+AyLjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJH95nNdn6A74itry6DIQNJFz8OTnNVUl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7ZYVUwYnY1RvHNEghBHVb5Iui8BxkkeS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyJNoERPMQsL1DalM2LWaJ29zqy+KTLuftiU
 ap3jO72VSpKYUiZ5GHeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/8EzLiWo
 CDmCxQwJZiWrSSvFDhmo0tLMdvHdZ1+sWg6LWorO1Op0GIkeoGh8OEUcJ5fQFXt3LYLISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz8
 ++6ywfWYZsfXAA+XszYX+2ikgGqtn8HleMsA0aReotPeF/h+ZRBIjDqiqNlONkFLBjOn2PI1
 wufDRoCi/PKpos5rIvAiaye9t/7GOpiBEtKWWLc6O/uZyXd+2Oix65GUfqJIm+BBD+lpv36a
 LwMnf/mMfABkFJbiKZGEu5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcKVZ3bumH0v1IyDDe4e5sfRf/7S5zurGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0EpX6RKnEgUrk8ssBICYDmvQMn11VebMGOESTx+pyON41BP0RCz
 uV4X0Yea2CwHnb/Tkc=
IronPort-HdrOrdr: A9a23:Geb5IqDSWcHFUGrlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="66664464"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFNYWbwgnGVAxw7p7264u3F2QAJth/CWQzIvRkrEOxRtktU3eCiSRfgCff7bIWpkHmFN5rRRxr0AHCFvciK6ExfWxDmk5UTHcTGwJ5nzWpEi/CgDkrpsQR6CKmuMELg3+8kI3qaxEQvJeqITSc+jlDv+ycIBzksRBTIiDFe5DpuVgamT93I4yeBq48Z5/yYBaMb4GZY1uYlHOWVBK3a4RkvsejG6zOnNPeqJqr4HdwGoQplueqOM+QcGfK//TDt58veHRhNec9Ls9kCQcq9tOTHjej/Yiz7d9KJm+z6DbyVXuh/LvhNhzTEKW0X0IXD3GedVJ7XMKIUBHuVe9QyWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN/6gvNC3DHJvpRIEGPMEbEjSqfPxr1KMfpL3vg19xQ=;
 b=gCw9NZrMmN/RQOuTEKHx5hQ5KB6rFc7IMg7Y2YbGOQlZf8d4cSpgueL9OY/7hRN1or5B1LYI1b83RcyK4MkA3/vjnFYXq97fe7EWA4EFGYFThVR/RmFuUDhlqqccQJdCz7hDFs1JZdL0OAb7ZqKHrMJfweKXrRBCoso2BSUuJi+lSsnhBySxGrYRa5oZrl8lwjQAGih0XKrnh0Jiwgd7sIybLpf5vnhMcXi/WCi8LcfMJeVR1pOkfqt9CiHPZjgt+DB8FqP+PPskKMdPlZAW43ktM4mNHu+3W1E12wBIt2Skp4yzKb5HzmUiduAvjNZDesjFIBV5R17wz+K1xdTR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN/6gvNC3DHJvpRIEGPMEbEjSqfPxr1KMfpL3vg19xQ=;
 b=BoTp4A5mpwSL9D0rbBIKHYBs7W+KNbpuoWqZWOwE+urPFEbTIkgH/CokdQfVG67pUlNhzn02fp9OG/FnZA00zjKn7Scqaeh29MNnC+xu/wtBGdQgMJfk0zrxJAV0bSWUesqDmx0GhL7Z8xsqj6Bf2IBUii+Gj1N5Gc6jvKL2JRU=
Date: Thu, 17 Feb 2022 13:07:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/console: process softirqs between warning prints
Message-ID: <Yg46HsntJztYBQS0@Air-de-Roger>
References: <20220217082850.19407-1-roger.pau@citrix.com>
 <16386211-4909-da40-3b0f-c76d64289cd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16386211-4909-da40-3b0f-c76d64289cd3@suse.com>
X-ClientProxiedBy: LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8b8a7c3-74a2-455b-21f6-08d9f20e1dba
X-MS-TrafficTypeDiagnostic: BN6PR03MB3331:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB3331DA59B0555F09D34796338F369@BN6PR03MB3331.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5irHs1Lhshosv0fELdhZzMPefW/jLf0cbGckW6//UdZIpSZupbWwYYakGHarWfK3UE1Aesln6VjiOWL7SGlIVR94jm9D7m6VDMtc5aAz/nfuWkpz8Zwzwukc/e6FsP6aqk/QlGRO7Ag6DyAZn3g4BqdAYa/dEvbDrXcV4BJ+Dq89b7l+l+ZBlzSzcDDyVmFFJPGmjTUWFPaGOyOtr8BsBkfaQNSQCc0F8jHfAcOgjgdhzRsVxtQ3kaB6sunKvJ9WS0JX4Ch6PH6VF/0ZzyGqKWUmNqidVKJ/Kph+4hh/PwscYCR5JslJ8L6Pwj2E9ymhmbNq+vfErl0PYntw7W7F6ECxf3kwlBbP1MO3BSG13fG24bVcGbTtRiEizRYhEkEX9lQ/uiTifCbTsbXRFbcCnufcdlCBvSJwedq44u0XahSP13R+VHRzC1a5zHucySHhu3gZvDTsnUePqGd3/xmSrqaArnGb2O5Jg31DM4nLvI+GbMU9Tj6t1T7PpBibqMZdOIAuswJwnl/wqEz91M/rF3IPtvyIv3tgb1s04qKx4jkvFWvc/2DQPRu2mnC+xk2QyMKpz2Y+bttVx8JWfjPvyBv4V2cCpccwniWcs3TFs3zlGOEnVaJfUsao84pBCkvpSYUMp91uNeBPTj+eh5EuGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(66476007)(66556008)(66946007)(54906003)(33716001)(8676002)(83380400001)(186003)(26005)(86362001)(5660300002)(38100700002)(85182001)(8936002)(6486002)(2906002)(508600001)(82960400001)(316002)(6666004)(6512007)(9686003)(53546011)(6506007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWMrakloa2c2RGlPQlgrODlOd0R1cUt0cklKVUN5ODNHcVhCV1FLUFRWR29l?=
 =?utf-8?B?TjAvMkovaE9qd2hIVHBSRnl2cDAvY01iMUpGS1Y2TE1XSUJjcDkwTzVpUEph?=
 =?utf-8?B?N1kwL2xxUEdweEZIbXdxcmNRZ2ZETGw5VDRvL3dua1hNQkxyaTFCdTV4VmRU?=
 =?utf-8?B?NEQ1bDkxVDl1UEFQb2RRSktXaUo0ZHhBV21scWhvTG5QdFlGRDd0aGxtL0oy?=
 =?utf-8?B?OTNQdUpNd1pyOVJKNlpicndHSjdyaUhRaXdtMlhiTGhzbXMwdUtzV1M1K0xl?=
 =?utf-8?B?YzhKdUM2VVVMWC9yNmhJUE80eTBzYTl4V0tVS25GOFBQVTI4K2I0dHE5UU5p?=
 =?utf-8?B?Y3hqZkJXdHlkUVgvSE9HNGZLckJvZFUyYTVabldwWUMwUG5KcGJ5VTc1NFNa?=
 =?utf-8?B?cmxMOTRVaFpKRzBhUFQ3dHlSZGJiYUNJRzFGbERaU0lwVXZwSC9KaWlaV3Fx?=
 =?utf-8?B?ZVkrTEdmVHBWYllPaWhLM29QVjNseWhNcVZwMythUjNaUzU2Yk9aTjRDVWNi?=
 =?utf-8?B?d0tYYUZGQ2pzc3M0ZnNwWWliUEZjREFpV2cwTTZvN0tzYzQxcVhBYlBwUE1p?=
 =?utf-8?B?SW0wbDNkTkl1bTVJamhqSDlyYm5CMkFoaUtCYWt1eENKTjJCM0J0WlFDOVNV?=
 =?utf-8?B?eXIwWVE5MGUyMGo2VGN4SGNvZmRoOFJCbDFEdWhXcGwvb2kybHIxT095bkp1?=
 =?utf-8?B?K1hYb25KdVBLemorR1dJQ1BTaENVTGNTMHdUMC9uVVNKZ25xTW1RUWxvdFhM?=
 =?utf-8?B?N29QTWswZFl1d2l5RFFjeEowcEo2NVRjbm5YdU9UL3ljNGw3cXRsSm1MdUVh?=
 =?utf-8?B?RUNNS0laK3g2b0RFMkZrRkE3UlNicmNMNVVJbm9veitnazdiL0grV2xtVnNp?=
 =?utf-8?B?K0U3d3lNUVIvUkkyMmM4clRuOU94Y1VyOEFiOUp1R0d2MUpjM2djMlpKQ3NP?=
 =?utf-8?B?TXdYalJEcWZ3blFsbXJuTW5ROWZCYlZCaDcrZnZ2RGZ1aVE4QjdFcmdzMm5l?=
 =?utf-8?B?K0VLTWczdDhQY2tzdGpQUy9PSGkvcytWQWlhYi9NcXVBTG1OUmk3bkt3elhJ?=
 =?utf-8?B?Rk9rN1pydnZhV2VZK2NRSUdBOG55cHh3eC9VSnBoUXROQ3ViQVFMOXpVQWt4?=
 =?utf-8?B?OU91Y1gwUVhyeTRJNUZlTGRmM09oK25Nc3dYeHFnSGt0cUhzN2NGSHRtczhW?=
 =?utf-8?B?RHJTcDROMGJqTmp6ZXEvSk4xejdmMFdkUWFEeTNNV3NCVnlJTUdnQ29zZmo3?=
 =?utf-8?B?eklPSERtUTNaUkltZHhjZFoyQzgxNlVISmNUazlCMmtYdVNPOFJvWXB6WDNQ?=
 =?utf-8?B?OHF6OVJyUGFERUFtUHpwNExuTXdzT1dDWXQ0emFOOVpMMEhDekFHWVZvS3Jy?=
 =?utf-8?B?RnBiUzlyRDk0UTU2WEtoT2ZST2t6TklvNWdXaXZGNTBQNmIvRlQ5d1BIZUZD?=
 =?utf-8?B?cE4zVGl1STFQYzVXME5mRnNQbW1sSTRBVys2YmFHSjJpaWtoOS9IeTl5cWpG?=
 =?utf-8?B?NFB0ZlFxejVBSm9pL1p1SitYR3FmT2tDVW9xMW13alFtWGkyRkduNEVmNjdB?=
 =?utf-8?B?MHJlbDI0OG42WDZpNDdTdm1tR3JSMFpheHAzSlUvRXE0aEpkVHhTQ0Z1NnJz?=
 =?utf-8?B?TFFncXBoOS9QNTFIQkZnRVBVN2FkbDVRWmx2S3gvVDZMUklSYnEvcStGN1lp?=
 =?utf-8?B?aGx5aFdHd013KzA0bzhRdHQ5SE1vRy95MHo1V3pFd1dNUXpkNVlaWXBJSVFi?=
 =?utf-8?B?ZEJLdzNVNTBIS3phRFNEUmE5cEI5TUd4OWtlWmtoZ1N0N0JiUC82TlpZQ3Ji?=
 =?utf-8?B?VDlQRUlsOEwreXl3MkN4aGJ2dC84MFhQOEFWWXQ2RGhlSXNYc0x1T0hDRGtP?=
 =?utf-8?B?K3MyTkZEdlJNcjdraVhJU3pqTXhES2l2V0dBRytyYzRMZHdsK1FKQUMvK3R1?=
 =?utf-8?B?TUN0eUdGRzNxQUVVYlduRlNPazJ3dlh5Mk5GMnhmaUF6ajlxZ2ZGOExKZWNi?=
 =?utf-8?B?KzdGT21lTDI0WnJ3V0lEeGJnTGlxbGEwdWxoem5XRk01R242YW82K21kaXhP?=
 =?utf-8?B?cGp4RVoyYk9NRU9Lc2dkZHNwSVBNRzM2UlJVY0N5M1pxYURhWXVPS2phRnpX?=
 =?utf-8?B?UUtyTmZQZnhvRjVjVks3c2lvck1iWnVVV2lHZ2N5Z2s2WlB4a09FZlQvTHp0?=
 =?utf-8?Q?UpMfSEQ7hSq4qf4mWoGF9oE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b8a7c3-74a2-455b-21f6-08d9f20e1dba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 12:07:49.2930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgnHrvK+Asb4dd1yRApJvuQeznSzYhM/FDGnBWSmCNZNVKyvRb4ltKxqRuaMT3B0LlW+KYoE4XfCNgmCjj4N8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3331
X-OriginatorOrg: citrix.com

On Thu, Feb 17, 2022 at 12:54:57PM +0100, Jan Beulich wrote:
> On 17.02.2022 09:28, Roger Pau Monne wrote:
> > Process softirqs while printing end of boot warnings. Each warning can
> > be several lines long, and on slow consoles printing multiple ones
> > without processing softirqs can result in the watchdog triggering:
> > 
> > (XEN) [   22.277806] ***************************************************
> > (XEN) [   22.417802] WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
> > (XEN) [   22.556029] This option is intended to aid debugging of Xen by ensuring
> > (XEN) [   22.696802] that all output is synchronously delivered on the serial line.
> > (XEN) [   22.838024] However it can introduce SIGNIFICANT latencies and affect
> > (XEN) [   22.978710] timekeeping. It is NOT recommended for production use!
> > (XEN) [   23.119066] ***************************************************
> > (XEN) [   23.258865] Booted on L1TF-vulnerable hardware with SMT/Hyperthreading
> > (XEN) [   23.399560] enabled.  Please assess your configuration and choose an
> > (XEN) [   23.539925] explicit 'smt=<bool>' setting.  See XSA-273.
> > (XEN) [   23.678860] ***************************************************
> > (XEN) [   23.818492] Booted on MLPDS/MFBDS-vulnerable hardware with SMT/Hyperthreading
> > (XEN) [   23.959811] enabled.  Mitigations will not be fully effective.  Please
> > (XEN) [   24.100396] choose an explicit smt=<bool> setting.  See XSA-297.
> > (XEN) [   24.240254] *************************************************(XEN) [   24.247302] Watchdog timer detects that CPU0 is stuck!
> > (XEN) [   24.386785] ----[ Xen-4.17-unstable  x86_64  debug=y  Tainted:   C    ]----
> > (XEN) [   24.527874] CPU:    0
> > (XEN) [   24.662422] RIP:    e008:[<ffff82d04025b84a>] drivers/char/ns16550.c#ns16550_tx_ready+0x3a/0x90
> > 
> > Fixes: ee3fd57acd ('xen: add warning infrastructure')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/common/warning.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/xen/common/warning.c b/xen/common/warning.c
> > index 0269c6715c..e6e1404baf 100644
> > --- a/xen/common/warning.c
> > +++ b/xen/common/warning.c
> > @@ -30,6 +30,7 @@ void __init warning_print(void)
> >      {
> >          printk("%s", warnings[i]);
> >          printk("***************************************************\n");
> > +        process_pending_softirqs();
> >      }
> 
> To be honest, I'm not convinced. This gets us pretty close to needing
> to process softirqs after _every_ line of output. If a console is this
> slow, the problem imo needs dealing with there (and according to irc
> we appear on a helpful track there already), not by sprinkling more
> process_pending_softirqs() all over the code.

There could be up to 20 warning messages of unknown length, so I do
think we need some processing of softirqs in the loop.

If you prefer I could do softirq processing only every 4? messages,
but I'm not sure it's worth it. Also there's no indication of the
length of messages, so IMO it's safer to just process softirqs after
each.

Thanks, Roger.

