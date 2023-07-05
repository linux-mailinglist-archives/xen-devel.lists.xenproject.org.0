Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26931748599
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559201.873978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH33n-0007Ep-Hl; Wed, 05 Jul 2023 14:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559201.873978; Wed, 05 Jul 2023 14:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH33n-0007Cy-E8; Wed, 05 Jul 2023 14:00:47 +0000
Received: by outflank-mailman (input) for mailman id 559201;
 Wed, 05 Jul 2023 14:00:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asTv=CX=citrix.com=prvs=543a7ddba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qH33m-0007Cs-IZ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:00:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 546ea13c-1b3c-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:00:43 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 10:00:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5337.namprd03.prod.outlook.com (2603:10b6:5:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:00:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:00:38 +0000
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
X-Inumbo-ID: 546ea13c-1b3c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688565643;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R2jF+Fk+1av2peT0OTKrWYAC9FnMUH30qKEkY/xy79Q=;
  b=ZCIrVZb3pFm4iipjVAeqy0uJelhn4sXLkJfDk+Zn4odaSbwCA6ZlSPbY
   mmCa2MpY+XDup1fF9+V6xd1znMXWY7meucAJQN/2eAeJulhobOPRyRCYJ
   7LyEW2iklDn6aI/dYHOFpxqMr5RLV5wIQIV1+194YjsSFeHDE8rbZocuu
   I=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 115650006
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l6YoR6ztKWoAaPqVd4d6t+f3xyrEfRIJ4+MujC+fZmUNrF6WrkVUm
 GoZW2yGPvaKMzSmKYhxbYm0oB4BsJPQnNA3SARq+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPa0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTtJ1
 s0/FBInVCi4ifOT+PGqTs5Krf12eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAd9MSeXgrqACbFu7wGMRSyc7a3iBhbqArECAYddwC
 UAaw397xUQ13AnxJjXnZDWxpHOGtxgQQd0WDeQ+7AyPzYLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhC03hrFWh8hU0ay+pAjDm2j1/smPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:39wCrK9+u3PvU53XeWFuk+AVI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS74ijPIb+rJ2LO8gcSVbX+19QYUceltAZsQiDtRO0KgPWBdYhJJPpY9HI
 r03Ls9m9LxEU5nCPhSHxM+LpH+m+E=
X-Talos-CUID: 9a23:01aUuWESM68T+/KQqmI9820lPfwHWEfl93nBBnf7GGJObpasHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ANiqH5QxjLPKVcv+6NEoWZP1k99WaqKKhCgM3vKs?=
 =?us-ascii?q?lge3HDAp+BQ2Yoxa7TLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="115650006"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DThuuqUeHZNXUA+vbQU8sDTl0kcwft4/JpZ6No2w6v6L6rxgGfRPrCkugPeR2Gk1bm25XPxJSi91VEHGoJO5TawKJ+FWMUZKsTKiz9pQ01ufm/H+2LTVXAG+58YERyCvLYfHYuC/88BwVyaJx1Ntdj/eFRHbJOH4A0tkwmrDMAteJy+bJ/KLuycDK8m7hXsVfHnTdi48cDqZ1gC9IcPQERE2zDKBt5OmrDplu0gA6OfLsm5IeyjxEYizAhdYErQhjhnTQ7nWJWOGNa9N1a12QuDxc0XKzc0BmHZiA5fY/lu0cJ124hds7yMHMFADwA9CDXU7H6aiE56RUrAlYCGL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2jF+Fk+1av2peT0OTKrWYAC9FnMUH30qKEkY/xy79Q=;
 b=Nr/d8vXblj/EaNFIDAEOnVSlgtm59z1uXHXYH8o1oGkSJjcsUFrRAMZu/4aitH0oFZ1tT49wQ3M2yYpgWNMgWZRQQinbGtHa9usO6pDpOXtyIH49rHVZMMQ8UOv9ThaBTELd3AZ5UduF6yyIIq310QnGX1RuXOW7hX5LiJ9M9ef8FMvTnNUFg+ZUR7BZ/ae4vuBEETB0wVPL++GFuUSSySXXHNrpMZPzbkQYdSTZKMd1c9c0sbcqiJereJniUSo0ubuUUxn6weQj3ZmYIrLVmLk4F4hnw3ePiZ7r5C1WTIDj2yweYYAihGDw3l/1G/zEaKjP6PiViTK3a2AQcJFl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2jF+Fk+1av2peT0OTKrWYAC9FnMUH30qKEkY/xy79Q=;
 b=JuMi/mTQxv5C20G4G0TqUkwPoHK6UL+GcC49YLD+B1cLlkT9EQvhFr2jv5QK+BtuF1ZL10gp9NBWKf/MjQWR3aMj6D5i44e6n8dczx1Q9pJ1mnSfauYY+BrpTpo9jZp8r5pDTHutlgujqk3GMb60WL6C7XoLcwiwVGDz8Zbkmns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9c46b711-cbc8-7de0-4136-7815a02ca169@citrix.com>
Date: Wed, 5 Jul 2023 15:00:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 1/4] x86/microcode: Allow reading microcode revision
 even if it can't be updated
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230629152656.12655-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5337:EE_
X-MS-Office365-Filtering-Correlation-Id: 64067151-c2b2-4f00-4126-08db7d6035d4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wiIu0KUKd/WrCk5rr3t+gTapbTLHQMAzKR+BDkGKNaf+ZSFel9BPQasE9EOoK32JIczVoO7rAis3a7xKUKe902SL88o+vxjZh+zmu+UkyroHcnjdEzLHvkUDqChCeXvDBerVlN6OHVv1Z0W/IduE0mzpWOktNbs7Ri3Tae6LU28MkRiI75fWIQLc6ubN0i51FJOW9DouU4O4WpNjbH5hye79VceQ6nEnxMMOrtozl4PYeF4zefFmYzvwyG/oQXf4XX+CpeD8nZcX9nZXOGaAiDYyUzpRO53FN5kYiC45heAQ7AYSMIsQTK56/bzmYcE7+82i4LC/SjYhX0CG+ZduY3qYmS1afMmXU+1hTw7zWp66ZvG4b/mu94p/N8JCn5/PPC94CAuNT4Q+38DWMZdgEJxu8icF6NOvYl11CGg5A19KBfiCCIpQ7Uhk9lgjLRcyLZAvxLRz6NJsM6ps8VKqS+XQ4Ez/dosA7sYXpWdDp2oHet4ffIHAiK1DOJo6ShIvj1nL2PNVsieOlzjw57hrSqwxZPoG0Vn+nKlHmfJM+HaDpHYFKYIW44G2RfKSCr8mDfofPaXS7V8udHYQfuEgY8HN/1/wsk99+CR9jkWI+Ka2rahiZBWVqfQzJMC2XvxBpLLf5wDZ3H/1XQHN9Tqwmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199021)(82960400001)(110136005)(54906003)(6486002)(478600001)(6666004)(41300700001)(8936002)(8676002)(38100700002)(66946007)(66556008)(66476007)(4326008)(316002)(2616005)(186003)(83380400001)(6512007)(53546011)(6506007)(26005)(86362001)(31696002)(5660300002)(2906002)(4744005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHZsa3cxSGl0eXQ1bTlQRVcwTENIc1lHMkIvSUY0bHRhMWQ3bFN5RGVyUHU5?=
 =?utf-8?B?ZEVtVnAzaUwyek5FY0tOK3h0SWhqQXNtZUNTby9xZ1BYWHZIVE0zeldXQUtw?=
 =?utf-8?B?THExM2VDb25STnVic1lORTFKeEpWZDMvTVhvYjNYRHpTWXQzZGhha25mejR2?=
 =?utf-8?B?emhMT2VoYmZMdW9LYTQ4UktmVGFMbHpQdG01Y1NrUGU1MjFzY0pnZVFiOEd2?=
 =?utf-8?B?U3NEZjFHd3R4OGhqNW40OE5kWGU2bWJ6VFlvSnJjNjBMZGJ0bkllaTJoNDhk?=
 =?utf-8?B?aU05UjZtY3RMeERTTmNwTWM4SnB3V1FQU3l1MEZEOVN6cUpMa1FZUXlyV0Ny?=
 =?utf-8?B?aVlManl1YWVzZnlMekdqbmw5ZlplTXp0L1YvOGZGNlVGM0xLTWwzc3lXYVYv?=
 =?utf-8?B?OXU2elhHY0Y0b1J3bTQxRk5Ca3FkOVdwRDAyTEI1bFdFNk5VZXRYeWd2bGVD?=
 =?utf-8?B?b0dXRFRXQklVS3RiQ01TeUl5NkhacXBBMDZWYmF1dmxlTFFDNHU4STZORkwr?=
 =?utf-8?B?UkorUkliMTNXSlRabXRmOFdCTEpzNUEyajZyWHN0VENJOTgvZG1BRW1IY0w5?=
 =?utf-8?B?cGRqSDU4bDFINkR0YkN5M1U0d0cyaklKZ2g2cC9yRGRCVmZna0FINjJ2aklj?=
 =?utf-8?B?TlJPbHV1TU5CNzVwQlNST2lEekwzU1o4bkNUdDNINGVwZ2hKRGxVUUNKVUxR?=
 =?utf-8?B?aVVya2tlKzRXMW9lbUxpSHNFMnRLTnJsTXhGWlRqOURWVjh1TDN1Y0Q5eWlh?=
 =?utf-8?B?M0Q4alV0UTZYWXlNNEh6TXZ6WlQ2MnI5NHZCWFBrM1FMVG1yZk9GTXk3VTd6?=
 =?utf-8?B?RXNjYzREYnFqYWRLSG5md0N5TTlvTFhQdGFEdHhKWW5GdzkrN29mdHBDR1VW?=
 =?utf-8?B?VUorYW1rUGh0VUtyQnhlUkhibldhMWVqSERjMXZ6bDV6ZW1mVGZlVVo4eFNI?=
 =?utf-8?B?NHFBNjZvNkpLVkI1TSt6bFBHazhvNW81ZXFuWHB2d1EzYzRwV0NVUVpuVElV?=
 =?utf-8?B?U2JpZUs2TTZjeDJzeVZWYktRNzhUWHZMRVZHYUVsOHZOZGs3dkxxWmYrZGRs?=
 =?utf-8?B?dllUU050cHpGRUkrR0FDZUY1NDUxOWxSWmVkZjNHdnh1UDlJZ0diQ0poVm9F?=
 =?utf-8?B?cDFSLzJYS3dHd3NNQ0UwdnZOUHJzWUtTQnQ0d0IxWVI2RHZYQ1BmMjNBRTFz?=
 =?utf-8?B?VXhnK3k4WnpKTFlKN0REb29ONEp0VFMvKzc5ZWN0VjRya2xEZU9Qb3lveWcv?=
 =?utf-8?B?RS90N3g0Z2tHU3ZkTzhTTFNSb3RuUllXM0xtdDlHL001QlBoV3RubnppYzVH?=
 =?utf-8?B?bENaS25zN2NxbVR6M0R2SHBDSi8xQ1JJeDJIOEtrVno5cEMzaG5kWHBJY09R?=
 =?utf-8?B?V3hjRS96TFk0US9ZYUFvZVJlQUYraVZIOGU2MDgwMngxcmNmZks1ekFMY2xr?=
 =?utf-8?B?L2hDa3k3S1NsK2QvQ0NFaTRyZnZKdW8zZ1BDcDVwUkptWkRmdzR3UHJZWDUw?=
 =?utf-8?B?YnI0L2dsUDVPMWJ3VFBJK3RLSVFlS2k2Z05iVTB4ZGdudDdJZGhiYm9EbHZX?=
 =?utf-8?B?SXlZNjFFZ3NEUEpsa0pXbEpZSVFzSzR3OXJLU2VZNmplbHZud0UrNnhNaFBk?=
 =?utf-8?B?OFpqU0hPM3BFV00rQlluM2RYTUsvZkp5KzhzYml3TFgvZERjc0RDQ0szNDN1?=
 =?utf-8?B?TitzZFgrNTl0STZuaVc1TkhsZXFtMkM5RTdySU9jREVqbTVuOUdEbVB2SGl4?=
 =?utf-8?B?OEZJcEhsVWJleXI1bmpOSkI4Um1jTlRLUU5XZER5ZlZiK1hmY3dpVnpMakhX?=
 =?utf-8?B?bThUaGtpNFdsQXoxQ0VTdmJuekswc1gxUjVPbFNFdUZDTGR0R3hwQ0JuWDFj?=
 =?utf-8?B?RUVzdllvc2lVeHB6RlNjYnFFaWxza25UbUw2ZnNBTVBoWnI1WUx1YUhQcTJn?=
 =?utf-8?B?czZIZ2ZFWXFkTjd6M0dqbHRGUmRaTW5uMmZOTFd1RmJyckhvWS9maG1zMzd3?=
 =?utf-8?B?L0pBM1psM1kzYmtud3EwYnNleXIrMWZjMUZkTVQvbU11Mlo3T2ZNNGlza05E?=
 =?utf-8?B?eTc5MGhLenozM0h0YVFva1Vxc0tjUENaczcwaXhpSjQrNVVBNHF2TGxDMkFT?=
 =?utf-8?B?SmpGUDIxdHBCOTVIbVRhRnJULzc4SHlyRW9ObEx4Vkg5WEhrUDJsek9LdDBM?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GTosB0vmR+AjkVoLjSktuFUonSicuu6BFhDRHd7NtKEd+51XxwHmTn31xV3XOAG+BB4lhGBcxccO/3JB4COYEiihZBRmLlqB5FfST+azm1EDQ6HeaA4fUxB6oxSwdcmyqqFtzcHU/HpRiMbP5EzsNSa4kjf090CySWuAbNjB/RZqzzNvz2hKFIoTrmEZl1CRYeMPyblqaSClCnWDzR87hepk8uU5EOoTQr+x/FSA2ShEWSOksMALi9h3SmpCEVoywiwdmmiBmDya3AGAwLW6QBHreVRuBsnsG6saHFpItVqBEo5buNf/ipXZXVAigz/JWHkthuAV2eC6Juc7hrcGphiqedKSfHBcahMuVXyhKiCyq/rPivqfU0pv5mmWDIq4UyzQ/VZcZYdZbzrB0UIvQb81J93RI1c2Q/3tetbHAz/N2ejEtzcIviGgq7up96+nlo3ACsMoeQRZFnQDErTMfuv+jhg+2Y5YF1Qu3XomtDwzJmhi4QHkuipRaHfmQbbEizT6LpL0roP0DrkqRJZ7nruCmON8ZaAti0rqCMOoIV3/yOFQiuYTTN7TZ8gzaukKz80WNlawx+mqkJHFRSbxnrQGtuICejCs7iFF0xYODQm6YgQNFhT/NmHihNce1Oi2zNWJdMZILPAB5EbmFbgQFD7Uh/BONtR4fRX+sxU5BnRhsEcDCe1/NdVSHIKZ5hi7PCnZOagruDpPRm7ksKn63Nj+N3h+v+Zd2YyKpWcR2NLSTM0h+WQeUFNJ5tZWVJhBieJ+N2QgsCITyyFluUeR3INiOjpucbtWRWRKJ4lhuRyNgqDLGqolrNUMtbjX/esFCS5AANooOb+6myWdSCUkqWLcrktcuh80r2nskXtw/2s=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64067151-c2b2-4f00-4126-08db7d6035d4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:00:37.9683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRxeez01K4Z7qX7HvjRJSVLL6L6MjGyx7tttBeseiQhcBw5ZnMRYBCRH2BzIksKyDvIppdWQJBpLCLZbxuLaAUYKjHZNV+eWw805BZQNrvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5337

On 29/06/2023 4:26 pm, Alejandro Vallejo wrote:
> microcode_update_one() currently assumes all microcode handlers are set or
> none are. That won't be the case in a future patch, as apply_microcode()
> may not be set while the others are. Hence, this patch allows reading the
> microcode revision even if updating it is unavailable.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

