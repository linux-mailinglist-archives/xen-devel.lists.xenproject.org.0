Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613972DD4A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 11:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547911.855559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8zzc-000158-N0; Tue, 13 Jun 2023 09:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547911.855559; Tue, 13 Jun 2023 09:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8zzc-000129-Jh; Tue, 13 Jun 2023 09:07:12 +0000
Received: by outflank-mailman (input) for mailman id 547911;
 Tue, 13 Jun 2023 09:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgtI=CB=citrix.com=prvs=52172834f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8zza-000123-PU
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 09:07:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9015cd-09c9-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 11:07:07 +0200 (CEST)
Received: from mail-dm6nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2023 05:07:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5599.namprd03.prod.outlook.com (2603:10b6:a03:285::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 09:07:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 09:07:01 +0000
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
X-Inumbo-ID: aa9015cd-09c9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686647227;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nu2pNMdys8vtEpgX1H5wD8Tq2YNYQAmIsdpihUcLusc=;
  b=Y1zPl2TG/t60xOWXbc9VwHl1oAWPZGwDb9NbKXE0TySVAoZeunBO5OVV
   Ag4LcR4q4SXvlGldwnqztV1cVNC0DQi7+sM4w1pMSzAFCHt0oGfWMH7DL
   UxDT6HxgtJy4nMlWeq6fIW3KHY/s25NYzcaQS5qNiDoxcDlBOOGuqp2qQ
   o=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 112464026
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:C73vNKIGtHIqebYUFE+REJQlxSXFcZb7ZxGr2PjKsXjdYENShjcCy
 DcYWGzUP/2CYjSnKdp3a9y+90NT6pXUxtY2QQZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AVlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5UIlNcz
 s4gKQwhby+Hjr+V57efdOJF05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHmnBt5KTuPQGvhCiVCM7WcPNjEvXl6VpNSpgHT9d99HN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wmlw67Z4Q+fCnIDCCBIbNgrtsgeTjgty
 1PPlNTsbRRwtJWFRHTb8a2bxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7i7BNi8cOj/m/5Qqf32jqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:QBvWXa8zHTDykpTe/6Nuk+DnI+orL9Y04lQ7vn2ZESYlEPBw5P
 re+cjztCWE8Qr5N0tApTntAsO9qDbnhP1ICOoqTM+ftWvd2FdARbsKheDfKlbbdxEWg9Qy6U
 4WScdD4bPLYGSSxvyKhDVQW+xQp+Vv3prY49vj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AcGT52WhR2yFfN2hI+ZUF5WEA1TJuUV7v3kziG06?=
 =?us-ascii?q?EJWdWTLTIaniV3J1vup87?=
X-Talos-MUID: 9a23:q8ymFQaVJ1RKueBTvjLzrzp+CutR6KGADW0dm69Fl8ScKnkl
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="112464026"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW/RZOCWF+9NKxJC+KoT/yw6vWbT22usLJA5l4giFzOm5vADW42zBE1EE1GY1WaZIJSDvH9izno+znCvIfWToFJ6CRsILYT8Vyv29kPFm7C0ZtVOCJQ/ZeFPSY2/cqY03Dh4dJth5LBO1cAIMIAGzkxsjxXRsADpwjfFkYzVnQZ9iy2ffR4RK3IIwiDNONMjARkHJSjxKpeNSZcJth7T3FSrkeFs0PaPapV5nvwmtWrr2zLM7tXZ4QBF3CmFrE8bO4KNNrlAKTeMLr3OhSU/h5qeTFn2GSdevqOjXahboBpsq/xJINoeUH9dSngFbI0Z24RJ/wuZCHfytlVd4aLiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo11QhvgllCnVHAQkRrnHmV/ux+kwbhW9D7qxsapFb0=;
 b=lgRrctxU+b1Cyed3J567b9sRL0Y/jTrT3q42nv3fw0RE0Y1/Pysj69JpQG2VaprxSe8grJrX1ZKEeWCTqXs8u3jj6SkRf5q7HCs/netPL6GYux2maiZXEkvLm69nmpq6XSKbYcrdNbc1id+VjvA/nY4AsigfpowZJArcvveQGLeAaQK/jHeqLacaFG7wDETlKUu0k7F6eP+mTx1KYDP3AHUQbOG+msOna7dOcUq2+KaQnjJmPjsONfsc3/0dOiUf7UGH0X1jkwg2gOtOC/Wvr1YADJZ5plfe5aBNWSeY//hpX0p0BKWg4e+t2wh6m9G6pdqk4D51uQNr9jYqVpmJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo11QhvgllCnVHAQkRrnHmV/ux+kwbhW9D7qxsapFb0=;
 b=uEb7hlHIEAgvf+VHxzPEsc3OnsfYEqA2s3LMaF8nNNwC3UZJGF3YvODvlobaI0VCkhy0VJ5TY4RdmfBTiDhWUP2vpCZHx4t+TH61JaY4PScVL/QBdSi2NtCRENh+mYsgXfDSbo/IkBDwYwpqF7NdvsRJuVUuIjT5QRNGybqb6rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <250f5e2a-44ea-0ddc-c4e1-28a20ae0e206@citrix.com>
Date: Tue, 13 Jun 2023 10:06:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/4] x86: Read MSR_ARCH_CAPS after
 early_microcode_init()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-3-alejandro.vallejo@cloud.com>
 <6ee9e687-b8ac-adfb-552e-522a21e128de@suse.com>
 <f1c02253-5f49-eade-97f5-cdb188e3c327@citrix.com>
 <62192fa4-ca15-92d6-6b53-db81111545e4@suse.com>
In-Reply-To: <62192fa4-ca15-92d6-6b53-db81111545e4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5599:EE_
X-MS-Office365-Filtering-Correlation-Id: f891cd63-f951-4690-a7ef-08db6bed8c4f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/8rlzE7gI1ZeZ+FNYfh8M4Y8BqtgqBzcP76WvBK9u7hl/iO13Zcyiss9zEnvdKYk7pLodi8orGiXsykwIENgqgVNrpgMhBW6fGZv9S+Av3O7ik+9XjYYVeiYpQTgI7bag2wIh9jzAzXehxWTP2g8nnluDh7rFa92z015P3AzGjmP56ZJal7HNXjg3zYRcCVYWeuFvU4AX1IpPA5WqPYr0a7RTx7bPudAXVa+HeIr/wju9nKnSHXGrSoEWD1QD0jpvVnJFMN3c0cUr/dK26F6tFv5yv5yEN9Pw8hVPvWYcb5+g3pfP9uT/CZSm+hj+YRWPQGqUl4smf3Z8dDoSZMWFDRmMp10jNWrBk04KHJzd1lQDOkKW0gaGfSBERDqKqk5c6PpTg3VomGRajHUFYVrPbqN3ds4+UqsBYogz+Lver8igP2qsp64Ls+PZOsA4z/OLiJkdWNAS6NpHuQ+I4EY3Ebbh6DL5UNZDzvpy+Nn9xjQ7YZnqLVZvyPT8wFXL4CcxQqvq7c4sT4EBTtcwDVtXjgHSo8Evc11iUQHZ0cFN7kXglI8h0MCVn7e2aE3cEdFGPhYLgQUq5Vm82AKOIBAmc8GQQQJIoAfEyr8bVsQoD56JuR0bNKGjJUwKIiOgtbxpN9kI+JhkrK0VlIhjm53OA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(36756003)(31696002)(86362001)(66556008)(54906003)(478600001)(110136005)(4326008)(6666004)(316002)(66946007)(66476007)(6486002)(8676002)(41300700001)(5660300002)(2906002)(8936002)(82960400001)(38100700002)(2616005)(6506007)(26005)(6512007)(53546011)(186003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjZwWVRydDVMaWI5Tjc4SzlmMDdHSW5yVmNDd2p5RTFTbkJKeHYwQ0RtYnNw?=
 =?utf-8?B?WldDckF2akZXSnlwNEQrSFF2NHFYK0V0bmJLV0p6OVZucklIQmgxL0tQUU9r?=
 =?utf-8?B?Q0xXbFZmOTc5ZlN2a3hvODVPanloOTBzYnRiVkFnYkNuWjdjTitjMEpCSCtT?=
 =?utf-8?B?V2U3Y0d2NEhqODhJNlRSRVM0RVgxbUxXdkEyMXJHcDVzdFFBdmpiaHQzTXBa?=
 =?utf-8?B?VWZQakFvUXdFUmlBNUZtNVFiYU40K3ZEc3NlbUtGT0NKRlNVZm16Y0Z3eTho?=
 =?utf-8?B?WG5JeTlTSjZQVzZsZUNxVWtHMERtZHRoRUxXSFVOUDRNbEpHVU5GTmJiR0tr?=
 =?utf-8?B?bm9iekdZaFVrc1dvbFQxTXRvYjZmdm5zYm5zcXgxcldOWFhPS0pLTnIwbStQ?=
 =?utf-8?B?Tk5IT2huS3A1SUVuVFJJYVlGSktNcXM3NUpkcHFETDFNQklZWFhVc1VkcU5K?=
 =?utf-8?B?Mkw2a2p5NUZVQkw2ZVZCNytBUFlJejRacjNTVVN2RUMrRE90U1JpNXh0UWxR?=
 =?utf-8?B?Tm1Hc1Y4S29BaE9oZG8rOFpQZExZdnQ2S01FdUtoRzdhVHZkait5SSs4STV2?=
 =?utf-8?B?WnVPWDBzaktrM0hXandxWlUxNXNjUlFaL2hiUERpalBpcEh0Vjl4SFZrRllM?=
 =?utf-8?B?L1IwZnN1bTJub0N6VEcxTVRGTi9iK3NmRjBVd2hkMVJPOGpLSElTK0dFTkFu?=
 =?utf-8?B?a1IvaE42allNbWpRMlc2TTFqR1JCeWZMczQ1MG90REF6aTlOb1o0RU1xNEYr?=
 =?utf-8?B?dU1FNmJXTmViQUtuUFlJVzBJQnRET1NnZE9VVkYyM0pRcHhSZXdpUkYreEN1?=
 =?utf-8?B?Sk1rNWZGK1JnQnR3U1Z2VFYwRlQrTTF1eGovYTJOZjYvQ3poVFdPRVFKMzgy?=
 =?utf-8?B?cG93Q0VjYjZ0NGVId05NUEVQbDBubmJTbHBNWFRIZjF6VkIwYXFDN05hOW1a?=
 =?utf-8?B?SWowWHJCMTJWcGpWdnVhL1cyWU56WUNUSVp2RldENk56RzR3N2J2VGxzdkRL?=
 =?utf-8?B?QnNiUjhFWmh3VW9kRlhMMXJKZ3R6QVR6ZzFGQjVKVHEwSmZsYzJ1R0RiV3V3?=
 =?utf-8?B?cXVLaldNZFR3Z2xzMVVodzIrUzRQWGZDZGxzQUlMYUlKSXFzekNOck5BZThC?=
 =?utf-8?B?S3FaZHVQdEZGTFdQTnV0UTNNZ0FWamxzamdGRGQzR2tPUFBwRVo3eVNhdGhF?=
 =?utf-8?B?NjNIODlybHQ3SFpSVlJHb3Btb3YxN3F3YmF2V2Jsb3Q1T3lUeFBSSWVSWmRD?=
 =?utf-8?B?dGNMVldtNklvNU5JVi80QnNQMWVpZDJkRkVoREVJelJSYWxQZkhWYjRJWk13?=
 =?utf-8?B?YVh5WWdQL1YwZEtxazVJdm92K3dSNDI5TWlkUnJOQmtzM1pYdGVzZndHaWZ0?=
 =?utf-8?B?bmE1aUZQekxXZlI3MXZUbW1HaThOWmdHN1JuNytEWHRFWjhCZ2VlKy9PdkUv?=
 =?utf-8?B?NGN5cDRPa3hSd3ZzOTBGbDNqNzA5M284R0dNN2puUnpzVUxNWm5TZHJNZU1I?=
 =?utf-8?B?WlE0VlEwNHFVRjJvUkNpa24zTExmSXBUaDMvcUVpZEt1L0YwaC9CV1BpdXc2?=
 =?utf-8?B?VUpscE9LblVuNkpzU1Z2eDNwbmFmdnZ3OEtaYzlFRzhSMktVY3JYOU5vd1Fj?=
 =?utf-8?B?eDdwQU5PVkI0T0tEY0hLUHUvNVJpcXZnYTIzY2llNVhsbVVMSENUU3U1OFpN?=
 =?utf-8?B?VEphZkl1Y21SaEhwOWFObTdRa1dUaTN4NkdYRU1MTk45dzFYRU1YSW4zVmFl?=
 =?utf-8?B?THJlc05CTGtsdGMyTGZKTTkwOHpBcmF4RkpQOXlNaUJMamFxbWhYZGhhNUVH?=
 =?utf-8?B?U0dSVlk4VjFsSmxrRlNab2JNeFNtYTdaNTRGT3FQRnFFdXlRaEl3N1BWTTdG?=
 =?utf-8?B?TzYvKy9tVUF4dllzRmI0SVgwUytRSUZwWnpQdWVMUzFEQVVjbHhFNDdobzQ3?=
 =?utf-8?B?Y3k4U1hPb3RWRFVWU2pxRzAzZlFkTHpaUFdlalpDSzhYSW9rRjhMTmgyb0ZH?=
 =?utf-8?B?N2xuR0VsWG53YVZLM1Z4S1A0aEgwdGdmK3d3RDNyV0FXZXJKTWJQVFQwOGpL?=
 =?utf-8?B?NXhEZnlRck1qMGsya0Myc1BXWk9pakJDR1pxQUhiL0gwOTJTM2p2bGkvRHk0?=
 =?utf-8?B?ZXUyYklHWDhMNk03ZXlNZE13WHZxeGoxMGFhYVNpdXN3UGxjejM1UWF6MGM0?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/ZdXoxzkN8+BJ931V4NFrvoTIwdOPXFRJfw3fBLearxrJrmK0A7UsS9J+AX8cjawXwQxRMmX2/mC80sBelp/nvOwMf5TPnRpizvH07sIfHnMKBUcCvYQfHvJyvOOdHTtJvzG4EwCKU6fJnNKTvjaXsZp+LTtK8jdERmF9pEmLC779JKEZQwZnmRdtjyzjpNH1TXhoCzp/FCAHp6LP/PMEio00L+gp4PlYJDdBRuOB+1z4yZ4K+w6AmiWxFvnSuYhkyEDThJsqBm7AHxsjHOGWWHaSjbCKsws3cD4lwszKOLN7cNHy0/tFze0hmNGj2AgW+P9+wjJaRAiBV2JndRjkR9UXibZzUBN33hvH2AXSdNoRxLaS9DOaluzxRDxxLkDLuOsPc1XBH7jepszQqBmvdJJtNhmMvL3oiKbF/PETt4utE8KRjn/5/ngHdHUh8O/tg60aoZgp7snnlDwe6RD2JZOBnAT4rjmmvC3aebmUxPZv0L8iv73/F18U++6WqWiBDPjBSBwDbylW0CouZ6oSUFAGwc5z87tfDuFvRVIyXtC83RVpqe5c5rf/8Guv3Deqlke3pvqPg+1SR53wzfGtVPq98VTyqceEuKWm2Iw6JYy/03a/3sm2GS/+1FGtc3AnkI8uOQp9CvOj+XfFMzrREYhJcvF8Tqru0x++9G/ESA5/rNui8/AGifRKcxla4Ij/nwvRHBMkp/0uqu4YTNgADgwe2aR4aA7Wv7n7lxFysJ0mjKCAXcJaBIyYuL4VgZ80OewkwvNuTqoC4s5s4Oa1WXiqv/hxuBLncgAmhcCjviLSsAB0snpa3QFxZn0A2als3G6cJR79pOCvJQ1+SqM28gzxMjzSTD1Np2i2wkmq3Y=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f891cd63-f951-4690-a7ef-08db6bed8c4f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:07:01.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R11B5ad8FK7gFgvlW22K2hcj4+S6LLqRMWZm7LjvFbUf/0t5nIqcfhGlmPvvboHUfNUwFuPpQk8yDl3+Xx3RRf4GV1JuhJ9ongg0//fxLco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5599

On 13/06/2023 7:40 am, Jan Beulich wrote:
> On 12.06.2023 20:25, Andrew Cooper wrote:
>> On 12/06/2023 4:46 pm, Jan Beulich wrote:
>>> On 05.06.2023 19:08, Alejandro Vallejo wrote:
>>>> @@ -878,5 +887,17 @@ int __init early_microcode_init(unsigned long *module_map,
>>>>      if ( ucode_mod.mod_end || ucode_blob.size )
>>>>          rc = early_microcode_update_cpu();
>>>>  
>>>> +    early_read_cpuid_7d0();
>>>> +
>>>> +    /*
>>>> +     * tsx_init() needs MSR_ARCH_CAPS, but it runs before identify_cpu()
>>>> +     * populates boot_cpu_data, so we read it here to centralize early
>>>> +     * CPUID/MSR reads in the same place.
>>>> +     */
>>>> +    if ( cpu_has_arch_caps )
>>>> +        rdmsr(MSR_ARCH_CAPABILITIES,
>>>> +              boot_cpu_data.x86_capability[FEATURESET_m10Al],
>>>> +              boot_cpu_data.x86_capability[FEATURESET_m10Ah]);
>>> ... "centralize" aspect goes away, and hence the comment needs adjusting.
>> I find it weird splitting apart the various reads into x86_capability[],
>> but in light of the feedback, only the rdmsr() needs to stay.
> Hmm, wait: When updating a CPU from a pre-arch-caps ucode level on one
> that supports arch-caps, don't we need to re-read 7d0 here? (I.e. the
> call to early_read_cpuid_7d0() needs to stay, but for a reason
> different from the one presently stated in the description, and
> possibly even worth a brief comment.)

Urgh yes.  We do have situations where this ucode load will cause
MSR_ARCH_CAPS (and features there-within) to appear.

I'll rethink the safety here when I've got some breathing room from
other tasks.

~Andrew

