Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27E69942E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 13:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496527.767312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSdFH-0000jk-9S; Thu, 16 Feb 2023 12:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496527.767312; Thu, 16 Feb 2023 12:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSdFH-0000hY-6F; Thu, 16 Feb 2023 12:20:15 +0000
Received: by outflank-mailman (input) for mailman id 496527;
 Thu, 16 Feb 2023 12:20:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSdFF-0000gg-LP
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 12:20:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41a9423c-adf4-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 13:20:11 +0100 (CET)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 07:20:00 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6631.namprd03.prod.outlook.com (2603:10b6:a03:388::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Thu, 16 Feb
 2023 12:19:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 12:19:58 +0000
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
X-Inumbo-ID: 41a9423c-adf4-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676550011;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hYtL4K5tER5uSOo4YgzLbAjvFm8f2+ZgpAXv4CgdhPU=;
  b=iMTFwbieV5iaL4jm0aoJWUWXD7KDuUxcnRmR2vBEKCaW6ZWm+rTTMSV/
   26GWYc1/lRTtdm9TV7qUR7kJL4+ZVoP9+evy/FJ9HxKs+jLi6OKWz1BMo
   fi1+isL2Z3FK5qXp7wEjZFmvfuu76vWD4Os0B5oAF2v3eD/81koe+xkQc
   k=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 97298405
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q7i3V6igVTMhEyGbXnPtWUGUX161iREKZh0ujC45NGQN5FlHY01je
 htvWWCFaaqLYjD0co0lb4jkoE0C7ZfVyoRiTgNupCk8Hi0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gaAzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQZEDxTYjqH2N6TzZvnQflhnONyDML0adZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1a7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReLip6422AD7Kmo7JwwPaleyh8aFqkOUYt0FB
 3wk9icPhP1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOtsU7WDgr3
 V+hhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPA1LTAxfNJLYLcRF/eu
 nEBwpCa9LpXVcrLkzGRSuIQGr3v/+yCLDDXnV9oGd8m6iip/HmgO4tX5VmSOXtUDyrNQhexC
 Ge7hO+bzMUKVJd2Rcebu76MNvk=
IronPort-HdrOrdr: A9a23:gtnofqrt4wXnCY4NncRoCqgaV5s2LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwOE80hqQFhrX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YET0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dNT2CA5sQkDuRYTzrdnGeKjM2Y6bRWK
 DshPau8FGbCAgqh4mAdzE4t6+pnay4qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFx9f3Ls49m
 DBsgrhooGuqeuyxBPw33Laq80+oqqs9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbknyPgzDEtwXn/zkLwuwqvneXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o4GgbWAhqmOE5V4Z1cIDhX1WVoUTLJdXsIwk5UtQVLMNBjjz5owLGP
 RnSOvc+PFVW1WHaG2xhBgl/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgPcSm38RnahNPKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBGB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT9Yd3U8LAd23FFgMy4eFKyWhfzDGzG0vHQ7cn3O/erGM
 paY/ltcrjexWiHI/c84+SxYegVFZAkarxnhj8KYSP+niv1EPybigX6SoekGFO/K0dsZkrPRl
 0+YRPUGOJsqmiWZ16QummlZ5qqQD2xwa5N
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97298405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmHdjPfMJVunWS+FgFJlOIyF1zcv61h289kQ3ljWM6cTSrmSQX2MzKRgmslIyIUE8lnQ1SN1JoLWE5VPB4XTsymU+fXYcblel2FatXf1Ge0DNEXTe3jwcN+OROFXShqPkPjYA5fUyN9qVXbf+sCAVxuD2PVSbrPTXfVta4g4b0N1m0j3WwgLkwwsizLSiAa+NQd8lfBq1ql5iUk42oSVz7fVIH+oAJ5InZ4XfV/IFpATE5kMAywsKHBhHmRdz97RWQLlU12asIUPXGA2YZii6t+c7QpS5ZoKf69egjpumd+ZvWkMyZoOdQrHifEwABy4GoG8F17KEkiib/sYh6fr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgAmLBkoc20PeqCsSaEZQhbpKrbVF7tlsH6wabjW/jc=;
 b=Mag/tEL3Pgfo102CV9PbjOCpcuyHeBoY3dSrf+GpBRaHRsYCivAUOFz7zCfvQcaiEDTxcmrUnBdok6i6U/k1jBJrNWoBmE0OmT1cB5wQfCKbo7t5gXJSbKhv5/T8xWyTASNVtNn2BCuJYAyB3+1JiJmru0TZ9oQdlI/R1srvAI9+u1Vd5q5oK7tNJ/YuQU5mcbENqSUwKjmKA4DQJdkAEWVDrWMlIYCPh7h8UIjmDpumfM6vW3KfnoTlxVuLlTwcP3QRx8PyijtBoD22BLL+MOFbrKtyJLjjLBLd3CJMEUtIHMjshsKDBQ2TFPH7IXTgJuUCTdQDuCE+xbqbrDemQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgAmLBkoc20PeqCsSaEZQhbpKrbVF7tlsH6wabjW/jc=;
 b=Ws9IweX73qP1FyN47CtruUVqCxfGqA8Dd/5xzJWY/9G4YqHGRBpIgR94Uyw0U2diOeB/BgyTMA0uksjgo5iQZLc3eZ8+Y7+xM+ndsFMT/Jl3RI7Mt1Rn2BzSBBLHXSIfAGhO5UsskxzC4/DQrQQUDHlg+d7ImvpCcyY4eB70k0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4c52d703-dd7c-b316-5e37-38c9aa705725@citrix.com>
Date: Thu, 16 Feb 2023 12:19:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
 <413b6d1439a31e24719321494971cc165bd6942c.camel@gmail.com>
 <29623e829602d0a7861785b8f0a47d6905ac89c4.camel@gmail.com>
In-Reply-To: <29623e829602d0a7861785b8f0a47d6905ac89c4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f41c02e-4039-4613-7b2f-08db10181e4a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7vm8PSUYPfqvpGRN2gB/c6sURKuPptPENBmMgopka8J8CN08Yi/niOTa+IaaQXIbCjwO+6cuwqA/kLpnqGHCILSBDe4H5YKTyKH2WE3bODqbSAa4nnPgfp6qzYSWC7iGwGE4t8FZha4MsgsKWvzc9iJOwuT/sTtnF3HX2Bw8au5hW3eV89IAA3uwGbAdcNOXryp2Vu3WfAcM62VQyT+M6KzOBXpfH5PEYJbZ7Wjuqarn0yQjhbGENubeH0HG9Ewe6QipIqK4IGCqKvAnqd8q7eDdC7jVhSpjDbNkwdUgkyWoedIQPcSNsHMetQiehvy3x+OPkESJcHw3fW3vMi7vMxVqfeQxU89j+7Mwx9cuiZzR5/Rj55Ryr0MWXMghyHsTfTp26L1JgwiqvowJJvq+vPdSeempFilQdo02c4uzpF2vF4ERU/5EXtEBFNmiqb4FXAa75D6MmUNp5QpYdWVIE9qM7crX1uiog6QhhDh1mQ2IAGhjBW3WrlKp9cuI3nUW7ncdUOCbKAujez6Tw7TpRitm0gdLNcZdN/a1MX74ZtQO5I7l5IVyxXTQo9+LZ7QxTRVTqEsiPSY8DLLtoqO2Cj6TedXdVHcGoDeyrVvDG0JjIBwW2gAaoH8wDBnoQiGZNrDM+kPvRhK+doRFkilvpJH4isVb2GmIIze2/PrwFk4u/KKL4DJgoyJL9Cq6iNVrBmDwQW6zfenX/S2GH+gy9LVO4wevElnmaAzZCcF1AtNMs1TFua/Yl/sTgyO4VUcL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199018)(54906003)(316002)(186003)(53546011)(2906002)(26005)(6512007)(6506007)(6666004)(478600001)(2616005)(110136005)(8676002)(31686004)(31696002)(36756003)(6486002)(86362001)(66946007)(38100700002)(4326008)(8936002)(82960400001)(66476007)(66556008)(41300700001)(5660300002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmZMUUkyS29naXNRVDhpUWlaajVNZXdJeE9mR0lNQmdUQzlDSEFQRWRTOUhB?=
 =?utf-8?B?bmJxZTg4N1BVQU1JbDNNSnU1TVZIbnBaZnI2NkltTE8wcW1KY2hxSHp6WCtu?=
 =?utf-8?B?dnN4Ry9FOEVQUjJLZ3VBd1FseGFUUExmR2lBTzIwNlRKbTJvMG5xVnJJQ3ov?=
 =?utf-8?B?QzhEWWd3ZERSb05FZ0JVbnV0c094ZXNpSzZLY0VDRFFLZ3haTnY0ZlJ5TmVD?=
 =?utf-8?B?cHpWZjlPc0pMVndBYVg3TTVzaE9BQkNJbXh0aDg0WXRnNk4vS2ZpNTdSeENE?=
 =?utf-8?B?RnpPcno3SW5CZkRQUWxSd2d4WWp6Szc0ME9TRm8xclVnL3VJNllkekRGWnBR?=
 =?utf-8?B?TWNvY0RkL3dNZW9zenlhMC9vTk5sMElPZlNDZ3NqVHdlN0FPRWxrQ24rMEgr?=
 =?utf-8?B?SlRldkhncFhMc3VDSXIvSUQ1ZGp5VGdBSUU2YnF5a0I2UzZsb2d3V0VMVmZt?=
 =?utf-8?B?d2Zua011NE0zdHVvU2YxU0VYTm5wM0JIYnl3anFiMVlpMllIQndNU1pRUjZi?=
 =?utf-8?B?Y0toQ1N0c2JZTVZUOHpPQ2pvM1pQRWpiR2dUUDdzTkV4WXVxTVJHV2UrOVRU?=
 =?utf-8?B?V2E4L2loVVRhanRuREIwUXRXdDNnOHdZdm45a2hhb1AvRWNSTmJQOURybzFI?=
 =?utf-8?B?OEU4RlE1ckwwZlFOZjZISHRrbFZSZDVVUjk2Q3lyM21GRUswWEM2anVxdFhD?=
 =?utf-8?B?UEpLNFROQ0ovcy8xaGF6T0t4Ry80RFN6UzVyejlVOEJxSnNNeDFWd1h2UFAz?=
 =?utf-8?B?NVltdVdycDRYUEN6UVJkL2ZpRGlhRTQ4L3NpTzlFT1BTMDRFWGNuZXV1b1k5?=
 =?utf-8?B?NEZid2pWT3NaeXc0OGpHTU9WQkwxNlZnQTZGR09HNXZtZjJyZUZiaCtuWWcy?=
 =?utf-8?B?dGIzQVRiN2lhTVNhUkdHekNzb1dUUFh5aGJUYWo1RjFzOUM0VzBxRnJtL0ts?=
 =?utf-8?B?eGxGcnQ0c3ZZbC93amJ6a2tkeE1LWUZsLy9jVFhGbW5LeU5PRnh3ZEhPV0NP?=
 =?utf-8?B?TlFVT3EyNkY2bjBuVnk5KzZYWXQweExyYWR0VVFyQnl1d0huK0xTMGhVcnFh?=
 =?utf-8?B?eG1iNmJJWmRzZGpSeEhmMUJ0ZHp3bmhXc0RVMnRPVDVDeHdlcXRoS0gxd0ow?=
 =?utf-8?B?eGhmd2xpU21iKzRNMTNBNEtYQVJRc2EyU3N3QmVpMFpoamNnQU5mdTJRQkRp?=
 =?utf-8?B?UWZJNm93Y3hpY0RsZFhoakpwNVR1dUhFUGo5ckVJaS91SEczMTNVZDNXT1Qz?=
 =?utf-8?B?R2JnakNUSWJtWlpWeG84a0V2ZVdHTlpxbWdCZnA2RFYxVEVQRWJ2cENTOWxB?=
 =?utf-8?B?Z0pvUGNmOG5UbG0vY0x2QXdaMThPMWZJcG9FYTJ0TGZQY0dnWXVOdVRLbWVa?=
 =?utf-8?B?VDlaVmZma3RQaHlDZUdnUXRCZ21OMTdaWXAxV21zd1lsUVA1OW5ieGh0SXVw?=
 =?utf-8?B?NHlVbkg2azVBc1Jnck1DNVlvN3VXMUpSSk9oTUZMN3hMQi8vWTJuMnhKdXhY?=
 =?utf-8?B?Q296NjdRcGRQWWtKeWl4VGFYWXJIOGUxQWVFaUpnT0cyRVBwbUROTkhBb05r?=
 =?utf-8?B?ZUE1R3hwNlpCei9HZklNbWJrU2hIekNSdXhieHhtUVpOZTV3V1Q1Wmx2RGJW?=
 =?utf-8?B?QkxsSFFIYmhILzlnWWc4aGk5V01RcEFhTm0ydm41RVRnRnJkUWEyV1ROVzd6?=
 =?utf-8?B?RFNtRi9qN3dkS1NyeVFsaWRHNVBwa0duNmV5L2plQkRFazQyQjJ4QzYxdkxC?=
 =?utf-8?B?OUdHUnRjelVtWlhEUCtpMzdUazY4WTlUcUlxbnZ2cjB4QVRUL1RzQjdXQ2w3?=
 =?utf-8?B?dFMxeHBmTEN5TlppdHRRVkJVNUpCTE9TM3pPQ25BS3J6S0NDUmkvdW9Xb0ho?=
 =?utf-8?B?UzZMTHdOQkdtaVQ2WUcxQVoxVXRFVHBydDg2eTAwRXhiNUV4V2Y1V1RDNkZw?=
 =?utf-8?B?cnZyeGtvTjlkb2N3TDNYK2RGcWRIZXIzbjBaNmtpTmRFSnFRVnNtcGhNc0w4?=
 =?utf-8?B?dDVVTEFrV3drdS9MY0lLK09JRTZmNUgvTStzbmoxN1JPeUhRTzB4SXQ5VXNp?=
 =?utf-8?B?amg1YytOM2pxUlhlbG56SWpHdU56UjI4dk1LMUI3a0IxNFpSdFNJSkU3S2sz?=
 =?utf-8?B?TzNaMDEwekhPak9BdjFucTF0Q1hINGZTVjNaSDlOL28wN0ordXErYmQweUNW?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UIv0XCcaQQK22d4z4vsJ8M7FvUIDCi3EmwVRMEtBcmOtU8rerZ9XuixOJtnMFYp5V01e6a6P4uXXHhEo8L6FhqNMgf7NUdYKI3+YCTCMvkxg8zVsQRyo8K95YrFuQJhvIq68uKQ7Pz2O0iAjwsR1ejQD4GlLGOwLAdkYkRDJpJlOv+x+7AkJoGr6GCemUJ2io/bjfIl8A9uHxZlxWVrIdEDpISewaVANy7eQoJKHqWkZFcsNAAuWDu6Rj5q4inqaBw7ckouWAwilFyDeDgWpKjN4xJr0PdpR8a/QBEf3xdG5iqSE5HxMfa9wfbRus3gHxOCe9ZACeebm+K9YBdfXj947bkBsJPk/+OrwIRqGr6AUPbq0XVB15EkYzlV/JNQpB+PBDnFFo6eHEosyoaTsgHc4Lwd8XnO36Zg9tjeZu4WsFbJF2Mg+NM+H4N4oqCo/iBiZfVt9MgQ3G7+dZT1exc+hdSbp3dq0Q5GNcugAjlhfDnB0YwDeRQCaQ78S0HHZAnRz3BEsVtsOeOyFNCTcZZdOgGgPwvTMX4pbVpp6UW7pGsy7ndXI3v8LjntHfwM1tdmZqgsX5SNHuCMNZuNq/ExaeVsC3t4Q9pFwpVjvFF8BLYiN0hehZUhdgm/LHrV2ZucEm/83p5ufOV+nHsliwK6ApT1gxWglFCfZfgNKqXgaAfQba0zH4X4Oyi4GCArnezIsIISmnZjSpMHwO+dpnha5JA9IgEjOwE1rS6TlnYSMA95njZ8pgeeAAgCO++ytsl3NP5HBAqC8H6sMzaSvuFvgBfp/xrgxPkT5wTQNeCsHblxKTWldRcMFBV66LczB4Yi2WbJkkc4YEwBQH29yiiXDjeQIi1ZlRZuo+NWDgvpNnfv8si2LdBNEb0IIDRsF
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f41c02e-4039-4613-7b2f-08db10181e4a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 12:19:58.0576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOb92SIwvYc1F7tEqc6B3YtWqEPd13dZG5jBN4mvW5lcochlalNwvsjlMeWSFtY8FDi6CzlndHA7/7MJz5Qrl6Kj5xCpPOnOgg4VnkqtoWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6631

On 16/02/2023 12:09 pm, Oleksii wrote:
> On Thu, 2023-02-16 at 12:44 +0200, Oleksii wrote:
>> On Thu, 2023-02-16 at 08:31 +0100, Jan Beulich wrote:
>>> On 15.02.2023 18:59, Oleksii wrote:
>>>> Hello Jan and community,
>>>>
>>>> I experimented and switched RISC-V to x86 implementation. All
>>>> that
>>>> I
>>>> changed in x86 implementation for RISC-V was _ASM_BUGFRAME_TEXT.
>>>> Other
>>>> things are the same as for x86.
>>>>
>>>> For RISC-V it is fine to skip '%c' modifier so _ASM_BUGFRAME_TEXT
>>>> will
>>>> look like:
>>>>
>>>> #define _ASM_BUGFRAME_TEXT(second_frame) \
>>>>     ".Lbug%=: ebreak\n"   
>>>>     ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n"
>>>>     ".p2align 2\n"
>>>>     ".Lfrm%=:\n"
>>>>     ".long (.Lbug%= - .Lfrm%=) + %[bf_line_hi]\n"
>>>>     ".long (%[bf_ptr] - .Lfrm%=) + %[bf_line_lo]\n"
>>>>     ".if " #second_frame "\n"
>>>>     ".long 0, %[bf_msg] - .Lfrm%=\n"
>>>>     ".endif\n"
>>>>     ".popsection\n"
>>> I expect this could be further abstracted such that only the actual
>>> instruction is arch-specific.
>> Generally, the only thing that can't be abstracted ( as you mentioned
>> is an instruction ).
>>
>> So we can make additional defines:
>>   1. #define MODIFIER "" or "c" (depends on architecture) and use it
>>  
>> the following way:
>>    ".pushsection .bug_frames.%"MODIFIER"[bf_type], \"a\",
>> @progbits\n"
>>    ...
>>   2. #define BUG_INSTR "ebreak" | "ud2" | "..." and use it in the
>> following way:
>>    ".Lbug%=: "BUG_ISNTR"\n"
>>    ...
>> Except for these defines which should be specified for each
>> architecture
>> all other code will be the same for all architectures.
>>
>> But as I understand with modifier 'c' can be issues that not all
>> compilers support but for ARM and  x86 before immediate is present
>> punctuation # or $ which are removed by modifier 'c'. And I am
>> wondering what other ways to remove punctuation before immediate
>> exist.
>>
>> Do you think we should consider that as an issue?
>>
>>>> The only thing I am worried about is:
>>>>
>>>> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
>>>>   [bf_type] "i" (type), ...
>>>> because as I understand it can be an issue with 'i' modifier in
>>>> case of
>>>> PIE. I am not sure that Xen enables PIE somewhere but still...
>>>> If it is not an issue then we can use x86 implementation as a
>>>> generic
>>>> one.
>>> "i" is not generally an issue with PIE, it only is when the value
>>> is
>>> the
>>> address of a symbol. Here "type" is a constant in all cases. (Or
>>> else
>>> how would you express an immediate operand of an instruction in an
>>> asm()?)
>> Hmm. I don't know other ways to express an immediate operand except
>> 'i'.
>>
>> It looks like type, line, msg are always 'constants' 
>> (
>> they possibly can be passed without 'i' and used directly inside
>> asm():
>>    ...
>>    ".pushsection .bug_frames." __stringify(type) ", \"a\",
>> %progbits\n"\
>>    ...
>> ) but the issue will be with 'ptr' for which we have to use 'i'.
>>
>> And I am not sure about all 'constants'. For example, I think that it
>> can be an issue with 'line' = '((line & ((1 << BUG_LINE_LO_WIDTH) -
>> 1))
>> << BUG_DISP_WIDTH)' if we will use that directly inside asm(...).
>>
> I think we can avoid 'i' by using 'r' + some kind of mov instruction to
> write a register value to memory. The code below is pseudo-code:
> #define _ASM_BUGFRAME_TEXT(second_frame)
>     ...
>     "loc_disp:\n"
>     "    .long 0x0"
>     "mov [loc_disp], some_register"
>     ...
> And the we have to define mov for each architecture.

No, you really cannot.  This is the asm equivalent of writing something
like this:

static struct bugframe __section(.bug_frames.1) foo = {
    .loc = insn - &foo + LINE_LO,
    .msg = "bug string" - &foo + LINE_HI,
};

It is a data structure, not executable code.

~Andrew

