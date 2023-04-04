Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090A26D5D97
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517815.803673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pje0E-0004rG-Qi; Tue, 04 Apr 2023 10:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517815.803673; Tue, 04 Apr 2023 10:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pje0E-0004pO-ND; Tue, 04 Apr 2023 10:35:02 +0000
Received: by outflank-mailman (input) for mailman id 517815;
 Tue, 04 Apr 2023 10:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pje0D-0004kI-53
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:35:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5874413f-d2d4-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 12:34:59 +0200 (CEST)
Received: from mail-dm6nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 06:34:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7152.namprd03.prod.outlook.com (2603:10b6:a03:4d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 10:34:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:34:54 +0000
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
X-Inumbo-ID: 5874413f-d2d4-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680604499;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LXvl7Q3MWQdrWCPWcRV34Y4DsSEqczpFJv5pi729qKQ=;
  b=WP+JAYsI55YaSsHYDXxkJaJcpZ1bqU2LpBy3DDr39Aso+Zr04+xjWCy0
   l7akXUh5TWYQiE/1dV0IF25heW+O/4t9NjIFsuC8O54oDKaOeHzpE5wZ1
   mnS0hWLcwY9gYb4U0cJr5cnCIGU3YW/G2mKw4XKZmxe6kOyspkdJC6x4W
   c=;
X-IronPort-RemoteIP: 104.47.73.48
X-IronPort-MID: 104280354
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ak8wEKjT3hFSv7G/VURyC0QBX161QhEKZh0ujC45NGQN5FlHY01je
 htvD2/TP6zcZGahKYhzbtji8kkFuJTVm9QxHgdkpCgyEH8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQpFBUcYRCAv96x3ZCgE/Np2p8ecPj0adZ3VnFIlVk1DN4AaLWbH+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMqluS9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOHipqYx3QH7Kmo7NlpKCmDqm+eDoxCMB/9ve
 1EJuRE/lP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5Y020BTGS44/FLbv1oGlXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:YY+3f6uiKOyHlQP6CcKd2LD47skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104280354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmVfRWhO2TfFgk14bLqC6vaIkeg/LcbBl3P0JAGjmb8khhR3M2WCXyfwunZkgiOzJ6x8BGvnKPSysv60nd1k0+Fm08AGNFetf5lSFHt8OyN0KdEQgPeh85h9RtVZ9OJxCShtEZ/DcLuFNe0GWR1xiL9mbFAIEBysGVP0tV0VcQZCvn5TWuOoy1ajHCW4jWGd4uCTIRs9xddN2n+Wb/ZUQpKDy4N7AHzPibPpjkNKxvGcxLqeQXokSl8kNPsjSR/pUjnTOdW3YNSLEGjnRdzDEQNyixy8rxhrNqghiMjhAZ9Jl50U6u3Oc59N+O97yHmjZuSRK/iUJJST4YvA1COPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXvl7Q3MWQdrWCPWcRV34Y4DsSEqczpFJv5pi729qKQ=;
 b=l7byjE+OcKiMEwpiiL/ArPQdijNgxwlj1/FjdX1fLgPrPgVlSw11KMBZAp7XO9lF2DunMK2vQucUFo7vVadm5f7f2M2n01QlcNbtiOY9TUBJ9mEowHqmozHFvivlrXSC5GOFSCJReotO6DXr70XX7mr+IE5Sl7uOfHNK7HAaGYpUz3Pfz8843S3k+3HFvllT6G0gDYlAH2pvMUVSILSTPfg5qC1UE6+61aL12AyrT+1gu3gs76ikQAjxHmZlyU0pYu9ND2EVRt3+FxTCTrOgqhQNKNWHSW1nOd5xFFJfyJhtvSfC0BsRHJ7zb7KnEduGMXpmI5FeL+LZMNySwcVImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXvl7Q3MWQdrWCPWcRV34Y4DsSEqczpFJv5pi729qKQ=;
 b=Og6sZxqGHT0KbHmMTKjVU9vwmLSKIVD4E2DBwtWsx33ydIWaT0g5npmqi5n+D7pxPfEzrLFvE7DK1VQAqenqgEWCcO1yK7URInNH9xrzr2i0WJuXilSStpemeNVqTqVtJfZa8OP2mwUnpGmEQULO7yIVooh9mxr36/+FbOqT86w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0eba4f65-c054-531b-2998-6038f17af0f8@citrix.com>
Date: Tue, 4 Apr 2023 11:34:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/PV: ignore PAE_MODE ELF note for 64-bit Dom0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <f52befc9-f19c-12fb-b0db-b6c4219999b2@suse.com>
In-Reply-To: <f52befc9-f19c-12fb-b0db-b6c4219999b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0483.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 20802844-2fdb-4e39-df92-08db34f83ab1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CUBAvMq/Y0uCnTv4sQRjyf058xtwyXb7jn6wO8ZHMeielHZ8xXalwqOtURQyXzo/K1lrr9duA+Glq+xhNMZx2XRsZjiatr2RKjB59po6otVx2UpUX1BRP8PKbBrhfDTr+BjKXb5pBhZ0bEoc7p5FsT2DusTg0U2/O59TR532PeKShkh+hEqv4slKrVIlC5OaVWyQg6kjXjb9KFmxcgayXQMSCLwsPS9D1jQ3AGWVmH2KVp6pukmUCq8aR/khpYkHVPSb9w0W96pEAqrlPysoKVZsZSfQrTIqFTtNi6RfR2cTOWIBWLTa6SjFS1odMi3ik/t7CcZ2DbdmMD9CsfK2ukGIBw+NDvvDfpYpjrnaT/94hgO+iGe8Kzym2lxwcjpAs+kzkBJY3XxWbj1WbMpY1tOVXagy77AaJ4SNQ1kXBPzLMGfzVd3y0cDwg0NI2eKb2d4jiLaK8TFHYZYPldsX3FPF7esoZ6GjY2jipNT5cH2BmFozvefc4eUlEFxHxTzvvbbyaBFQhDOQOiayi/U2fPZaw2/PdkYLNeXhhuUwAJN/7GFoHIyx8NH90nizFET3sQh+VOLQATAX1n4t1XsvF8wu8/gXcXbASwbVqBHxa6WlJqyqEE4CyEWChfJm83MYICNFzxblHvdXF9AnNKFKWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(5660300002)(8676002)(41300700001)(4744005)(110136005)(2906002)(8936002)(31686004)(66476007)(54906003)(66946007)(66556008)(4326008)(478600001)(316002)(6666004)(6486002)(107886003)(53546011)(36756003)(6512007)(6506007)(26005)(82960400001)(2616005)(186003)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEFXazcxQmRHa2svdXdFT2hjL2llK3pnYnhDdDl3UE51d3Q5OHN0RDN3OXZm?=
 =?utf-8?B?TENXeEdHVEk4aVJEYVdYYjhJMTdhQndoVlVKc1VKdW5wRm1WbnhFZzJmb0VG?=
 =?utf-8?B?a3JWMW5sNmVKbUNZNThFQ1A1OXJhK1ZUWmJSbG41cWFNWXF3WFpEOE5WSU13?=
 =?utf-8?B?Y3V1bFBIQjc0RHFBanBvQlMrUnV3cmNYZlAvcDFPQ1BtdnJIRWJ1WnFGbGJi?=
 =?utf-8?B?aUcwTEdWaDFXRDdKT1ZIeXpsQ0xIbk9Ga1lneUVTNEpCUnd1ZmNQZ0I0MWl4?=
 =?utf-8?B?Z0gvSEV5OWNnS2FVbFg4QmZ4UFpmMldpTXdJUTJBS1pkNGpxSFFSUkJEUU81?=
 =?utf-8?B?eTFuRi9tSTFKUWRQYWVkY21obGI0UVRJZFdQSzYvQzZVQnEvVU85bTY1VlNp?=
 =?utf-8?B?alU0eVhsRk1RN1ZIOUFZSDlQOUNMcUdDRUw0VHRPNE1HN3ZFVWRjU3N6a1Ax?=
 =?utf-8?B?TGlXZWFTajA5eHJ1Qkk1NGJCTWxkNGZYQWxvbzQvem1ZVXZmOWdGdDdQWnQ4?=
 =?utf-8?B?RE8vY2FPQm04dGVBVnptcDRvSDFjWkJrR2hjYW9PQmMzQzVqbTVqQkpBMmRx?=
 =?utf-8?B?ZkpSVXRwbjdBaUU2NEdrVGIvLzdJY25ZVGtKTzY1ZUdpbjVWYVZ1MHEwaGdD?=
 =?utf-8?B?THJiQmFyK2N0QVczK08vNU5hWUtPK0lhYlBrV0RqKzA3N1JrYUpwdmFubDJY?=
 =?utf-8?B?RUw4Q0VZd2xZamtQMVcrN0JaWkpRSFM3bTdsa2UzTkxoMDczdTdRQmVWc1F5?=
 =?utf-8?B?Q2R4V0g1cDQ3bVJKbmVlYVNFdXJjQWl0VGkyUS9obVpTaWYxY1ZvMnE5QVpF?=
 =?utf-8?B?Ri9BTUVPMy92YWkrdmxTaEhnSmVNdUdlTGo0ZHZPa3BpaGxlQkVvQnRvOG9S?=
 =?utf-8?B?V3NMNVRmUVdQTi9waXFIN0xkbzFFUkR5VHQyczlER3hqQ0pSRlFSZHJHVml4?=
 =?utf-8?B?Qjlyc2QrWk1uL1V0cFA0bkZnVXAxMjdSVkNXWEhsQUpGVW90R2dNTVZ4czFV?=
 =?utf-8?B?U3JVeVNDOVZOTDdlTVZ4VVRGWjVOb1VBWFI1QW96WHRMZVdEQmt6cDYxWHpQ?=
 =?utf-8?B?VWl2RWYxRnJ1ajQyOStiY3JKaERUSGlvcys4Rk9JWDhsaVlkT3BjRFAzUHpy?=
 =?utf-8?B?Y3NaMUROZk5GNzFjbzQxYzM2V2VGWDREZTlRZTQ4L0Q0cUtrTzJNYkNNeC9Z?=
 =?utf-8?B?dFo2M2RGYVBJbDBLT01UeEVuVVl0dzV4Y28vZ1kzL3hZeEJQSUlmcDBHZkts?=
 =?utf-8?B?S2hvRWxhNGg5Znd6bkZROW9BVFh1b3hXdWpxdFA0QTYrVDY1YlZqNDRnMGZP?=
 =?utf-8?B?M0U2bC9sYzRPK1JVOTFkNGZBYUt2Rm1IMVNGbXp3b3E1Ulh1ZjFncnNadWtX?=
 =?utf-8?B?Nk1LaUxEQ2ZsTlBxWk9vTC9oVkFRWUtsdWFWMGxkUVpzV1I3K0dIUkhtQisw?=
 =?utf-8?B?WENORG9OTFV4N2x5K3BKa0lVTW5qaS85bVpmWktBMjZSRGJYb2tPMTE1S0w0?=
 =?utf-8?B?YzRzZWlma3VZWWgyZUt5RDdFVHJjc0lmUm1aKzFVUlZ1Z2JZb0tTRG5NWDR5?=
 =?utf-8?B?RGUyZmI4K3lidFlkdkNOMnZYS1JvVWhXeUpMaDUxVUZmUUhIcFdjRTNpd0FN?=
 =?utf-8?B?YkQ3aHpUbnY4bGNXbnp4VDVuNkZEczlFSjRJWitmMnRyVU41eDFUblhpd0k5?=
 =?utf-8?B?RzJuTzZzZjVaQjlwM2drSi9lWEUvTTNoQUdkdjMwUVNwUDNDRUtCUUFyNHpn?=
 =?utf-8?B?V3BJQVZmM1VwUEdhdmM1VXlSUVQ1cW5xK2wvNWhicHNLTkZrckpqNUZLN1Vt?=
 =?utf-8?B?dG1EOFdnaVVzRGdXR3NTekR6YkVXYlJJaU01eDBVcCtOY3RvY3JMbzByajFa?=
 =?utf-8?B?Wm5xRnJTRmthZDhwT1dub3R5b25NSHVVb05pZlBJMXdpRTU4ekRBa0Nkc2cz?=
 =?utf-8?B?b2pLUEh0azhtME4yclBTVHkwMWhuVVhGSzFnUFFIOFpBZU16NGtuemtKOVJ5?=
 =?utf-8?B?VHlHWEcwa2krZE9GSXpSVit1K2xDV3NrbE5kOUNHUHIvV3RYWXRwSytOTmlu?=
 =?utf-8?B?WnpGWndYc3lyKzhxMDlKeW11Z1NOQWpVNFBKSGltcExkVTBrZ2lzV1lSK21T?=
 =?utf-8?B?a0VEbmtyejlRRDl6bGdvc3dVUTNjWWxMLzlMVy9GZ1NmTUM3VENQbjNwZCtp?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cAKExYs5cyHWmlabf/b+aXIUh6aPZJpKy6oe3aMkyb/dQ56OfWAN145lsXuyO9Jh21ehlNSo16mniGaFBR7cuMxX21MmrHPzyzRj/6yWNSjOJ8P9wv09FEmxPcyOkWU7bByEE9DsM7cCXMHWRbh+Rj4tJT5PURmioeQ+VN4HkyE8masZU/qFp/KwF8Ntagt4rMmidyM9w+X3xm5F47QRztmN1f9QO/b02hAlUTwypKoUDchBHreKtFgeS4O7N3S3zIDsLYhe4aRfhFVot2ASTlncZt+swgDhl0OJHvhp7FXRas1KLDPfPZLMeeLJJ1b+rxiofhbJNywJ90wzkTTCQYEmCFWeTNva0LxjRsMgi1z2/zoGxZtP5AW2RW6qvPT4gdj0QtTREuQV35jXPgnGIzxcDVEWJHv8OdiCc0+lfnoUrx6eiy8qaVuRLukPyblxvkMgRgld+ANgbMf8ICHt70qEV8cGlWzEp1T0vMFONClsqJrBBkBBp8DCfUq6l3S7oypSw3YS/9x6KhdK4Jbko6JmbvksEcz6yUqNHM2qfLgEyj1yXRZUgs2AC+lOujKnibGfLt5daR8nBomPkynMbD/7FZpxSWlp6SZOvDapYtnDmhAKkBCe/xGWXCdm7xR8U1UPT1dY9i1oK+VH/wVwsoiBsYCOgmpHKzlQBRJv14dCzqyJ4hkHs/bTzSrUKNS2J0lwOuo2zfrqPF50i8wH3KlRtLJr7wNPijYDvy1BJF5v4TbTJX2b5nstMbhCsAvJEuA6ByK5hq8BzAN9WdIsK7vNYCqxlxO53iVzOPfcavj7M2JStcJAViquqFAhrdWj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20802844-2fdb-4e39-df92-08db34f83ab1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:34:54.7425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vXcfbfeQb8yp4kj80w+5DGmV/DEphCRo8OrQQgCXxpW2n7T24s/Tpq9rvRUHfY5PoSOPbbN5lETAGpUD1iSujE8LIjp59U6m+pqqCgOV/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7152

On 04/04/2023 10:19 am, Jan Beulich wrote:
> Besides a printk() the main effect is slight corruption of the start
> info magic: While that's meant to be xen-3.0-x86_64, it wrongly ended
> up as xen-3.0-x86_64p.
>
> Note that no known users exist that would have developed a dependency on
> the bogus magic string. In particular Linux, NetBSD, and mini-os have
> been checked.
>
> Fixes: 460060f83d41 ("libelf: use for x86 dom0 builder")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

