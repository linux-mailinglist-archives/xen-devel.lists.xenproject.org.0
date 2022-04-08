Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E34F90A1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 10:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301192.513962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncjql-0005mx-A9; Fri, 08 Apr 2022 08:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301192.513962; Fri, 08 Apr 2022 08:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncjql-0005kE-64; Fri, 08 Apr 2022 08:20:11 +0000
Received: by outflank-mailman (input) for mailman id 301192;
 Fri, 08 Apr 2022 08:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncjqj-0005k8-Lz
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 08:20:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1c21004-b714-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 10:20:08 +0200 (CEST)
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
X-Inumbo-ID: b1c21004-b714-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649406008;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9wTCxEl06g2DDNH3Cv1wFYzDy1LQD+gqrfOekSzJHBw=;
  b=Vv+XNbkL5pwsqv85F6jEHwTEHeWSxBazUsYTK2AKpzUs3Fu9ZKImq3QM
   GHzIJOezPCmTU+LdqNZQOtbtKR7Ri6cQuJql5ghymsAS94lb/hWidrEPu
   tjF/rFkcJRfYc/cQ5qIpUWpDooYxfqWLRpOSKT9AU01+8SkjKiSMD9asW
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68238175
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fE9SSa0NwtThJRgIrPbD5e1xkn2cJEfYwER7XKvMYLTBsI5bpzxVn
 WMWWWmOPfnYMGv8Kth3YIq+oUJVsZDdzIJmTAJspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIw0YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0Vkd+PdVYIJ5Tjs8cWXBUBDTomBfNvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u1poVTa+BO
 qL1bxJGQzSYQjIUJWsVL58fl8yQmH7fMDRh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 m7B8m70BjkTMdWNzjzD/n/EruzImznyVMQNFbm73vlwiVaXyyoYDxh+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmOWxCk2hp5aNlByZGiMaITYcfnc8EyJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaFUwYnY1RvHNEghBHVb5IOi8BxkkeS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyFNIoTP8guK1belM2LWaJ29zqw+KTLufthU
 ap3jO72VSpKYUiZ5GTeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/gNzbeXo
 yvlAye1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMPrYSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:6Rts5qvpX/Ed7FCYBeOJYD8c7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="68238175"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUyvVfViTzhwtQNH6pjHgWz5ayLnFJnCJCzkbTRtYUrfhbThjSdl7qEcvbyABN8EZW+dhpW45pKIRrGfdDQGun4e5/GyqME+BtxE4qICGAHM82ckHttzOzRDAcJbrXuTFToT2e+6pdj7ghA1gatAQHUFy4PT0OryrYVpn1JFTw20m0AIPKoyerp8K8VPyJmUOjU0qyAeqy8aoaa4rObbmBYoHm2BqrXyUaCmLt+tNeENH1HNpEqi3K0R2zjxRou/3YVkfuXtmz7bzpZz73dAhPgaiZ4c6w5GWniT+ouT6CF99l6QuuFXR2suULuZfWuU1+8Iq31szgg7XRs2XL8Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smyQIvUoVkqdAKDiGKZM1MrDQ6rHXGCDw1hkHrsAksI=;
 b=PDyRN3o52JFpswG/WFYKBkKcM6iElx1uoGdbZnGqrkF3bGwdCXx/SloNQJH+cBy5cqlB2Ea/Cv3V1cL6mndwlGQ45jndJOqJ2EW/3QfhK6XYNxanSIpYQ0DkSqCzSpSc2hDMU57Mf3S3slOw+kBkreYs5IIFyANaXHq8iVZ5UjTvKBGaAx8Fm4GkavXtxcTqz2+jnCUMj2vIDFZ90jf9DCpo9F0T6BeMBW7UNW96eP2XWefN66e81moB2AglDTlaLV19avKUizwwk6C8Qa1R87px1pRyPYWlgkGAbYUk4lxvItlkUucXp08S0as2nOJvrHAWgeLTwI0u6F4X/DwxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smyQIvUoVkqdAKDiGKZM1MrDQ6rHXGCDw1hkHrsAksI=;
 b=LW7qevdPMT3RkeOn5tir9iWsSGc2lyaJPJnT0nuVErG5w9U0M3V9NGm0LD9NhMUmoJC+fWkxxpbnobnHcbw6MJOTZK5yVnhxb0+m5FHXMjxMnd3z+mPg8E/JlNchIlvZ7NWdVnI408bQ7VLIJkh5AMHvRTzZ0HnUm1do1x9U03U=
Date: Fri, 8 Apr 2022 10:19:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Bjoern
 Doebel <doebel@amazon.de>
Subject: Re: [PATCH v3] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <Yk/wKp3XyAAPbqgc@Air-de-Roger>
References: <8db632ef-9d9c-d17a-54fd-49912d88d599@suse.com>
 <YkVko/vqhfAfS5Jb@Air-de-Roger>
 <ef884c3c-26b4-1bde-9344-aa9be30c1cbc@suse.com>
 <PH0PR03MB638290EA5503FE0FED792C44F0E69@PH0PR03MB6382.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR03MB638290EA5503FE0FED792C44F0E69@PH0PR03MB6382.namprd03.prod.outlook.com>
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cea2644-9ec6-4143-88e6-08da1938929d
X-MS-TrafficTypeDiagnostic: MW4PR03MB6393:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB639380ED7B8E54A592374ACF8FE99@MW4PR03MB6393.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hg8c2JtmpdkzaFiFTpqx39xxwRxOPDC077vbXKhR0oVQIz50jWlYxD+i4xJN8HtNTq3m3fPUtXwNswHmxrCmYgXIH5RWaBATZUC4Ecn68o0eQ9NPU9HKnv0kb9eID+VkL5iVeBB4qVCV9OW96H3krCT34/qRhofU+1AcmMaIWp0NyTKLmxd2ZUMGlKqTPuu1VNczWruhD3DTaLIwVAKCTA07GADc518lnyo4u3LOMloR3LkXU24NYxnmInR65vjoEtrzvnIu5EZGVA1MflGosct/+ZoQRi/WrrJyvBWfI+toO9cQiOQ0nQG3+wbDXLhc5cnwVfszL5blji1oLqutuwApIF4xr2kiyNfRuNBDtwNECShTJLY36KYIVEqWdd6M1YALkWb7wYkILGlhx4Nc7K7UgdDH3W17qo1WUQ45tJfoNvsZkhsPxwrSbgErN9Fz0mPuo/k7R6U2AQFUCb+DUkzf9ngj1KV8pyCsV21e+4GTWqxe2uD0DMy74lnRuzuwWMZeP+38cqjGuQZhoHFOgOp7AdBJhAgK3uEus+t7tZtcDfkU0YiYasevOObQ1XtsLPpTJ/ecEIfSqiywPPAEolG1S6GOfF/mubq8VWYKn0kbonenK0U76Rr5po1jMxV4egWAEO3Rhcwa1vmOq4Lb4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(186003)(26005)(83380400001)(4326008)(8676002)(33716001)(66556008)(66476007)(82960400001)(6486002)(86362001)(508600001)(9686003)(2906002)(6666004)(66946007)(15650500001)(6506007)(54906003)(6512007)(6862004)(53546011)(38100700002)(5660300002)(316002)(85182001)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNiTFhRN1FweFdoK2pSRHJqaWpuS3lBaHRtR2VsVXZxL3laQUl4SkdDMEFQ?=
 =?utf-8?B?MGVqd1U3c09PcGdXbTRMZS84UUZ1alZvYjVTZlZhOVBIY1g4RnFrWWFKeDMx?=
 =?utf-8?B?YmFzditrVEhUT054WVU1SGNYd3BLL2JRTXB3L0ZIZUZmcnp1Ykg1RWN6Ylh3?=
 =?utf-8?B?b2VFQU44d2QxdDhWSGtMMVExZW5IVW5wREh0N1NzRGFIc2VDOTVDTjhNdlc5?=
 =?utf-8?B?SlkyQUM1b3p3Z2Z4Y1gyOFdaK1Jnc0U2UzBUTDh3SXArQkZwZFRQV1grZEhD?=
 =?utf-8?B?VlJFS2dhTjdQNGppaC9QOGlmbFc4bHpWMWxPV01melM4SjJuenU4ZFZ4SytC?=
 =?utf-8?B?VjM3RHJ0WDFSZlhEY2t6VkV2OHhzQUN2U3kxbDQ0ZkNNUWg0clhDT1JXVGtE?=
 =?utf-8?B?Y3luaG1EZmUzOVQ2azg3cHlFS0RwVTNIWlJEdDZRR0o5Zlk0T3dOV3ExRjFZ?=
 =?utf-8?B?RERISlZ0ZlV5RVMwd01paVBCSUZvV254MTNuM2liMnpSVVN5a3lvOHA3eml3?=
 =?utf-8?B?TTFUUzBRVXpoeVVLQ2M1andOdXgwL3VqbWxVVjJGNS9Ub0RjOExsMTE1MlJa?=
 =?utf-8?B?S08rSldRaW92SHVHbEM2VUtUWCt1NnczcDNsYUpneDJnaitrbmJlRkhMNk9U?=
 =?utf-8?B?ZmFPa0ZUenJpakVNQmNGdkwrZGR5RG9kZFV3dzdwTkR4K2ZOYjROWml0aU03?=
 =?utf-8?B?M1kzVHo4cnEwRnRIMFV4cnhUVkxUdVpCcVJmWEExbWkxZWlSTVdMbWNFeWhC?=
 =?utf-8?B?dUFYWmxwZHUvZGJlYjAxZjB0RHhUOVVSZHJzL2tJWUw5NHRicW5jQkdZcjhI?=
 =?utf-8?B?dE9vK0VYV1lmUVY3bysrODQyYzQ5M3ZQYWFQTml0ajhldCs3QVpxSFYyc0N5?=
 =?utf-8?B?WmphM2VnQkpQQ09CVE1FTnk5L3FFeVRhekdkeHcvT21pYUpqYWx3eVlwNDdQ?=
 =?utf-8?B?L0wwMUNYRTdzcXhKRVR0N1IvQjFTMHZzRHMxTnNocm4zTFQwbzhFWEpkZzJq?=
 =?utf-8?B?cWJRQllqaDU5WUtyMzNYamMvNlFWK3orRzIxendCQmxTQTJPallsWUR4NU5v?=
 =?utf-8?B?andmT1BJaFVqTlRaVjFCNzJFN2grMUpDMHBQWXp0Z1QrVVdCb29DVmRoMUUw?=
 =?utf-8?B?TWVKWDVzc2h0N2lzZVI2SVVMOXVuVGMvK2FJdnZPbFdEa3JGenVsME1JNTUw?=
 =?utf-8?B?MkJxd3EvSVQ1SndXdTdIcEZmNTdsN1ZmcFA0RHZLNVZPZFpLR0xIS2VOOUFK?=
 =?utf-8?B?djdyb2s1SWQyRGRDSXk4OHNnWDE1YktzcXZsRnJyMkFrV3VUbytVUjFtajBF?=
 =?utf-8?B?US9nWk5FVzE3cnhNTzI3NlM3U21vNkFGWGRtVG1XRncwTWJkR2dCREU0WVN4?=
 =?utf-8?B?dVBhei9oTHRrY09IaVBob3RLRmxiR1padnlhd2JQMEJOUmZpeUYzdmN5OEto?=
 =?utf-8?B?VE16SFkwTkFraytxRGtGdXd1b0ZDSnErQm10ZGxiUGwzZ28vNXFlbEhFdkp6?=
 =?utf-8?B?SkNMNGNpQmhSYTJIWjlvSDllOFhDQTFsT3oyMXZ3SnJLVnEwYkw5Y3BTcWZO?=
 =?utf-8?B?UlA2bjIzZXNhM2xobHdEKzhubXpjSjNXdVltK0NCVFprbVExbFp0Ky9IdUlu?=
 =?utf-8?B?aXlZc01pWWZiOUJJbDd6UmdrNTRlTEFlZ1lzcEticXp1bFdQUFNQdVJLNTBw?=
 =?utf-8?B?bElic29xVmNCVG95SXV5bGhCODdaVTNWVmFPSGhRemxFODlsY3dSRndOUFBY?=
 =?utf-8?B?bUVSZHhEZXRUS1YwRWljdXVWcCtUaC9zeXJqaFpzeEc1c0lKdktiZlZjeXpo?=
 =?utf-8?B?TnBrMUFHSXV2M3Y0czZ6Y0JueHdITWF0MVRHS1NYVW1oWlBrYlRkR2orNFpX?=
 =?utf-8?B?VjdrRFR6TkJFUTBBZVBlNmpHRVF1b2pCdGVXbSt3Rk1sWm5iS1QvYzduejQy?=
 =?utf-8?B?ZEZpZDZWQ3ZHUk1RSW9VVExXN1IvcEphYnQ3MEREOTVIMWJkSUgvT3JjK21C?=
 =?utf-8?B?elJtN2xqYXVXbTZnZnE4V1NkTUFkK1JxNVdoOGxyRFdXY0xabnBBYncvaTA4?=
 =?utf-8?B?ZC9BYTJ1VGVubGJqbnRMc3ZFQUZCa0ZkS3NNNXpBSkFsNjR4QUFHT0VYQWV3?=
 =?utf-8?B?ZmE2N3d3aUNFVThkSkliYkFkU3BuVDJtNGo1KzljaVNBSTFVTjhRMjN6a0VE?=
 =?utf-8?B?b0pway9rT3dhZjNqTjN5Q05KdDArTzBVZThQWk4xYlZTQWdKSHFGa1lzeTNr?=
 =?utf-8?B?Yy8vRnhrS1J1QW9HTzFyNTJCZnNhcGg3cVdvUmFPN3lQMWk3c1p1Sm92bUpN?=
 =?utf-8?B?dzVjUnRoRWVvZjd3ajQrMWhvZzdiYkNmazVGVlZUZTJBWndHVHF5c0VnNWZ5?=
 =?utf-8?Q?HyzHRrxcubPMi3bk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cea2644-9ec6-4143-88e6-08da1938929d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:19:59.6882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zlNFt3UR4jVx0VLNmwDb6uXB0lHr71tm+p2mAiMchQjYHH0dYsoksXnNaZzSqQQuhc6C1TaC4SABG7xLo9Xnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6393
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 03:44:16PM +0000, Ross Lagerwall wrote:
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: Thursday, March 31, 2022 9:42 AM
> > To: Roger Pau Monne <roger.pau@citrix.com>
> > Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Ross Lagerwall <ross.lagerwall@citrix.com>; Konrad Wilk <konrad.wilk@oracle.com>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Wei Liu <wl@xen.org>; Bjoern Doebel <doebel@amazon.de>
> > Subject: Re: [PATCH v3] livepatch: account for patch offset when applying NOP patch 
> >  
> > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> > 
> > On 31.03.2022 10:21, Roger Pau Monné wrote:
> > > On Thu, Mar 31, 2022 at 08:49:46AM +0200, Jan Beulich wrote:
> > >> While not triggered by the trivial xen_nop in-tree patch on
> > >> staging/master, that patch exposes a problem on the stable trees, where
> > >> all functions have ENDBR inserted. When NOP-ing out a range, we need to
> > >> account for this. Handle this right in livepatch_insn_len().
> > >>
> > >> This requires livepatch_insn_len() to be called _after_ ->patch_offset
> > >> was set.
> > >>
> > >> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
> > >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > 
> > > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Thanks.
> > 
> > As a note to the livepatch maintainers: I'm going to put this in
> > without further waiting for suitable acks. Just in case I'll put
> > it on the 4.16 branch only for starters, to see that it actually
> > helps there (it's unusual to put something on the stable
> > branches before it having passed the push gate to master).
> 
> Thanks (was on PTO and away from email).
> 
> > 
> > > Albeit I don't think I understand how the in-place patching is done. I
> > > would expect the !func->new_addr branch of the if in
> > > arch_livepatch_apply to fill the insn buffer with the in-place
> > > replacement instructions, but I only see the buffer getting filled
> > > with nops. I'm likely missing something (not that this patch changes
> > > any of this).
> > 
> > Well, as per the v2 thread: There's no in-place patching except
> > to NOP out certain insns.
> 
> Correct. FWIW I'm not really aware of a valid use case for this
> 
> > 
> > > I'm also having trouble figuring out how we assert that the len value
> > > (which is derived from new_size if !new_addr) is not greater than
> > > LIVEPATCH_OPAQUE_SIZE, which is the limit of the insn buffer. Maybe
> > > that's already checked elsewhere.
> > 
> > That's what my 3rd post-commit-message remark was (partly) about.
> 
> old_size specifies the length of the existing function to be patched.
> 
> If new_addr is zero (NOP case), then new_size specifies the number of
> bytes to overwrite with NOP. That's why new_size is used as the memcpy
> length (minus patch offset).

Sorry, maybe a naive question, but why not use old_size directly to
overwrite with NOPs?

Is this because you could generate a patch that just removed code from
a function and then you would ideally just overwrite with NOPs the
section to be removed while leaving the rest of the function as-is (so
no jump added)?

I wonder whether we exercise this functionality at all, as I would
imagine is quite hard to come with such payload?

Thanks, Roger.

