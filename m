Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25572735B81
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551183.860573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH8F-00066m-Nh; Mon, 19 Jun 2023 15:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551183.860573; Mon, 19 Jun 2023 15:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH8F-00063d-Jd; Mon, 19 Jun 2023 15:49:31 +0000
Received: by outflank-mailman (input) for mailman id 551183;
 Mon, 19 Jun 2023 15:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBH8D-00063X-MV
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:49:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de60ca8f-0eb8-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 17:49:28 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 11:49:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6875.namprd03.prod.outlook.com (2603:10b6:a03:43a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 15:49:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 15:49:18 +0000
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
X-Inumbo-ID: de60ca8f-0eb8-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687189767;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vaUsiIPpBTuUERNVDR3RTu4VMJaKQmmz5xIP2EGeXeA=;
  b=WDL1eR+v+4Y5C+Z1fEkWA2h10rxYSp0wgCnPiS0DnQbOiOtZpkP//QQU
   EjY47huGRppuIVCMXQ6YlLKo/aAKBhocJLcmSslMLyHYCdoPCTFXgL3NL
   sCQ45Q26e1dLPAWWltWATxkwRbaZzf9R7LZD0ecIWRazlXO0upSFkb9gb
   U=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 112092400
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ttypxKh+nI2n3IBvnQZmSPP0X161oBEKZh0ujC45NGQN5FlHY01je
 htvXGuAP67ZZGr1co1/b47j8hxX75/dyN5iGVFu+SxjHnkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaPzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ9JAE8cTLdptmL662+Rs83hcQxBuD0adZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGybLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTirq8w3AXLroAVIABITxydqui7tn/9d8BAd
 WkL3SsF7pFnoSRHSfG4BXVUukWstxoRWdNWH/c9rh+Ezq7Z4QGxDWwDUzIHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS0OQBYB4tLjiJoulR+JRdFmeIaqivXlFDe2x
 CqFxBXSnJ0WhM8Pkqm+o1bOhmv2ooCTF1FpoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7eWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:VjlRGKCTKjK3E/blHelc55DYdb4zR+YMi2TDt3oddfU1SL39qy
 nKpp4mPHDP5wr5NEtPpTniAtjkfZq/z+8X3WB5B97LMDUO3lHIEGgL1+DfKlbbak/DH4BmtZ
 uICJIOb+EZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3ANTC2DWgr4CDLBbtUYoKaxlND3TJuV3Hs/WjyfW6?=
 =?us-ascii?q?DNE12TbGzElyQ6olNjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AjJ2KmgwWoNx8QF28FSeJQutFWXeaqLnwEgcrmoQ?=
 =?us-ascii?q?Eh/jHGT5vZRKCqzWcAbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,255,1681185600"; 
   d="scan'208";a="112092400"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOSYUDduUOwqn5og6xDEa0wr1Rv0DGkWw6sEfRroWRzd0pGBVng3r6huW+65PXlc2y2P3JOniqBxr66juz8OUtcDEhvt07k/Ss1WicMy3v3ICI+Tsne24KQcPTl5T85D0qmpN7W4X/iAU+zjwKEhwrhHU/QEYcQupE14AwtBkFNofGznmTsF47LG8zhmQYbiKYGV1vqaQpSJjzlftcQpdm6Cl8mjQg1US2EljCHr5u6rdRGkVUjgM5NQAVq1aseAjxBHiqMjg50XOM88+tacvQBdo56RgSTr1vqJjjuBxFuGWw1JTC+s5eEJ52A3Q30tnM0TFoyMivsyE4yX0K9IcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqtCDYgTW/xJh+ikwyl+SdsfE/UoAGzAUd3m/7Zw1BQ=;
 b=VsTNQCdrSH0xqbymdN+9/PURqSyfGenv2mvwM+msaieLlU7MlSChR3EYHBBc/EmVGzQ/rKDSyCISic9zgUHQe4XnRB6IU/8KPoErmhz9wcgQmwN6t+jMv0eMcLtViqpU1MyCu1yQyB3rKpMnNKsr5PPbETVnos9WItgsZgfQgMGkrsR9S8TJKj6aZPJaXfssVsFN0QBtVr28ye8VWKTWvAT9g6YPZidc5UDzIv4mOICcHUiNsvXiQN9yAxhBlWLx8Oy/ZyswepHQ3wXTwCwUtAzn+vHyHKSlNJWf3Zbp6xQKvddnO+52QxAc+jkZ1rnFykROziZXOV4Pg5wBsrZXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqtCDYgTW/xJh+ikwyl+SdsfE/UoAGzAUd3m/7Zw1BQ=;
 b=MPihYEwwlCVzmn1xAxW2Iw5PV/CPCR4iGt08Bxi4D87sPAcYyw6PRL9EnV35cVp4BB/tXcZ24XK5vEC7ebn6Pxhs4KEeMbpzhRhfpSzHClOYPuEEXAqv0MPdJHVbuxvVX10m9kv62ilcbYJ9pyBBI1HLv7jZTw/ve3xZZCcKwqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b3543c89-9df5-53dd-2b11-aff83211187f@citrix.com>
Date: Mon, 19 Jun 2023 16:49:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/5] x86/microcode: Allow reading microcode revision
 even if it can't be updated
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230615154834.959-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac3ecd3-e57b-42cd-a505-08db70dcbdc0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22t9rbN62UCyhInrRDpbHSUY8Rb037TEQ1Prk4TaH7/+bKk1LjAcpzjtQF4g5YxeRjYxc9xDmFFB5q4FnDVfE44KJmbForpOcbwRuzQ1yGCPNDSrKqTUuSouHlZ+EZRElHzBb5ZV5DjsKQGx1KvdMzwW3jN2YYRz85184Ishsgt6cjhP7CASzAqsMuXYW4aWfH6NEWtzshoNMazvt6ahUK/hyoAFhPXCPEJ4elwx0kWA3j6Gj5tcJZFB4v4FudX3EaYDigfxqvJYsAHH7ZGoXxHeWEU3wJtDdPxfGzGxGqnoNPQRp2Z7Y3Q3udZNpSERYi/ncXVLFHRBbsahRJWf79Wb1yGJM9G6DVAzj8npKlKZV25ayNPp6h6g2J7kFyBgvAXRLsLrOMkUa+BDy7M1Dp5imXjjfkJuT1AyQ2de0WDpzbRozlobmGSv65o4AurILtRoJycSeUmqTp+K+GEFzid7NIsquoBCH2tWxAPmox8mbFQl+HtZiFJCt74p6TO24LVnAxC5Nkq35MNOK5lubzV/8/697ZF9chvFmPBhaIlTrjhF5B6FAVMvuUUI6IE5OfdcBh+TL7Tv7FSC7yA+mW3UjekdvyI7hJH6/iLKoR/BkydTo+yl0vB4uDg1ESZK/4y7a+HbMG3lJFT+NI0ErQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(31696002)(478600001)(2906002)(4744005)(54906003)(6666004)(6486002)(2616005)(110136005)(86362001)(36756003)(26005)(186003)(6506007)(6512007)(53546011)(8676002)(66476007)(66556008)(8936002)(66946007)(5660300002)(38100700002)(316002)(4326008)(83380400001)(31686004)(82960400001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnNhOGFnTURmRGZSZVpjTnFPQkxyaGFuRTcxTnVROWxucGJYKzRsSHljRGdG?=
 =?utf-8?B?WlUxRlYxVjFXUkFxRCs3VzZrL2lQNno4dzNSVmxXckZtUkFhOWxCN2FOMGJj?=
 =?utf-8?B?MGVIRlYycEdzeDNuZ0xlTC9tTVpwbUNOTUZmVk81blRWNkx6endYa3B6ZElh?=
 =?utf-8?B?L0JTWmt5SG5xb1VZV3hWV2JvYXU0NlowdEFhWTNxbHZFd1liUU1RZzNiSW5J?=
 =?utf-8?B?a3lqOVoybEZ6dnJrdEV5K3NGNCtPdkdjdEkzTzJWbmVOVXVNYXNUSnpnemFV?=
 =?utf-8?B?RG1XOFQ4dGhVS0xCVWdnRjNxcjVCQTJ2eUthellzcUduVThtL0RmUEtnMDk1?=
 =?utf-8?B?ZWVidjk2b1A4bXNXVEcwU3FoUmh6WHFFSE5JcWVxM3k2azArUjhzZ2VJQmNX?=
 =?utf-8?B?b2I2WmNoVytsTHZCMzRTcVVENmVnbDNtWVNuRlpYNHNkOU9KN0JKTUZCUmxk?=
 =?utf-8?B?SW95blkxa3JveFREZSswTk9oUzNPUGxma2JWVTluc1l3am9xTytyQ2dPajFG?=
 =?utf-8?B?WUp2QUtReVVhUFB4Vk13N1luYWluS1dJbG9kMElCRE9YSUUvL2UxSXZ2di9N?=
 =?utf-8?B?YnQ5RlBuUnEzNTV6ZFh6Vmh6ZXNFYitwYi9naDBqeDZycm1JRVJSc3ErSE9y?=
 =?utf-8?B?WUp2SDgvbEEvWStHaXVFY2YvRkpoaGVZUDdrenBLbURjNTR3T2V5Y3pXQncz?=
 =?utf-8?B?Q2ltcGR5MzhpZ29Va0JGRzJzRkF4YTVjN2g5WFY2djRWL2hFRlR1Nmp0Vito?=
 =?utf-8?B?STVvbW1BdW03SlR3bFZhMHllY3hydy8ySTRLbk1KeU41TldadThackNFa0s0?=
 =?utf-8?B?L3plYVptMTE1aHlQUGI1V1JYUFhkKzFJb0xyQ05RUi9rUi82SUs5VnZXeWxr?=
 =?utf-8?B?V2lnaTlCL2ZVaW1HZncyNitjUTJpUW9La0tjemhtbjFHdUVjQnFLM3RibjA4?=
 =?utf-8?B?YWxpYkoxd3dUcERCZkwxS25UWXpZT3RFTmdha1RLUzgwME04LzlUeENwVE9E?=
 =?utf-8?B?K0JGTXFwRzkzRXhKSkQ5YlBuNHB5MVNkSDB3NHpNS1hZaFhtQ3RZRTRXN3J5?=
 =?utf-8?B?V3d3NTd1WmY5cEVoTzUwOFFGMlF2TE5HcFY2SlpCN0RXNGhyM2k1aUhCM3pT?=
 =?utf-8?B?QjBLTWc1U090Z2FlbGY4ckpIN3JHZWJWVHVvQjBXR25KWjR3cW5rOGtJUERo?=
 =?utf-8?B?L09BdjlRY3F6VStIUXNjWmhWczhEOUhxSjJKTWY0WDV5cUs5SkZzOGNNdC9y?=
 =?utf-8?B?dVQ1MlhQUzMxd2kwd0tmcml3NFdXSDJSS0MwSFpxN2d4UWx0K3hPY2wvK1pq?=
 =?utf-8?B?Smp6QmVEVndiT2pBamhIaVhtbkhQWnJxd3A1aWNCVGg0TFVtZXlsRGVsa25K?=
 =?utf-8?B?bWl5K2pCQ1hWa2JTL29HekxHSU8zTVVkMTZCTVBtdW5nKzYvb1lvUWxRbldx?=
 =?utf-8?B?SVpPRGpHUWtScFBFK0cwRjhEVnRYSktZMHNjYjNFYURRNHBXdXRKdnVjczhH?=
 =?utf-8?B?Q1M4OVVXZ3VmUThRaXd1ZUNsSk9DYXRDL3hNSUlBSVVqUk55N0hFMTdyaGhQ?=
 =?utf-8?B?ZTJwcVFpRU5QS3l1OS9tc2xpSjR0WDNuYlp1Qkk3b3FNYXdlbjdUUVBsSEgr?=
 =?utf-8?B?a3FGV2hSaUtSYms4a3I0QXFucUUwalJRZEl6RGZ2b2Z4Qi9laDdnU3VvRFJG?=
 =?utf-8?B?SmhINGZpM2YzeDVqQjlLNjFEM0M0VEZaeFJmVVJxOC9aSyswTncxMzhDT1gx?=
 =?utf-8?B?Snk3MFRhK0RrVysrR1VlaFA5bHVvZXpXeDk0RXY5QWUzUFFMRzV0ZVFEVXhr?=
 =?utf-8?B?dmtvL3JkWVZQVnRydGhKclFBMjNyVTlhdEp5NXdYUXBBeHYwd0dhWHQ0a2s0?=
 =?utf-8?B?ZTFvNThBYmtOMklrOVkyMEI2cWtFSUxON1lJTXRNM3RFS0p4N245ZjNCK3da?=
 =?utf-8?B?NHFtb3J1YkxWM0lib2hmdG5mVm11czNUbEpyT3RqQXhBL3JCTUxLVElmREQx?=
 =?utf-8?B?MnVpNDZIYWNSMGpYNGplZ05lUG4vS1NqdCtTU3JiQnovMmt1em1YS0xDWlVK?=
 =?utf-8?B?Z1RZdmF5TzNDSk9PSzhRL1hMYTVKcHZrK1NJNTN4Zm9ENXN3TFNqYTh4UjJ6?=
 =?utf-8?B?L3ROVnlHQ1haSnZkaGNqTFpKakx6RC95TUY4RHRIejJNK1F6UmFWK1FsRWM2?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wiT4UeLuCzafk57CQPdvINliuj9BDju9tOiDXTy+DqPJmXXI/TfgPEN9OCAdYg2j6KPonfwOmx6ZfzTKtYdMRaw6mzwH5DEpwg29xhBZj+2hKYzW3+KPSWa53lwR9oma6s3y9pTmUUBITMcmkkkg35Pbwtv78z68nIR4TDISiOT980ACZA3WFTtb7rNW1JkwJ76yFn+adr3qaIYAYDPHIWeTvJUn+BA/rP4cb29i8nwHE55H3jkcJGLTwYw3RUUpg9jL6dP2ULv3CkKocwpJMGN1WJFr2pl1Ub6NNwOwaqAR4U6ZKeTeLDAMcNeauShjXIjLLzFBdgnE75jnTBvvsVfAEN6LOUPYlI+7CCIf41mGJCtxkTFJp4XiAMhbIv4DGiBmAhIHiwZRms/HDnPYGelily1dVREBzQfbQKb8Wrp/ITUSDs/58vv5+jQ07SXTQlnRNF8foLUMTp/Q6fhxxmkJeuW6SiYnnWKhuiN85gYm0VXFPrQNVhZS/GtiswOuv7U9XOQVo+BcjeW6oFX7kxGMeL4l+MaqWMiOHrXAtoTTVO2otOvlA2KrK7oMDsNoiZSrEuO6lMvKPWqCUsampT0H3lk6dUaInkS22DWgvkGb3tJ3Y819ShqhrX3BYt7OaBs+V2p5PJ1ifOhegEx0uOS14MrZs2XDXmSR4UanB/DhgCT3fWaAFHeH7fE1YTYvTYXYHRGaFI5JnLAHNz4Bo+sCqovTPT71EtyXZsUbMTqXKhwR4lQPXBajrQ2BCNVHJmtWrHGpxLAZ46W7HuhSJFwCfSrnt+70r6M4LszpvdP1vIsoJCJAqdoObkjPf2l8W2OJh1W2PjCmhFN5JLMLuZt+a9LV70BQ4qZ2XOVYYcI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac3ecd3-e57b-42cd-a505-08db70dcbdc0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:49:18.4883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDkIeoS8yHYFKY/6EBm0jBufjWYPkQSHvfWnLDgQgp8viXR+Ztde33BNtSaZiSVzWIh+hyybQeFnm65jslGYL1dNCwftA+nqKQq98OpIyiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6875

On 15/06/2023 4:48 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index e65af4b82e..df7e1df870 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -750,11 +750,12 @@ __initcall(microcode_init);
> @@ -860,6 +861,9 @@ int __init early_microcode_init(unsigned long *module_map,
>          break;
>      }
>  
> +    if ( ucode_ops.collect_cpu_info )
> +        ucode_ops.collect_cpu_info();
> +

I still think this wants to be the other side of "ucode loading fully
unavailable", just below.

I'm confident it will result in easier-to-follow logic.

~Andrew

>      if ( !ucode_ops.apply_microcode )
>      {
>          printk(XENLOG_WARNING "Microcode loading not available\n");
>

