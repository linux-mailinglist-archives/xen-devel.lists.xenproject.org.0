Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226416D62C3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517853.803753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjghY-0000IZ-P7; Tue, 04 Apr 2023 13:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517853.803753; Tue, 04 Apr 2023 13:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjghY-0000FY-L7; Tue, 04 Apr 2023 13:27:56 +0000
Received: by outflank-mailman (input) for mailman id 517853;
 Tue, 04 Apr 2023 13:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjghW-0000F9-9t
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:27:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f0d471a-d2ec-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:27:51 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 09:27:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6268.namprd03.prod.outlook.com (2603:10b6:510:ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 13:27:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 13:27:42 +0000
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
X-Inumbo-ID: 7f0d471a-d2ec-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680614871;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P4xCSk37NaJ3GwvRnjV+hqE8WKXnDPVbaRFPKeOS5/U=;
  b=U0iz5J0Z84qyU94GeFH935+UupzPtfVx9D4m+IYy+pcDhTORrNwVJfMw
   7Q8zEOd75tk4f3QYLqBCg0ampGg3EZXgbqnKj9OWrNz15lCSE1ixdkVdA
   kyr8OWyD4SnIBqKeQFreszSJWX4SpB4Ct9axsGMSaKfslc7EGs7qRQzgC
   4=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 106697073
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sddWT6LYDtlHsemgFE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENS1TwCz
 mYaCmyCbqvYYTPwfd9ybNi39EoC6JKAnNMyHFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c53WDxR1
 qQ4EglKQQuG1+yE+YjiE/BF05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHulBtNNTOLjnhJsqB6N+ExUGSMab2aEhaiclUyQfMJ0E
 GVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQEnsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1xbXFI88SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:E9U/sK5tmKHRMlG8JAPXwPvXdLJyesId70hD6qkmc20tTiX+rb
 HKoB17726XtN5yMEtLpTnuAsS9qB/nmaKdgrNhXotKPjOGhILyFvAF0WKK+VSJcBEWkNQz6U
 4KSchD4bPLY2STIqzBkXGF+3pL+qjizEgI792uqEtQcQ==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="106697073"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmjaESlC89RsgFZZdc6/0rXISbvxkADkFhu0Oof7SCM/8ems2hd1mTV3R9pSXET4227gzI/5ZGJh+cQy9LrUWDkFbsJb8SKnoNm49zNP6Bws3y6169UVCq0c/ax+vBhCZ8hFU9FgFTg0Wv0GFDuBJJEK9uGLg0bvjB2wYrJbYvQ5GrgCkEqBrMDdXFnS6MvLFZ7qG/CZcV9CoIkyt0kstoIZTg2gKR2SEGm24MM5L/yrR8lU9VwLjzDGflc5+QZ1uFZ4yMa29Ir6IhPh4qIzmFcJkiVqEJ2ZoB5ceAw3OBS8tyoN3lDYcUysRPXLnn4xL5EsnYfEX1BXr8mzrVfE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl1vY8U0d5COAPbhowL7ndLBAeSmFOBTksyjV33zWzE=;
 b=Og5uW2nJZ20lpsCTDjtjS5UcQfCMOJ5SvR0/DeQETv7nRgqeLhfMl1W81WPGypbxXQygxf1sNyr3/n7mq6qB/CYgN1Sz6QOF/m5A34eS+eHoCPHsL7x3KnxLRFm9pqmM81usvIr5tqGu/ei2S1m/YUMBHwXO8+pKBiFCKaQRD5ZeBqCjF/8p4iV1UVvnRrnCq9VXapGA03zmW8vPgkB0u0V+kW2O2+KXkV70MZvcxW+gq82IuZPPPGDpOPPsxDSP3UtiwLjxSWKuDHUCp/hnNN4Wwj8Jv1Zo8eVTbY1lqFcYzbVpEhrMjnNi5cMFbr8Pv5YX3j90kK3Ixe9m/UVbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl1vY8U0d5COAPbhowL7ndLBAeSmFOBTksyjV33zWzE=;
 b=Fvvptp2OycOlJnJF0iIZjnJ15HW3yHFG2dWhmlMBb5TKP/tU0SdrZ4GbZTTUd7JqBM82SCiwB3qGbnpuQtzoa5egnsMqjqE+rRWXf1J/qzIrJ/t7FUFt3ElVMHgwCeyAXaA7NAOoyTekwb7TQcjCXZG6H9yVO+WGtqR1wPSGoRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91fc0c1f-a985-17bd-2011-f4964d82e008@citrix.com>
Date: Tue, 4 Apr 2023 14:27:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230331175719.500285-1-andrew.cooper3@citrix.com>
 <ZCqVEHe1Qo3skeVf@Air-de-Roger>
 <4b76def9-9940-ccf0-8050-12ddf2c1253c@citrix.com>
 <ZCrUErZZkd6co1Dq@Air-de-Roger>
In-Reply-To: <ZCrUErZZkd6co1Dq@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0442.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: e87a61d5-4043-4052-0f47-08db35105e32
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8XvwyiwvE1db9nDwLvG9A+3lQyUDTKmwhzZW3S2jjHmMmkYytAq6U8hH/K8rv9RXi0resvYjonJaimDIuZfwMQ/GxxrX9V3Vvu5Ors3EhI9gyW2CIjhcl8HytAHreF+GDk7RVYVC0ha/VW8DZOxPKELVf8aMjoyVqqSb4SGrzYrEXdNoyp9rduicOe5/MqEXU382RMe1hEDhp8YAfMYTqeCbLIq/ZC1J4RGWbyW3sJI8LlAVlLP+9oVb/P6UhAuhkvzeIDT0WzfW8Fm4GvlD4llnrorfvw1lrwr8K0/4ux7jV+VHzImO+yEx3+tkey4Brjiqyb2lyi1kaOeea7ig/sTIL5jwDDZOk0ZAGEesVz/2f8ekPvbWDrjWJ4ThvYkKrTh+JT289ROmp1zgJBFZRnV+RDJciLCg/b2p96RkkyvM1n8tz+fmTc9cz9TSn/LJCodUe5ubXb5X1VPIyvo9cNGYA0pnRfljRZt3moiZg8Lesu91Bq5IYOwhdJfodyHre1uZ0PEX7E0xP5jZ7B1uvrfEH0D5TMQAcPSg7jQq/tDTYnFjv0mpRuZWPl9EpOApm9xemtY0WDEtYLxnpPUK/rpVYfciGVHkFJyfoMrLXNlhtO6nY2feGGA12mFAdslinReg3uJj0WUz2V4SdVvqlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(31686004)(6636002)(37006003)(2906002)(316002)(5660300002)(54906003)(6862004)(66946007)(8936002)(41300700001)(186003)(478600001)(4326008)(8676002)(66476007)(66556008)(6666004)(6486002)(53546011)(26005)(6512007)(6506007)(2616005)(83380400001)(36756003)(82960400001)(31696002)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBabHVycmhOMUxSUk5zL3djMmNJRGw3dzExZXY2WVVzQ0hwaFUvcXV4Ky9r?=
 =?utf-8?B?dE14d210UVFPdFdWT3VRWUxoUUJEV3RhMEQ4cTNpZ210TzM2SzRYcHd0cUJ6?=
 =?utf-8?B?aSs5MjFxQ1ZSUjNORXJCZzBwR2pCT2lOMmR3UHVGc0hEY1Q1S3ZWVWlsMGJ4?=
 =?utf-8?B?V2ZqK2NLbG1OejlEYkFTekRpVUNQdm84WFJzMEU2VUhIcVhLRVRJa0VhZ01m?=
 =?utf-8?B?L0ZkUVNFdE1jM0JWc2xiSEdWaTRhTkhPYk5FWklzOTNQOTJ4WlpHN1RsWGIx?=
 =?utf-8?B?emJjRWVRMzYrYTN0SlhUQWt5azZlMWFwZWlNUXNZUWRlK2hrNnVEaGpXUnBT?=
 =?utf-8?B?M25uclE3ZGUyUmx6VWtjZ2ZVU0dlYU1Qd1kzcUZBVGNyY1lSM1kvZ1k3Vk0z?=
 =?utf-8?B?VXZVSWo2K2dVZXVwTEpJNlpnQzhwTWRNMWdyUmhtREExbVFkRmdIK1R6STZM?=
 =?utf-8?B?OEhvM1B3NzJtODRzWENjSERvVXMzenpTKzIzbFk0RXI5Y0NydEkxczV6Ynh0?=
 =?utf-8?B?N2t0VEUvM0xWUHovYVNEQS83dFJJemJBOHhuS01LdGw3cExhRGxDOFFwMVNS?=
 =?utf-8?B?VEJlOHdkbTBFVzNLei9DK0xZdGRRU2hHZjdXWitFWlcyU21SQ1JlSTB4c2E0?=
 =?utf-8?B?K1gvVThSRDM5aVp3eHdxcysxNHRpNXBKbkUxSFJIVHAwUStLSkt2NEEvN2lS?=
 =?utf-8?B?UWJsaFU1T0xFdGFrSjZ2YUF6TndvYUpsUGJlRkVCaHk3MktkSzNQOUh5UWVq?=
 =?utf-8?B?aTBxTm1KeEdUSE9VYmRRd1R1NkMxM0pDc1pOU1pjbEJaWmhaTnpqSmRuUkhP?=
 =?utf-8?B?elAyU1J1SUN4TTREUEZNeVdLWk9DTVlpbktQR25hbUdpSEtKOWZhNlF1QW9n?=
 =?utf-8?B?bEdYcGlaMXpJMkRlMlZLbXNYWnNkdkw1Q3ZaRThFMjNud2t6TnpySEdLUCty?=
 =?utf-8?B?TE9Vays0QWZ4U09adk5iaXFscVVzb0Rtck9Qb0VYRDB5KzNLa3d4RkJ4NG1h?=
 =?utf-8?B?WldnYXlCU0N0eXE1VXVsWEJpcWp1MHp0ZFh0Ymp5SklKdy9PMjI2TGZFR0hm?=
 =?utf-8?B?TmRLeVcvVFJ1YVFtemxTVVhxbTBFbVhUWHNEYWJreG9iTUgwYXF0dlJrc2Zk?=
 =?utf-8?B?aGNkOGRUUjJNMmIrQjcybVN4NW40d0xVbWpxdldGUm45ejV4Sko2cWhjakFE?=
 =?utf-8?B?TWtKR1U1eW1LRE90aXUzRkM2Nk1nVGxQTDM2bnh0MTJiM0krRmoremZpN2V3?=
 =?utf-8?B?QXVDUFZoSWFxRWNRd2RpNXd4TFcxQTlzTEFGbTFqMEhHeDhaU2JkTzg4NVJP?=
 =?utf-8?B?N2lSM3BPeU0wVjNEVjdJR0h0aG1RYjB2TXZrbitQMm5URFBoSm1PZ3dyNDdn?=
 =?utf-8?B?K0NHL1FVS0RqOUtNOHE3Q0NCckhPakJzVGtudW9nQlprQ214R3AwRkRjb0ZU?=
 =?utf-8?B?TDJ1b2NZU1FvZmFmdXdPTjNVWDVXWlhraVJEcHlvQU0wRzIxOWlZb0srU1VK?=
 =?utf-8?B?NVRZK0ltTWpsaG83QkRJcHJoZ3MxRXpSTmxEZ2FGeUk1dDQweVVCUzZUZ3BS?=
 =?utf-8?B?NmRSSjBxbnl3YThPdnFqR3lpWmVBNzBNVEZrOGUvaTkvTWlPUUdtb2lCei9X?=
 =?utf-8?B?SzkyTWl3WDE5L1cwbmxZQS9pdUYzSlZlQTNjNGl4TzJvMjNZY1V4M2dBVmN3?=
 =?utf-8?B?NDN2bGVSV3FVVUdTVGR2SDdDYmlwUzdrM0xJdDJOOXRjN1h2K3VFdUFaNlpU?=
 =?utf-8?B?ZGhqUEQzMHVFWGRxbkVXNG10UWVmOU12djVneWRHei9zZXlaeTRQN3Fvdjht?=
 =?utf-8?B?VWRFWkpVcnU5aUdkUXMyT3NyMDFRUnBzSlNEdEtUVmRialhCMkMxdTEvS2F6?=
 =?utf-8?B?Q3JoTnNlQ1d0Zlk2V1lpVGZhSlg0Y2MyOGkyR1VMN3JjRmJIYnFNM1VTMU05?=
 =?utf-8?B?bEZEUnlyQ0FCU2FhaXJCNnkzVWhMWXUzamtyQitRckRUQzJVbVhCaVZJaWJI?=
 =?utf-8?B?c0dnVUx5bXJ2YW1FK00rbElxQlBUbUVyaGh0ZUtkZWlkT2RZVU1jaThPUTBO?=
 =?utf-8?B?TTljRmhPRzYvRk84TEw0QUtWRXh4aWxYUFVrUVNZSThyeDlvcEF2S0JHVVdz?=
 =?utf-8?B?NzZZb3JGdFN1cEYyWGdqa2xzK0dRT1Q3RXdpeE9SMDF3aWl6ZWhSZ0xJVm5W?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5DbWliqt2NTg0SiY73F0PP+0MbEla54To2QiKtFdZ2KI2exgxtsXTgjDqmVMiNu46j++U3WKWBcpqWeSuWkoWW/j3w98fXIO3Qp0gL8B0jkxPk00Rfx6lzP1CSN8/M5tOB84fCjP9EWluCqfMMVtw9ahaOgvK3mLTIbH59x7dqm51aK0ODLzT1lGPTaUGfrfB69bchkin4vJxi0hpYZ/7K5pTdiW0o3XnvVyGPpQ3PLLHcju2Obs3pfIc5Fk1nPU1K70sHaThFWAi/JP2uOCsg+NJqgt7b6C2kXzUv/3TR5tWtdMhOf6cIdknFgGxbrwOfX/AUwadzQhSVrDNH/+eMvwbCS/YaAVbch8k80P+W+z90zTQe8MeWxP+fH6CdopQqJGgKJ8sCTz+KiW49WFNKafIbMcO+ykRL/az/1PTCa24UWx5wETZfwuY4X5DUgc5wBRaZ9ijAie/oHspgbHeAgA0kl8X8Bn05j+wDAqae4vonKqMuHpXOXXWG9cLDuCOH37BM5Xi+Eo5F6mkyz/yLTNYPEkHQvs8KiJe5Q/e2WDGxRK/9/gHR9WKd2x5QgNDDWHjjRXihm3VgwD3F6QQwlAgMYp9NA/LOlfndnD7FaHjbIcKjNfoX+Y7q1Daat4PuAReSgItSsZznBd4ingX80LDAIcJK62BeL3MOW1gRD35bPq0g5zwWFHYZkigBxHwh0sPcFhZ5lRF+KftyotChafU2f6X064C8AoyJgPdwRZ696wS8zUkqamnBxjIfOwopA4nvPmXUuu7R3zsAcHwgLGWDFgmmAp5LwbS/2gUhQBwAkHaesHtTwtXi10SNVI
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87a61d5-4043-4052-0f47-08db35105e32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:27:42.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2OnHul5NYlWXcnPzRh7f15M9dPrbllYoRiwtl/Bd3rDMGIoYha+mwbCmECEbTZlcZlQeKzknfHY7NvedJncUfJpoT8fPgS9CbQ2QNKPMgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6268

On 03/04/2023 2:26 pm, Roger Pau Monné wrote:
> On Mon, Apr 03, 2023 at 11:16:52AM +0100, Andrew Cooper wrote:
>> On 03/04/2023 9:57 am, Roger Pau Monné wrote:
>> (Quick tangent...  Our PCI handling is currently very dumb. 
>> pci_mmcfg_read() returns its value by pointer but the callers never
>> check.  Swapping it to return by value would improve code gen quite a
>> lot.  Also, when MMCFG is active we still pass BCS accesses to IO ports.)
> I wonder if it's really preferred to access registers below 255 using
> the IO ports, as Linux seems to do the same (prefer IO port access if
> possible).

And see how many attempts there have been to change this, only blocked
on untangling the IO port mess on other architectures (a problem Xen
doesn't have to contend with).

MMCFG, when available is strictly preferable to IO ports.

An MMCFG access is a single UC read or write, whereas IO ports are a
pair of UC accesses *and* a global spinlock.

>>>>  
>>>>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>>>>                          || id == 0x01268086 || id == 0x01028086 \
>>>> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
>>>> index 5da00e24e4ff..008367195c78 100644
>>>> --- a/xen/arch/x86/pv/emul-priv-op.c
>>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>>>> @@ -245,19 +245,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
>>>>          if ( ro_map && test_bit(machine_bdf, ro_map) )
>>>>              return false;
>>>>      }
>>>> -    start |= CF8_ADDR_LO(currd->arch.pci_cf8);
>>>> -    /* AMD extended configuration space access? */
>>>> -    if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
>>>> -         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
>>>> -         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
>>>> -    {
>>>> -        uint64_t msr_val;
>>>> -
>>>> -        if ( rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) )
>>>> -            return false;
>>>> -        if ( msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT) )
>>>> -            start |= CF8_ADDR_HI(currd->arch.pci_cf8);
>>>> -    }
>>>> +    start |= CF8_REG(currd->arch.pci_cf8);
>>>>  
>>>>      return !write ?
>>>>             xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
>>>> @@ -1104,6 +1092,11 @@ static int cf_check write_msr(
>>>>          if ( !is_hwdom_pinned_vcpu(curr) )
>>>>              return X86EMUL_OKAY;
>>>>          if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
>>>> +             /*
>>>> +              * TODO: this is broken.  What happens when dom0 is pinned but
>>>> +              * can't see the full system?  CF8_EXT probably ought to be a
>>>> +              * Xen-owned setting, and made symmetric across the system.
>>>> +              */
>>> I would assume CF8_EXT would be symmetric across the system, specially
>>> given that it seems to be phased out and only used in older AMD
>>> families that where all symmetric?
>> The CF8_EXT bit has been phased out.  The IO ECS functionality still exists.
>>
>> But yes, the more I think about letting dom0 play with this, the more I
>> think it is a fundamentally broken idea...  I bet it was from the very
>> early AMD Fam10h days where dom0 knew how to turn it on, and Xen was
>> trying to pretend it didn't have to touch any PCI devices.
> It seems to me Xen should set CF8_EXT on all threads (when available)
> and expose it to dom0, so that accesses using pci_{conf,write}_read()
> work as expected?

It's per northbridge in the system, not per thread.  Hence needing the
spinlock protecting the CF8/CFC IO port pair access, and why MMCFG is
strictly preferable.

~Andrew

