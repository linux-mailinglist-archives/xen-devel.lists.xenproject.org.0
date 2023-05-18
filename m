Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1367081F9
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 14:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536334.834561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzdDV-0008Qm-39; Thu, 18 May 2023 12:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536334.834561; Thu, 18 May 2023 12:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzdDU-0008OW-VO; Thu, 18 May 2023 12:58:48 +0000
Received: by outflank-mailman (input) for mailman id 536334;
 Thu, 18 May 2023 12:58:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cfsf=BH=citrix.com=prvs=495ba01a1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pzdDU-0008OQ-01
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 12:58:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b85a65ad-f57b-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 14:58:45 +0200 (CEST)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 08:58:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6957.namprd03.prod.outlook.com (2603:10b6:303:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 12:58:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 12:58:39 +0000
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
X-Inumbo-ID: b85a65ad-f57b-11ed-b22c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684414725;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lIfqmHs8J9VyvC7I3FI/uxTkwzd/25bxlSUPz06dm54=;
  b=ErO0cclRmoZ9fpH6LITmkXhPx1F+DEZegrnOV7UYRV6pYTFoIRkxHDri
   lWUG38XhxY+mQuAPMf2jOd7np6vBvGrC5maW2tBrtumgTWK8iUD1Ze0gD
   +wse5oA+hrrayUuOJSea9CtJEflUhyCsRpsmLsTzoprLngH8F74pMHIEX
   Y=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 111977752
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/Ml78qxuRpKJCsny1bF6t+cbxyrEfRIJ4+MujC+fZmUNrF6WrkUAn
 WUeC22Daa6LZmX2KN5xPYi1oxxS6p7WzINqTVY++yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPKAT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWVN8
 tkDchMJVEvAuryHkauFDdFHvf12eaEHPKtH0p1h5RfwKK56BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVkFUZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiAdNNS+LlrJaGhnW6+1EwBxAVamKjoP2yt2fnZeN9O
 24Lr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YWqU67O8vT60fy8PIgc/iTQsSAIE55zvpd81hxeXEtJ7Svbp15vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Rgyt0q9aL2DOk0kDqANuk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: 9a23:2xeoIWAmt5oYnIn6Ey1k82sPQOMhSCae8SnhclaGTl5Cc4TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Awivf9w8Jk1qyiijDcq4Oe7SQf+5V3oehBUMyqI0?=
 =?us-ascii?q?Hv8K5HHVOChWNriviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="111977752"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG8Q2Dl2OFbWPq4HQ30j/+tWL9PXVxYbSJcRF4of7j3F3GhSEmJTzF0hj5qNLBx1V+wf4GFgZcGr3mpFHkSlU0ycDLxYzzt5fwmtjrHWV6zJ6IijnAL2XEm1nLzOamcdRnDl/0e4tKrNuw2d3ut7Kij37uyvvnKmAOuZQAQvklZadaeL9rhb6bCUdcrW3pI/09ByAarylk01mB6pNdXwOTZn7saUvQhAiWNu45GOOWFn60ySuqvQ4fneb84Ug4R+bgU8mL1JwA9v+sXZb3sR+R96coDxbfSUWvsu1YWM0NTn+P67yvc/qm5Qhfs8PZp4nw4pe3SEgrxXSAJE7HyqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIfqmHs8J9VyvC7I3FI/uxTkwzd/25bxlSUPz06dm54=;
 b=ZpcXdXzcgqbNYDHjeI1utxhYpTwXUwYFK1BgxTMU3HMV4KI02nmREcmBi7vX3oPbD3gFRXZyktB+zz4TdB7ZWEi/cmSP8ABTf7J/YQhszk6PyNsGyGQJJpIrS3zkSttktXTQ9un0eGW0azAJyiagWGIxpbkTWd+xwK+1LYlOjBnEeqiLjS2pRlZP0EAzdlDNg3E2y2fnhCup5y5VLxxS8A7KjR2NKBuzOEwVSckB8rPpwi6ckUldGnFn3OEljv8CVFjBupk6ZiabFHefiDutDoy2HkgHQ1L8mCqTUHeIMklBZJkrpmQK8bBNSHHJLxzapCDPsJ5Z7VzcseUDBwDNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIfqmHs8J9VyvC7I3FI/uxTkwzd/25bxlSUPz06dm54=;
 b=MmhcvgTTKzSoPHCrQ9zAt+ZgINc+ngpakK7qydOl3hGlHcbMos94OjBqUlD98b/L2YtWV+l1zpKAdqnjeiihLEX5KXR9jxav1N1/J2uLakxSCmBdLTEPmqpoxztY4FFOaUkKJmhSFqBTIJ3jMC0mVKvb3xEajcrWtMVXGgIlhmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2274c165-5e6a-2e13-278a-da3c9a6dab4c@citrix.com>
Date: Thu, 18 May 2023 13:58:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] pci: fix pci_get_pdev() to always account for the segment
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <20230518105738.16695-1-roger.pau@citrix.com>
 <480194dd-4757-d9dc-a2f2-7dea9182aeb6@citrix.com>
In-Reply-To: <480194dd-4757-d9dc-a2f2-7dea9182aeb6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: d63fb330-d175-4750-46fd-08db579f99b6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MK904uzV163+wQiotCnya9DC8ld/Xqn1ts2O0pfCURimXmhv8eZou6MQe++Sw+d6sSr0T7RT+MSzLfnaC6jJ68EYUPhDmvljqwtI+dtqKtGE20B8ISeAws8aRyVP3Sg7ADcHO7V5vzejYAoaYGdiU90KLjVO2ZPGdfJ1sBQFqXwYBwpaAjS3A/DnYMiqmWRp5+F2j/4Lq4AFFeLUBYo64v+yr/QTUhMQbtaVqqft7gf9eIEg8ic+uIwf5PJMKZ1J/fXyjuVFU0SRnMfe+54+B82VupuZHw5ice0ki9+MqSSVmY2kN7pA58u9zaDrdNu8UxvwKzoMkxYYr0gwAiYGHwCJj8Fbr1P+BrogenEjoT+SUzFrX5ybl+lw0bbwnCiBu4iXwuIzY7xOA7bi8sQa/lpY+1bzV7ktWUZVwKcK4JdmT8aP0ZqcIwms/3tZLbMvtpXnQMnA7Sou3FJn65Bk/kIul7WhoGMRFYRKjemjom9rvMegWGc6IlaKJKvHio7Po0li1uiGuCHpEolpcKkagSD1OT9iEHydigb/3LrGbOdkVCSe9WlfP4vlIFyJNYr+Gmm9GgeVEKWzXEjBFzHZYbMRrLLS92OlfgT4jXvRDXXJL3K8IFidnD+S+yZVTxMldRlGYbjFsiJIbychU56Ntg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(36756003)(4326008)(316002)(66556008)(6486002)(54906003)(478600001)(66946007)(66476007)(86362001)(8676002)(2616005)(6666004)(2906002)(5660300002)(8936002)(15650500001)(82960400001)(38100700002)(31696002)(6512007)(6506007)(186003)(53546011)(41300700001)(83380400001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1pVcGxKMXl1TVJXbkVhUitNZWp4Mm9RYmVYSWREQlVUR3d1RGJsSDVLUG1v?=
 =?utf-8?B?Z2o1VWxFZXVXNEFOU3U1WllWamlFTC9vdDVBMDkzZm1PRkdDQkN4Y3FJVE94?=
 =?utf-8?B?YTFyVHA4ZVM3RlJVamVkeUJidHk4L043VWw3eVM1TUw2YWRFWUVTYXAwcGxW?=
 =?utf-8?B?M1ZEeTZnbHZBYXBwbkszOE5SN1BBVGx2YXN5aDc0UDFiNzExL2tNNWNQZkdX?=
 =?utf-8?B?ODJkZEpLN3RtbTQ5WWJSQk9ObHFmWk1NKzdHOEdmb3JPeHhCaTB2T2xWV3FF?=
 =?utf-8?B?U05zQXVLb2pJVVpkdmhBZXhtREVlSm40YWxvM1hMeVM4dEpDRDI3cnNCNXhv?=
 =?utf-8?B?MHlrMkpCd2paSTZINW1XYVNQMExNRCtJM0ZBWVBvUDViaUhyZE9Mck5NcjZp?=
 =?utf-8?B?WVJ5cGlEVlFXbjJ2b3kzYTBFcnVwVlFHOGhtUUVOOHdabnUycWtlaG1zVWx0?=
 =?utf-8?B?RlpJellOYytCUkJER3VKc3R6ZmlLWkRRazdCdFVLdVdUWThnNSt1OGE4Tk9r?=
 =?utf-8?B?dTM4Sys3UWRmK1U5TC85Q3NTTW9iUkJSZ2M5VDFaemRqZDJhaHd4ZWI4UG1k?=
 =?utf-8?B?MnFGVG9yeUpoOEtUOWFTSHpoZ0Qybzh0Q3o4UjJWNy85ZVplSzFyanZ4UTNQ?=
 =?utf-8?B?VGFjbGdjSnhFTWRIUW5sVWRwVHVhWEN0YkgrSWhXQzUzWWNPWFZ0MUkzNlZH?=
 =?utf-8?B?ajlwNTdMMXdiWm9WL0RCUlluNUhEMFgrNVpCM2w5ODRYeCs0SDdEZnpyS2tZ?=
 =?utf-8?B?K3h0dlNoUFJZRTFkQXpqNEdHKzFLWDc0YXhYWE5tR0NCc2V1QnlJaS9Yc0tX?=
 =?utf-8?B?Ryt0TXBqbmdEREJqRHA1SEUyYUloNWtmMitrNmt5eUgvWGNVVXpIUWlHUGtY?=
 =?utf-8?B?RGFzenR1TEdGcVNrc2NoWXdsSVdOTDdLRjU2bVFMdE5lVS9pWUtLWjllMEFU?=
 =?utf-8?B?Q2JRdGVVVjF4Y2xTZWhQREgraVRWTzdLMytPWU1FeFN2eVRtQWJmOU8xZXFU?=
 =?utf-8?B?UnJsY1J1cWZPUkRVeVZoRGhoVktoZk84eUZDeGtDOUxsSFVWSGxqdkJaUlhT?=
 =?utf-8?B?cyt0WFhJS2x6TkFJVGVmVitDWTVYc3d1T1ozY3ZXR3lHUUtGV0UvRUgvM2JW?=
 =?utf-8?B?RCs4U0I2QWh4RkxlR0hDbjVEcWJleXJtUE93c25QVFRhT2lueURxa3ZHS054?=
 =?utf-8?B?TVovbjBoK2RpNkNQRngwM0RLdHFGem12d0xsazBFQU9MaldUamVuMjg3S0Vx?=
 =?utf-8?B?WDNjWmpDMDIveU1ScjV2MExBLzlyZk1SRzcwcTdkcm11a1ZRKzVGSDliaDk5?=
 =?utf-8?B?MUkyeExDM1NUTDFkd1lVWkROVk9haTUwMjdmblFSVFFqajhRUk5iYmV1R1lE?=
 =?utf-8?B?SE4yMkg5NDJMbDk4SGdON1pxaFJUWkwrSUN3MFl0RUV5b3RjSjJXZHNQd1lq?=
 =?utf-8?B?em9rUDg4WEVIQUprTE1WbUYzYldHS2xSd2NDajVDZXZjL1dIMWlxbEt0U1or?=
 =?utf-8?B?R0xEZkRFUk4xWUNESkFFa3pwZzJpYW5Hb20wMTdxUFd1R1dDWlFGSm5DK2g1?=
 =?utf-8?B?T3dJQVZ0Ny90bmpxcWVQOEo5bnc3YzEwbmhFd05wYTJaT3R6NzZIbDlXbWdL?=
 =?utf-8?B?N2lhT3NUSXY0SlVRcTkxY2VDRmZyNVpvRjR3d1o1am04dkNIcG1SbjYrSlhn?=
 =?utf-8?B?cVhnNnBnSHJpR1pNUS9NSXpIWGJwdG9yTWZWRkczcW14c0djWkorUWs5YVRH?=
 =?utf-8?B?eDRsdU9wZTFTcUlGdGlLVkJibzhsc002ell2OEc4eExEZG5IR3ZKa0NEcGNl?=
 =?utf-8?B?WXpzWUdwMmI5Y1NFS29OVUtmWFQ2M3VSRjM0NFlIeDU5MnY4REM0cjFjcXFl?=
 =?utf-8?B?dGx4K1JrWU5qZ0ttZGpzTjZld3ZWY1lnT01udHpLcXEyUVFjVmUyTkRMZXZ4?=
 =?utf-8?B?d3ByMnM2bUJtZkNaWXErUUNvK2I1eGFtNi92RkZ1V3Fielh4L2VrL1pnUDY4?=
 =?utf-8?B?Z2laUDFuK3VFSGRrcnVkaWIycGh3TXdXbmpTWFJZWXBRTURFb2praE8ydzdO?=
 =?utf-8?B?aHpjUWNZY0wrUjRGVE5uSmkyU25rRGVpZFVzWXA0cmFPQ2J4TGZJV0Y4YWJV?=
 =?utf-8?B?YTF6NWFpdStpUjA0ZU41SDY2eG5SWkxoTzVCMlVwU3F6akc3RFh2dk93TTRj?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jmeBMvmLHt3okxXqjh0312OGUW/D/5fmytfttmHo2IWeaQtUZdbnkZUrVrCo7llYdiAaSBDE9MXb20BYojonyKRih4ynaMi12/alE3EPh5jjdoepXwKLnHjnc8oTCBLklr85bkwQrMT9Ad7id2no7uwSoFhezz7fPNobqladZie+qGtLJ7i/rOqjJpI/CZTqmXp9CmXVgKzkOi3DYNpyTiRqCjHsg1MabRzJv2PRIrAn0u1f5UuhsedqbNpGUv8s5L9Vw028wekaStUsDFEFLh5cZKN7+QM3wk2M9w4Rpy8MeXA9omtgS3P7UuyrfHh6cbOVBUl3dwUXoCdqd+clF1L0cvBeozcOPSkq3Lh8Xf5qGVUvZHwKxeV3PmtjOsTxfkTRbDi+NfwR1YMmKyXoum05wbS7LsKYHltgMLIK6IVEpaoBkd1lv9Ilb79t1Q+G0esnFXk5vN/2hO4FuAglfkvdNNgxraYs2c28rpp4ODAF6NvyQZneFfrUPqD8l7HxY9H2GGTMbIVy4y6SDpsGwYEOxPzsj0RaukcemdWc/poFFOEPkRAwZPyg9n5qL0nz6w0ywStUKmcEtFzxsnDry2cxcv5A3IAAaHtGqduTWPAWwa/MlSp4KCVPep3crS42KJvalDUoLOQlsWsmoFlV8VvPLlVqXMlXW3eGWDxaSk0kI7kKlmh69ZT99+x1mGEYtTQgTV+4zIeRFnINigu8hn6v1CuBkN7o1Qk01r2wetUpGiBLu9RCf5WzrIekq7eJnfmW8T1kZLNVYdhde1sieji0IHTVxzJNkftNTCTXquaoVu32KrGs/U2qp/XpfcDtKUzJtpG3UMSljoP2nYariQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63fb330-d175-4750-46fd-08db579f99b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:58:39.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeR5MckxlkJ+fyQuFrPSFdRKjS//lvcLLR0XHkTD7dmoP9oRDkF5KgkanyZg66glJnm2Tc8kipH083K2g7d/TmAAQ4eBqk1KXMLrPArkhWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6957

On 18/05/2023 1:42 pm, Andrew Cooper wrote:
> On 18/05/2023 11:57 am, Roger Pau Monne wrote:
>> When a domain parameter is provided to pci_get_pdev() the search
>> function would match against the bdf, without taking the segment into
>> account.
>>
>> Fix this and also account for the passed segment.
>>
>> Fixes: 8cf6e0738906 ('PCI: simplify (and thus correct) pci_get_pdev{,_by_domain}()')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> There's no mention in 8cf6e0738906 that avoiding the segment check is
>> fine, and hence I assume it's an oversight, as it should be possible
>> to have devices from multiple segments assigned to the same domain.
> Oh, absolutely - skipping the segment check is very much not fine.
>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>

Sorry, I should go on to say.  Xen has had code for segments for years
and years and years, but I've seen plenty of evidence of Xen not having
any kind of regular testing in multi-segment systems.

Sapphire Rapids is the first platform I'm aware of which is
multi-segment in its base configuration and is going to see routine
testing with Xen.

I don't expect this to be the final bugfix before multi-segment works
properly...

~Andrew

