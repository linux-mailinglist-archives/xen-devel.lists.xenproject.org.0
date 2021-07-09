Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4083C26F8
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 17:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153781.284116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sZb-0005P8-B9; Fri, 09 Jul 2021 15:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153781.284116; Fri, 09 Jul 2021 15:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sZb-0005Lk-7O; Fri, 09 Jul 2021 15:37:51 +0000
Received: by outflank-mailman (input) for mailman id 153781;
 Fri, 09 Jul 2021 15:37:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1sZZ-0005Le-FT
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 15:37:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cb1181e-e0cb-11eb-85fe-12813bfff9fa;
 Fri, 09 Jul 2021 15:37:48 +0000 (UTC)
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
X-Inumbo-ID: 9cb1181e-e0cb-11eb-85fe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625845068;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bl+Y1SSUS+A/PkpMC4wxWjeriDdYg2w8BFKyFQM3sI8=;
  b=aiFl6HpKQ3gQbqTdRT5Jns1wl04JxaLXCxbj6OZBMXZ/HwKGHDTV7wRe
   BxpUQ54/w2CGCQFd8ZKoTZXTEmg2DdoN38Xq0WvQiFHlUOu2KOtuoQdDv
   aejcP7xR7/y+IP17Hafr5p8cRfjCJxXmohMKP+srDE/dhmQD1Q/0+PH/h
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zi52qASwbM1vkb+UPRzXwUTvZ691Az1rrmh8QCx4AOsdz9uGJ07LUUPBJTruoFSeRrKtK+9aBz
 4r2cUessYdC04mUv1P78E6eMdizM83S27FxgwEK3pAOQMS3NG7x/9jjhc+iaUVyfrhSPozPSqM
 ckw6/hGJu9G7Xfdunspa6CPNH9dw94tZmrERgWx2SQKvYIjJU7X2el72q2kEqFYdc3whhMh/Ju
 cpTOJu+RCeb7BclTTXwbbIbbuHfFrjx8v1YgE9BDsEEyZl3m+WXT693ZaiP1V3MFAwJCN5B/bv
 13Y=
X-SBRS: 5.1
X-MesageID: 47647386
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IeRNpKP9le3jo8BcTsmjsMiBIKoaSvp037BN7TEVdfU1SL37qy
 nAppQmPHPP5gr5O0tOpTnjAtjlfZq0z/cciuN9UYtKNDOW31dAR7sSjrcKrQeAJ8VznNQts5
 tdTw==
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="47647386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvMD2p+pnjW7SJWrdiRDKBOuriMydErNi2xMtPImOehSOqZYuL7bPL7mcgtvnADFCeHe+EXW7UsFh1qxWRDAPDUbQay5k/b8qMZvuoM2WEvIEtiL9aJ1qGizYqeNiejaafXI8v+qLV0pCQxkQ3v4u5VUJiONBjyIzkpbSqUtFSk7PvDRaVEFS7PeuYJMTgbQ9p398Hhcdm6Sj7Kxh2zZpFwjR/P7+INNtq82KXHhAJpOLacQDciFwE9GD5FNd3tvPw7m0Om2E6pdusJCjMtu4PB+DunQAb4gmNNbr1eoxpKQ2RIwFx8rTuA/Nyw44IwrD/HBStoCNo2kFXxA7e0QKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl+Y1SSUS+A/PkpMC4wxWjeriDdYg2w8BFKyFQM3sI8=;
 b=Tm6+mEbiHE5GISSGZKRBMAre+dJA7yM1h4VT4kvL59X16sIXSIdlzlTlkslDPABXRYn2Ymd1p4HkHh5Rk+FGf8E2CHOsxaWsIwEE5YWeFzkjc/9TbKQgigauIjJoguisauEm5nhr13B3z+CBq5MxzvvKGoZJCwtMTJi9v20FaHM4zN8qppxuehS3KKgytCQHSVZ6Ov9152EjQzEgowy/trfbtoPgL0qpxISoW433KdyjV3ck2Wpblnp+qaaE08x52+PNlxl5gpBm62EW/bkzjPDq9znIE6EMEv3lGsKwxqpyEjB8Z0PUY+iRtnXgtFhCJnNZuqOxoEq2LoRx7lPqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl+Y1SSUS+A/PkpMC4wxWjeriDdYg2w8BFKyFQM3sI8=;
 b=Br96YWAcaQmNZxRXLvZf37sCzVEaOCrhJoUUZQIHTc/Q5z9dVgkSRnaCPn9lgDHJgE7QHbBkAPKm3voYMD8n5LGwRkX8TRcsAIV5mSGOxtY2XoweGafDE+Z8xSmHhlZ+iLZB/TkxGAD84uewZ1/4/0VvPpJnbM5jR2eZrJibfKM=
Subject: Re: [PATCH] tools/misc/xen-vmtrace: handle more signals and install
 by default
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210507152836.20026-1-tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c29ee04f-786d-ce4e-3122-8169d7e8a78e@citrix.com>
Date: Fri, 9 Jul 2021 16:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210507152836.20026-1-tamas@tklengyel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b976c80-492b-4066-78eb-08d942ef7ee7
X-MS-TrafficTypeDiagnostic: BYAPR03MB4296:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4296922D26B840D0660CF2BEBA189@BYAPR03MB4296.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KeHWqd4+i31R8WSMqvyP3afbgTykmg8jrltuS31ICgkEyuWLSL9bYZfV+ZI3dDT2kbwYqoW16B7gMVF4rRDkhPZ7JoD20KHuNz7Be5qR9Tmvc9HH7lognOurMmNlfztY9A6pGnpDhZsujSOhjimnjA7jY4lcRHUIgNGS0c+RM9Kz5AXEH5PrNYGHOuTcGRo+b4OM7P86GmGU7Do0aeOP013Ou2GcioLMe44ghx7XV0l6W1UPRTJreFB8OaL2vvhb7MjZjd0LyYz9MQsfzheQydgdEh8DCwSTDvhvtUuKv5HKaKEHrdVnFc+DFMcBLe9q+afbBwVjK9jEH/FxmgI1vK1V9Bk5WTpMtEtDKgjPmXzQ0BE1RnHeMHbOik6P0M+M2KMOagHYMyHTwZrMtP9ZFZwHOFUg2olPiNXzKyHFuWXbhvNMeguh8h2jm9VqyCZI0Z/1wKS/nqN5cXK5SsA5agoJqZdFbFgjYgwzr9uMtuu64JyI9nX58zsc2YIfD6XyBKSWlaTkDUSSvKfSBjz244AI/8UizWuBAkCk5BjAcSLnCaB3M93TiWCFYJnK5xr8RRZSdeN+fHQdb+ERKcaQwwFKdLnPQ1x2s2wH7U/X3fZ0c7fJJJWU39oNtyDyvnQt8aSQuiMH+wzRZIsUX2DQSofMkAIB+6KNA/0HK+HBB1Gz3cgIldKHqwHeWUYZ1tOhX/qAUfZLVLhqZW7d9+UHgNH5IaKLJ32a0tOZazuijXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(136003)(346002)(396003)(558084003)(53546011)(316002)(16576012)(186003)(2906002)(66556008)(26005)(4326008)(86362001)(36756003)(31696002)(54906003)(478600001)(38100700002)(66476007)(2616005)(6666004)(5660300002)(956004)(8676002)(31686004)(66946007)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tqYVRiNDdVYWJEa0lqa1hBNE5leS9selFoNG8xd0JtQ0pyVGtrR01KVHUr?=
 =?utf-8?B?a0hQRDNLek5pTVF5dTkyemlnNVJxNzNEV2x2MWVSM3pkNmhUZDlPeG9MQVV4?=
 =?utf-8?B?b3RvZXY1MU43b1RxWjIyRmI2MEtFVDNaWmdQYkY3cVFEWDRKNVNPdjY5S0VT?=
 =?utf-8?B?ZjJxVXR6QjB2U3ZQUmRvWmovVmltamhmdlpHQVNwV05EMDlZMkRObEEzRXM4?=
 =?utf-8?B?MVY4NjdDQm1aKzVZS3ByTldFeG9xZ0t3Y3RYTXIyWjNKRnVFdkpFQlArZVhz?=
 =?utf-8?B?Z0ZZdUtwdFJOT1ZhK2N0by9KbE9RVXh1QlVITlJnek1raUppQlR5ZUFDZTNj?=
 =?utf-8?B?azgydkdFK2JRQmdpbkY5NUNTNXdjREVOR211SjV5OVVMc1RWVGl1aGs1dHpl?=
 =?utf-8?B?c3V4QzFQYW9zSm5OTnpzbHhLbXRDNnh5NHhmcnBkT09UQ2dmNDlJMUl0bGhL?=
 =?utf-8?B?N2o5RTVtK3E0MFlWWU0zRERFODVsdGtCR2R1aGxydGxEOGxzekxqQ29oVXFi?=
 =?utf-8?B?WXhGcVZMbi9JUmVRalB0UGVMMVNZUHczbWk4clJVZGRYS0xrWDZScE80THRu?=
 =?utf-8?B?RUZueGpiakNtTGtPOWk1ZkhWUXYwWWxBUEloMWtqL1BUck01Zk94SXhyUnEx?=
 =?utf-8?B?UFozRFMrdU1JNHh4T3JCT0Fpb0l5ckh2Ui9LODR1ODdHVUxEelNhckZUSVJ5?=
 =?utf-8?B?bURlVncvMkVQZHlFQVlkZkpTTldZK2ZDZktqamd6cHEzbU9lc0c1NXBFcW5K?=
 =?utf-8?B?bHI1UXpDMDV2UFRmcGVDbXV5WjRvb0hjWStQM0ZsWEJlRDZSQTJKdmV5cm93?=
 =?utf-8?B?bmViUFcxRTNFRjZVNlB6NUh6U0k4Z2o0c2NXeFBMV1JZbjRuWVNXQ2ZVQkl4?=
 =?utf-8?B?WGt4Mi9DMFpqNzJ6OCtjSUsxRWtEckZsZHhiQmljSldiRk9walBxRm1YVkhD?=
 =?utf-8?B?aHNUZVVZRVd4QWYxdm5lS2V4bHNrdjVialBDSVJJYmVWd2RBU2czUGtPeVU2?=
 =?utf-8?B?N01VQXN4dlYyNFc5ZEV3NVltcVIzTGVoemYzdzFDYy9WbmYvZW9Ta2s4bGVK?=
 =?utf-8?B?Y1l1Zk9yRFRpNFFDR1pHZmpXek01SnZpUElxcUxTUFhtazdXVjlVbGJzQ0o2?=
 =?utf-8?B?NWZKSlRMOG1iV3JMNE1rcnZKZjY0Q1JIcC9oV2xTL2xsak9VR2FJcnB6dVNj?=
 =?utf-8?B?aXNUaUxWQ3VXSytSRVp2MUV0UTUwRW5JK2FNalBsOTBtOSswcU1LQmlkczdH?=
 =?utf-8?B?K0pvQ2J5Z0gySVZvNVRNYk5WR1RuY1hBa0dFOEM5RUx0Ny9nbzlaV29Hc3dE?=
 =?utf-8?B?QU1PUkU2UTZDcjdOb0FMSXl3VkZ3VWdOM0RkT1pPRnV5OURRcWsvaVFzcWJY?=
 =?utf-8?B?ZDRsYU1MMEwyb3hjQmpObklFK3REc2dndTlZWWRvWkhlbUM1dTNFdTRFazJ2?=
 =?utf-8?B?N3RWZE4wUGpuZVFtR2kyQ05Hd0pGS0Q2THArZHN5M3NIa1VHWkRMK3IwK1Q3?=
 =?utf-8?B?c0paa01aK0I2WTh4b1dLSXczM1BvblFFR25zemVZK0VHazExWWFkSzBHc1FH?=
 =?utf-8?B?ekVpQ01aQm80eUxLcUNScURLNnl5SjFxd0xrOXBDS1FJSStvTVZManN2aUxr?=
 =?utf-8?B?b3hkZEcwSVR3Uk4ybGhBbklMYXB0dXFPc1NuWkg2bXRCMkNkdmwyS3lXbm9F?=
 =?utf-8?B?eGttZVRJTUdnNHhBaWthNmpkbXhJcER6T24yNzcxcTEzUDRtY0c5YVVKUnFM?=
 =?utf-8?Q?Bdj7rlEmDARRO8DcGG2cOILOM4FHkg9kT/C4cuV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b976c80-492b-4066-78eb-08d942ef7ee7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 15:37:44.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2Q2ihavL9R0zUKLWqb7Z4vksdvPAWsf9cjZqkAU4npuWuZ+1/KzSUfOiltEych4mUGE5MUW+uGbppit5HOXsBEJvwGk8kFhfmSbelEfTZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4296
X-OriginatorOrg: citrix.com

On 07/05/2021 16:28, Tamas K Lengyel wrote:
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

