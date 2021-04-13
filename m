Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E5C35E0D0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109805.209641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdF-0005ow-Pe; Tue, 13 Apr 2021 14:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109805.209641; Tue, 13 Apr 2021 14:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdF-0005oB-K2; Tue, 13 Apr 2021 14:03:09 +0000
Received: by outflank-mailman (input) for mailman id 109805;
 Tue, 13 Apr 2021 14:03:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdD-0005mn-J4
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:07 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7f60cad-cb01-4026-bd7d-e567c16b40d3;
 Tue, 13 Apr 2021 14:03:06 +0000 (UTC)
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
X-Inumbo-ID: f7f60cad-cb01-4026-bd7d-e567c16b40d3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=v1Ot1zwenjTIlLCkVwXbZOBCpx4o6Tu0RqBs8/jb2LM=;
  b=A2AJXdgsVdUB4SMGrBjvDYrKN3V0PC4OGZxOAHLsl0ml6v45jxIizgO1
   ck1FCJg2s/fnGPnpvq+JrYuRTJmxVHxabP5loVuBsOa9fe6KCWwOwKu6q
   VM8c+Kozdh8HorjeOhkPXRA37544gtaELZ0yG8yyC/C53UZlEJXTpfGdd
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pads+fZocMdfPralEkVdCc7+eesbHaD5+4FC2xyB8mMd1S6CbO6VG6cN1myxqGjknYh9iMTHl8
 Gwuw8Nzte7JcZezhsJwQ7iYj56iwLMJeF68nTXwooOJjZROUJbq4ORbUbb2W/BXLM7SUFhwv3W
 D8v/KZh8t14m6aCj6H55sbf9iIsMSDBqKO6rc4v1x8RezKC1QHuvap8jJqgcN2MDiM/aLKlMRi
 VkdWq7ECKJzzAm9wQz+uqWtdP8AjM1M8Ws4N/J867cl3IVpC80+qNh5Ceo+TUA2F9m+p5jrASd
 pDE=
X-SBRS: 5.2
X-MesageID: 41476537
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HGH8daGPqsBE/THqpLqFbZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQacjHJ
 2H6cZd4xamc3IbbsO0b0N1I9TrjdvNiZ7gfFo6FwcqgTP+8A+AxZzbN1yj3hkYWy5S2rtKyw
 b4uiHw+6nLiYDc9jbyzGnWhq4m+ufJ6twGP8CUj9hQFzOEsHfSWK1Ee5mv+A84u/uu7lFCqq
 i9nz4FM95o433cOkGZyCGdojXI6zol53/8xVLwuxKKyqaYNVFKefZpvo5XfgDU7EAtprhHod
 h29lmUqoZNClf4lDn9juK4Ji1CrFa+onYpjIco/htieLYZAYUhyLA3zQd+FZcNGz/C84Y3EO
 ViJ9G03ocpTXqqK1/epWVh29qqQzAaGQqHWFELvoiv3yFRh20R9TpV+OUv2lM7sL4tQZhN4O
 rJdoxuibF1V8cTKYZwHv0IT8ebAnHEKCi8f166EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5YnXRaQTOvNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEVlde6qfl3OLybZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/vkhXVajpd/KN53KuuTXfO27HsuuLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmzzlKgAVZTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9bKLPjmaWrmHmu8Q/zniFUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+3ebOBllTYfzHB
 REr1p6vYK7RqbgixwKOpaCCCa3nnETrHWFQ9M3gauY//rofZs+E9IBQ6x+FQLCEjRvggZ0oG
 J/aAsJL3WvVQ/GuOGAttg5Fevff95zjEOAOshPs0/Ssk2auIUSXHcBZiWvVsSWmA4qYDJRij
 RKgugiqYvFvQzqBXo0gew+PlEJTGiMGrpJAD6IY5hulqnxdBt9SnqLgjKmmwg+E1CahHk6ty
 jEF2m5aPvLCl1StjRj3qHm/EhdW0+dc0hzA0oK+rFVJCDjgDJewOWLbq283y+tcVME2PgaKy
 yASyAVOBlSy9e+0wO1lD6OGW49/IgnOvXQAd0YAvfu80LoDLfNubANHvdS8pogCcvntfUTV/
 mDPyCSNzH1BooSqnqoj0dgHBMxjnYqkfnlgkK4qEe52WMyGvrULhBNQaoBL9SV8mjjQLKp3f
 xC/KYIlNr1Fl+0TNiMjZzzRXpkDDj4pGatVeEmqZxOp8sJxfNONqiedQGN7W1N2RU1Edz9m0
 wfSplq+bypAP4bQ+UiPwZiumcznNuBLEEXohX7L+83c1YqlWLaNbqyks31gItqJkWAoQfqUG
 PvixF1zrPgXyGZ06QdBL91CWNKaFIk4HAKxpLJS6TgTCGrffpE5ly0LzuUd6JcUrGMHfE1og
 xh69+F28+ReCyQ4nGcgRJLZoZP+X2gW8W8HUalHvNJ6cWzPRC0uZSRifTDxQvfeH+ccEQXhY
 pMaEwWYIBis1AZ/fIK+xn3bLf2rEIjm0ZZ+hd9mDfWq9Gb3Fs=
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41476537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4E/0ncLbEbIkLHSD2QqM3yIsfsOLhM2+qSp4qUzcDBcRSaBBN+39IkVqlCDJlHtPmReY0NKy3oJ9YK7QijKfbwp7PeilRzPoDeolol/pMS30g5SRqfNan86l1MCkSamCCFwa6dVjQf7B7lh7NDAnaA6q4/8/a+AjoayjwFgZacF68G2iwBRgbO9yJFgBGaQQf31j5H6QfcgWZwridCa8FvMFu+URaRks6S26Nocaag3MRx45Nd2uECC3qYa8UmDpCucMr3PiSXkEe6Z0GjgWKcO5X3V6DUPD3Bbs2uVP62vdm5OrXpf9l2HgaxHWY+zUL1jS6bsZqruoEA93SbdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/ovcTNSHVs4ALtpeQdtZQbZnv807eSa9HwEL/5Y5Kk=;
 b=OIk8/JXv6dyo6+B4mwtv7mTTqqw/42zqXsvv6d1gJcF2QEnddLBbJLSgAxQDfzgo99Q7r9FjRo7y+5NQOTrJBBGjx3d6+/nB5S1gf1DwW1c8EYziis9owBVzhJXZB0yumXUvEbikYbUROu+qxfPyPJusMv4pMA+y+SQQLZXH/9bSm3OMLJtIANbH/tNzx74wVKZw/b0kBfI5KWZgjG+e+mut/9Qq6kE92GeF/XgGj5eNMIBn0ZVPamgZuDqAH9j9B8pZoP2HiedjIf6JccYZpBEikWFTMlNtuHunOIJmNLcU4HtNOf+9UDgOi9jyv9sTiT+uqC5Q4teJi3ayi2BhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/ovcTNSHVs4ALtpeQdtZQbZnv807eSa9HwEL/5Y5Kk=;
 b=HVDA1IQxW6jHGPa//4AWPRGfXRH4r5Q+Z0itqPBux3aiGYGsu2+dFmf6SFP3cX+yyZkbdGC0FYqAPPlf0yMGzL8+iS1PA9VM7FAzSzHjHqYIFyGJUutIQQWv2o5lKstyK/pyTOXg9nqBOy0xQmw4j3rQHOsK0gmVoU4CnUOl+kY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 12/21] libs/guest: allow updating a cpu policy CPUID data
Date: Tue, 13 Apr 2021 16:01:30 +0200
Message-ID: <20210413140140.73690-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56670b14-1ee3-446d-7d76-08d8fe84da9f
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB554238E9A1602DBCC58B98138F4F9@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /A+yBMfMTlSkgIzffQiwtQ+cno9/ymEUVjzpGxbYCpXtNmZTOhSxrtWpNh2FR5rFidfeQ17WcnFvxbZth4JgRh6dEkz3XecfuJcel41s3qBmjPxy+SvXqsJx5mCvNaoUvgfhauvJ7fBxdJVWV+jfPOSYjvnKjR0j0VdIb5nj40gDE9NbS0xzxdK6yr7TFf9IooSKtZvUgb6sYgHYth6ktPVZLsXGRY5cBBjV0FFo2KIUmNPk2uCclJ2vNqu2Rk5aLpBvbh0zyDLTVjmTgmUH7GBfkA1bS6miEjDy6qiT1YbBSpWXAjLNuuK1Fru9L1BkRs4uzlON5CjMqwMWy8qdOwIA2x9zMhYQFcd+L0AiZ4VnG3r7dJa7gCRyEOpInDKWrnPj/8eVXUh+JD10eXHmecqsPo9xaoxPB+bL5H6pXEBbmUFS0xXH5MB0LMOsbysobnAWtSrUM+LIu1uqnPHeZEmbIgQnUqYXQ+X6qTR0ml8VGuPTh/w+F0vAWAMAyampHqihb5576dDOi6zy+Aeyt12aGVlRWC0YG2XLSkfkAS512hS3S66xxk2BQkEft3KUFVuLCk+8tKGhUSyjlF9fnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(2906002)(6916009)(6486002)(36756003)(66946007)(54906003)(83380400001)(1076003)(6666004)(5660300002)(66476007)(316002)(66556008)(8936002)(478600001)(186003)(2616005)(16526019)(86362001)(6496006)(26005)(38100700002)(8676002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y3NlNVgwRXdNNDJBQWlpWU1DSGo4Y2JCMUdZZWVDK1ZtQjQrL0lvOFdWMCtx?=
 =?utf-8?B?eXhkQWpXTkJac0ZSZFRsKy8zQ2FkTUxUbElnVjBzY3JXVGJwVzJLTVdadWpP?=
 =?utf-8?B?UmVuQkxuV3M1RTJzVjdzN2IrRlFROTJhL2R3MW1mcmU0cXhYM1h2c0lzSGdW?=
 =?utf-8?B?M0hjNVM1TWZ0YXhQejR0SnhjZXhEdlVJSEk5WDZwL2JodTg5R1ZSU3Zkb2Iz?=
 =?utf-8?B?VkRHSUYxaFdNWlVDc1hSVGI3T2Vqc1pBNExtYldsYzY5MmFhWVpZVnhNWVN5?=
 =?utf-8?B?cUhmTTM2Z2Y5OVF2NDBxdkZYOXFrYk9CMGkrOCtFMkNaTlJSTG1vdys0U08v?=
 =?utf-8?B?M0xTUlMvNksvQy9sVTBjZXBBUjNZYklvSDdjRURXT1dPRDNSdlJkbCtXVGMz?=
 =?utf-8?B?Ti85UDVPd29XSVdRUXB4SHJGbzFPOU1pVWVFVmFWaDBKeGp2d3VsQk5NbmFT?=
 =?utf-8?B?bm5EbjFJQzZNdEhxZEVqcE5sVktmbzlLL1ZJMkFQZWJ3YUJPY3QyWFFySVBK?=
 =?utf-8?B?QkVUNHJESGwzejVPS1FSOHRadFhNdVZSWTcwRENIRlA3aExuYm5kdm9tY1ll?=
 =?utf-8?B?ODdqeWRrRWkyU0k5K2tWMlVrTys0d1FCbWNnVStMa1RKb1dYSXZ3WGNHbzRX?=
 =?utf-8?B?ZlhaUFM0YXJuRTlyclA2dUpUREpxOUtLMUpXY3pkUFZidHp3Nmd6aTlrbFpJ?=
 =?utf-8?B?ZGt3cEljZ2tpbnFwalhOVGhYZGRaQ0JNNFhzUjNlbFk2UWZEYStpaS9NODdP?=
 =?utf-8?B?SUhYV1BVdk40MW9tSXpmMGlqVm9wVFlENkt2dDFhZWhQSEdUcUcvT29lUFRa?=
 =?utf-8?B?NEFwZ3FMYnVSWkwyM1ZHUzdRWmlrUTVjUHo3V3RsVmxrL2duUDBCakd0a0hx?=
 =?utf-8?B?cUJ4N0pRRURoMTlqRDJPLy93NkZwdDVSeWRXUVl2bUdzcnU4L1lJWGRMWG40?=
 =?utf-8?B?V0tzSXp5U1dZNEIvYm9NV1ZmYUg1eVU2U2tMckNIU0Zzb0JtcGRmclVOeUFJ?=
 =?utf-8?B?VjUvM0NzbGxEY1RSbnRKK1VtT3FmYjFBWThEdFR3UGRLaEs3N3MwU2xzd2tq?=
 =?utf-8?B?UVIyNXNyaU4rcDR5L1NPSkZvbG5XK0RHSG5sMDFaa1V3clhWSGtYRG1aY1JO?=
 =?utf-8?B?YmRsUWNDNW9LN056SlMwOGFqQ2NobVI2TmRFSEdDVlV4a2ZvQnM1emV2TDNn?=
 =?utf-8?B?Titrb1Q5bGE1SmQ5VFREWGtBNDBDbllRdENLWFNKbU1oNDdzWDZYMHpRc2hz?=
 =?utf-8?B?NDBGVVY0MmNyVThiZnowLy9HaVlPY1dHaHdKM3cvc1NubkJxVHZBYlkzaWNR?=
 =?utf-8?B?UUI3Ylg4N2tJUlM4UWR5LytuMTNTQy9DNEtPem0zWEhqQm05Z2QzYWg5alVv?=
 =?utf-8?B?dDVtd3pGN1ExODE0cldTaUtNZlZOelpCVXlIL2pJWExadG1JVk1mNERuY2oy?=
 =?utf-8?B?T3pvT0d6NmZwalhLOS9ydm1NMGtxQkhuQWMxRTJjeW5BVlVybWlNWk1MNnI1?=
 =?utf-8?B?RTVFWVV5TTNUU2dWU0lrZU53VEtGelpDNUhXRkUzMkgvb0RhZDRzckZISTJ3?=
 =?utf-8?B?aFdEdXZ2K3NMb2dTbE1Vdmt2WjY0UjBpRDF2UE5DakYxU0xLdW55dEZDckpo?=
 =?utf-8?B?WWU2cHFibElndDIzNllQM3h6TVBmNzQ0NEVGZkh2ODBONXprczBGSFNYOTk3?=
 =?utf-8?B?WHBXOFh2ckVDaGZZbU9wU0hCVzcyQXZkQ3J1bHFjeThaMGxWczZMdUhBcWhv?=
 =?utf-8?Q?HaQBj24WK2vAG0cF3zTPbxa0O6uSXJ+AUpyvoVk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56670b14-1ee3-446d-7d76-08d8fe84da9f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:03.1964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jCtZfcposT+YiT2kwGKWYqN47kFkSdwv5TqDKGHQOsL0OJsZe52Zqi+PXu3HCL4fSL0gswaG/S/fIZDW6FdYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

Introduce a helper to update the CPUID policy using an array of
xen_cpuid_leaf_t entries. Note the leaves present in the input
xen_cpuid_leaf_t array will replace any existing leaves on the policy.

No user of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Don't use memcpy.
 - Drop logic to update the leaf manually - x86_cpuid_copy_from_buffer
   already does it.
 - Only print a failure message if err_leaf != -1.
---
 tools/include/xenctrl.h         |  3 +++
 tools/libs/guest/xg_cpuid_x86.c | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 605c632cf30..49f919f16a7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2613,6 +2613,9 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
                             xen_cpuid_leaf_t *out);
 int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
                           uint32_t msr, xen_msr_entry_t *out);
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index a4307d50ddb..00595e14cc3 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -887,3 +887,23 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
     *out = *tmp;
     return 0;
 }
+
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr)
+{
+    unsigned int err_leaf = -1, err_subleaf = -1;
+    int rc = x86_cpuid_copy_from_buffer(&policy->cpuid, leaves, nr,
+                                        &err_leaf, &err_subleaf);
+
+    if ( rc )
+    {
+        if ( err_leaf != -1 )
+            ERROR("Failed to update CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
+                  err_leaf, err_subleaf, -rc, strerror(-rc));
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
-- 
2.30.1


