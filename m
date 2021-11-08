Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D144818D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 15:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223374.386053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5Z3-0006X6-7H; Mon, 08 Nov 2021 14:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223374.386053; Mon, 08 Nov 2021 14:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk5Z3-0006VH-3H; Mon, 08 Nov 2021 14:24:01 +0000
Received: by outflank-mailman (input) for mailman id 223374;
 Mon, 08 Nov 2021 14:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d70C=P3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mk5Z1-0006V9-UW
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 14:24:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 817b5bb1-409f-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 15:23:57 +0100 (CET)
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
X-Inumbo-ID: 817b5bb1-409f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636381437;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Iji4T6z2svb/NdahizqHAMB1kHTMa0IsEBVT063TISI=;
  b=LTZMAI5rcKUmku3uasHO6OgajmkTlu/h7c6mdNX2o4PgNcVHzsQnPl91
   THBf6xHQn8ghl1tuQi9lDMTrmx2XIXqS5zp1OK5nWANTlVyxJh4cTUGCf
   iUxxqcvb034x0+FWwWfJhHicfA8Bs7sgAx03C20kMZXvweF5vaO1C48iC
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cb61RG6maJ/nlqROdZjWA4RsP8R6krg0e2kQeC5uGmXQ+Gj7QC2kAYxSM96bnicbLOiSsqfYT1
 MAvrMA73WJGJP83SKTWmVErf97l1QGicfdt7s/rvYX+ZuFICK7R+tKlFQn3hOCJI0cp3dVHphR
 KBpoDe4W3YEmSLLdbQQRLoZGdKiOBuf6jjn8Dx4YCjHxGKdj7oGxIKxcVHy7iMQ25kZ5oYwctk
 qYbVosezmcwRDJ+RyyIPSu/zBsypprkojkXHmdCJi1zkw64hzZDuCDccdrV5kP7quMbYfO04SC
 yuEXTGbUy/LEPYqdKpa3Ma1g
X-SBRS: 5.1
X-MesageID: 59258297
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xiyxHqC7Vb6dGBVW/zDlw5YqxClBgxIJ4kV8jS/XYbTApDoi1GcCz
 DQeXzyDP6yKY2WhLt0kO4219U0DuZ6AnNc2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540UI7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kQfWh9R/+
 PR38sK6GB90PYDNkqciTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvSQuI8CjWhYasZmHa78a
 fEYcDtWXDfMfwVFJEwsKck3pbL97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibexPgkudk
 UfX8G34Dw8yOcSWzHyO9XfEruXChz/hUYQeUrix7Od3gUa7z3YWThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYGUtpNF6sh6QeCyoLd+QPfDW8BJhZ/b9ghuN4zVCYd/
 FaDlNP0BhRiqLSQD3ma89+8rzm/JCwUJm8qfjIfQE0O5NyLiKY3gxHUR9BvCpmciNHvBCrwy
 DCHqis5r7gLhMtN3KK+lXjFnjatq57hXgMzoALNUQqNyQd0Z5WsYYCy3mTK9vZLLIufTV6ps
 WANno6V6+VmJYqWiCWHTeEJHbeoz/WIKjvRhRhoBZZJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkRlju4dXMkuLV+gpadOpVscHzKKjKsuwA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3yVChHUMyL2BLzHr5AiuFzmkjS0EuKHcijpylLx4Zyc5J8pV0tFFKVJt4046qfyOk+2
 4YObpDao/mzvQCXX8U2zWLxBQ1SRZTYLcqvwyCySgJkClA3cFzN89eLndscl3VNxsy5bNvg8
 HCnQVN/w1Hin3DBIgjiQik9M+20BM8m8S5rY3BE0bOUN58LO9fH0UviX8FvIelPGBJLlKYco
 wY5lzWoXa0UF2WvF8U1Zpjhto1yHClHdirVVxdJlAMXJsY6LySQo4eMVlK2qEEmU3rm3eNj8
 ubI/l6KHvI+q/FKUZ++hASHlAjq4xDwWYtaAiP1HzWkUB+1qNk1enCh15fa4agkcH3++9dT7
 C7PaT8wrujRuY4ltt7PgKGPtYCyFOViWEFdGgHmAXyebEE2J0Kvnt1NVvimZzfYWD+m8amuf
 7wNnfr9LOcGjBBBtI8lS+Rnyqc35t3Oob5Gz1s7QCWXPgrzUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SIupOiHXExeMgOikitYKLcpYoopz
 f144Jwd6hCliwpsOdGD13gG+2OJJ30GcqMmqpBFX9O71lt1kglPOMWOBDX37ZeDb8R3HnMre
 jLE1rDfg7l8x1bZdyZhH3b6wucA148FvwpHzQFeKg3RyMbFnPI+wDZY7S8zElZO1hxC3u9+Z
 jprOklyKfnc9jtknpEeDWWlGgUHDxyF4E3hjVAOkTSBHUWvU2XMKkw7OPqMox9Foz4NIGAD8
 eHK0nvhXBbrYNr1j3k7VkNSovD+ScB8q1/Zk8e9EsXZR5Q3bFIJWEN1ibbkf/c/Pf4MuQ==
IronPort-HdrOrdr: A9a23:ijNOaaxz6hbLXM7p7tTYKrPxyOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WBxB8bYYOCCggWVxe5ZnOnfKlHbakjDH6tmpN
 pdmstFeaPN5DpB/L/HCWCDer5Kqrn3k9HYuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.87,218,1631592000"; 
   d="scan'208";a="59258297"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+zNnVMaN9oWUJCesvCIjxLxI5R/Bl5PVXt/Q6rOgeqvKhznjJfWK8IXuTbkQ+EO7jCmKv//+kz8MPYSaxB6/sq8EpqL/k7uLN+hOvekvil+9kY5iZ1bcXvMWQ/dYz7/vlMba0k66rHMV6N2QjeH5Ch8RzE2ygVNF/rPWX68NYczcvPhDJQ0Kfw2aW7wsDhvERuKZk6q17Mxt0v9BI6J2yBeFS5PcVVuO6QBkg5cS9+y+QfQJYOcRYYFow0PI52F1g5majUPQzmYonvbmlRT1gg0umL0cWxw8qKbbWMc/H/RWPGoJ6v6OJRR3iKTELxy4QYpxPcBm/c9H6lPvTHVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSu6tFoMXOq2G4LXBocxdp36pScLVF2ALjbM/o5dKCk=;
 b=GnHSIGuBZmabq9rvib3MjYdX+EYXWrPgWg9Z51EkAIUdE4pu76XgVk/iji8aZtjNK61uHax2pfURbV/iRM3FnmlypeYylsHP2TFB8B6JUUqX4MP1CdcPz9dpWAFliZZ7wfTDapQGWjRbo/1eLAbQmOVhgY3Sp6019Ve4OyrxnZ9CThkT+xelQ0SMkBhq4GTlPex8K9+xFexyerY3nD0sM/4LdUw8h8e6JSR6NA0uj5qGl+BD9FpHb7JXGOYLVqp0mClkfhDZMwUCHZ0ynkEIg16+XXiFfssV28Gl+k7NLhfWugxtih8nPxvAfa+PX8z0vCe4OzKHDdVpG+J+wrX6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSu6tFoMXOq2G4LXBocxdp36pScLVF2ALjbM/o5dKCk=;
 b=DamsLh0KG/EjDP2qBVE8t3Ol+s6imm7VR83pg/Yvggi8u2W1kFU/InnVNgjhGCyJXhUP3/WtNWTp+a5vqriFDx80tePucvpZxS18ULjXHKWm/SiKf0e/G/oRZDURVbwhoRbtmd3fTpJLbaAZfMVtpFXf489b0gHXhnK22rOljns=
Date: Mon, 8 Nov 2021 15:23:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for
 guests
Message-ID: <YYky9JSe9oMh5azh@Air-de-Roger>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-12-andr2000@gmail.com>
 <da36ee68-3162-0a32-f033-98af34f9c94e@suse.com>
 <c05b3e98-772c-a8c7-d8f8-841289683a02@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c05b3e98-772c-a8c7-d8f8-841289683a02@epam.com>
X-ClientProxiedBy: MR2P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84ed1311-4bcc-453c-332b-08d9a2c36401
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-Microsoft-Antispam-PRVS: <DM4PR03MB609628B516AB048763AB24DF8F919@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V19qGVw9dWPPUZRxPF5AC+Q9kVM+zmh/kLnfqVEEaOAHkp8lgGq8tKPfA5Ry0n+bbKuogGssBbyOKYqu83vIY5tXT7+Vyn7pGXnE+6KJFjWcpGtIxvXcFOTTYgSHv1JTjsn5M1HNxkadmlTinxuMPmUnjJdeHt14B50d8hGlXu4kHQ1HT2kxL+MGhPGtmPaXlrGDRC0pDbkS6YO1P2L2MAK4DDS2HzuMqBoCeosoCIvsry+p1LwH2CVW2jnSBUEXDT6av/1gl6y6An9Z95Ev+MaNPqtwIUC4zvl+ivu5qAugRiEGQL8YSblVyzGp35Cuy/bJ6CPn1ZbKdVV22FaePEF4vbXhfL+bxG392yfwIjS/J9+7IoNE0PUYVK5twgMasskQ2QTr9XDR9GwY8oHTEhsc4FubawH/KAvj39e2WjvYaEUiDYaR7aTG5hfr5Jg9SnFYWR6yoBeCBK6h3o8d0TODsCH/VdJt7QIot6LibhVZwy3k5W+rC8oLT4ctmg4gVZ7SlKdWE+s1abBfmthHIdAHuFeilz1pVGN3U+ZVzakzTTytT1C6m7xIB6SA+JH97fw8ZzwumLbNc58mDiH5wcAzjE5KlCgy3hAbLqUExw/jNC3uTX8kK0l0IZKBhH9tDfd1R96DhQxNTqf52szXiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(8936002)(26005)(82960400001)(83380400001)(54906003)(6496006)(5660300002)(8676002)(9686003)(6666004)(6916009)(186003)(316002)(86362001)(508600001)(956004)(38100700002)(53546011)(85182001)(4326008)(7416002)(6486002)(33716001)(2906002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHcxaHBlSDBrbUJVdDl5NE9Sb3l5NUpEUjJMckVvNmxsSVNqVWh6RnI5WXlC?=
 =?utf-8?B?UDVtTnBOOS8zTTBjZ25wOVBoZjhVdGU0RUdlVWViZUxmWDZVL0xRTTk5N3ZQ?=
 =?utf-8?B?bzlGNVljcFpKNXVYcWhIZmVnekhJZnlxNEpJQzVpamhEMFJlZVpNL1BWd3hN?=
 =?utf-8?B?L3IzKzhDOGloeG4zZWtubWVhMUVXRnhoRkhCNGxQbGszWmZ5L2dQNHJVQUxu?=
 =?utf-8?B?SjJ2aTFrck9RellCSnorcFdiL2crVm5kY294aXZtNU5DVjQzSE12WG1aWXpr?=
 =?utf-8?B?MHlSTHo3cGV1cVJVNzRwUzk3Wmxtb0xzQjQ2QVJXL3NkS3QvUFMvNllKTHZy?=
 =?utf-8?B?TzlSMjR6UUhPT2daTHRYeURPNWRLaXFXOEtDckhUVXdZRWhlUURJTktqOXV3?=
 =?utf-8?B?Z0VabFZ5aytpMnNwSThhelk4L3FhcWdpQ3pseVdPWmhsVndCWjhxdEhMNTYw?=
 =?utf-8?B?M1VuSzRPbFdCa2NTemVBeW82VE9qcEYwRUg0REFhNFBSRUtuVWNJQ2pjL0RO?=
 =?utf-8?B?cVRyMUVZSW5FUkd2Z0VsMVJqUWJUTGttS2k5bTBCUFljZG1Kdk9tcGRuam93?=
 =?utf-8?B?VUxIOEh4MTlPWkswZjRYc2F4cDl1WmlKQUx0bnBmMlBPWXB4VVVWc3R2bjFt?=
 =?utf-8?B?ZUw1UmVqTXYyM2o4eVJwbjQ0OVFWdWUxRDNvTDB4N2FPRDdlNDZ1eVhrUHNF?=
 =?utf-8?B?RGo0YVFYRjRDNnNkVWtGMjRQcDNhM2JCM2srSXVkTjI5TjhtS2w5UXZGNDR3?=
 =?utf-8?B?bGhvUWNYbDA4d1hqVWtudGxMNlF6MVE3ZWZXak1nZ0JYRlh1eUh6NFdzcG1L?=
 =?utf-8?B?VjByN1hvb1R0ZngxcFYvdnoyYkpUZk9VcmU2clZmQlFmZkJlY05LdnhlUHY5?=
 =?utf-8?B?dXlkK3FZRk51aHJPZnNQbzFrU09OMjV3Y3JPbFd1dHArK1JQY1YxcEE0VUg2?=
 =?utf-8?B?eTBmQk1PbTF1b29vVTdsWFdYeEVybkE4NkRDWjZKck9Ebm5lYkM3NVQ0NitM?=
 =?utf-8?B?SDlxaUY3VnVCcUxYbE9SbTRUc3Z1SUJUNTVhRTM4b0pIRUg2M1QwaDVBVzQ5?=
 =?utf-8?B?Q1o2YnJWNDZNTVlOblI2MVdhakpJaWRWOUQrK0MrTkkwNlBCZnJEMmtiY2ZH?=
 =?utf-8?B?VkYwK3dHUDFxcVMyd1pGdFhMb3ArOEpWSHg5SzFpS2dvQTFMUTFlL01peWls?=
 =?utf-8?B?RUl3OXZPWlVDVXZ2QnNoMHpaYlRoVnFEMkRmK0JTMGM5citubG1EUFpFbWR5?=
 =?utf-8?B?Lzl3NXVvMkg1QW42YnpZaXoraFJkb0tGakE2bUk5VzJ5aGhFQ0NsOER2SFpu?=
 =?utf-8?B?d3A0SkYrcnowS2VaVzdmYWRKNm5jdGFIRUk2SWw2THdOWjZQUDFmMUJMcW9R?=
 =?utf-8?B?QUp0Tld5Nng2emhvOTN4bkowV1hFQU51Qi92RUpDeks0bGFUY094TU13aFdm?=
 =?utf-8?B?NDhwUjN5cks0STFZZVB0MVBvbDFGOEJtZVNnWFM5bVBHZjcyMGd5NVVRZzhS?=
 =?utf-8?B?alZWWTlndWkyOEdVQW92SDZPa054T2JJcUJkYzluREZSLzZ4dUlvbUxaM2xN?=
 =?utf-8?B?c2toRHlEd0x0UlFPOHd3aDVSSHYvVVJvWVhMQ0dQZjB6ekwvTU9GWXp0Ykxj?=
 =?utf-8?B?c2UvSlZlUDZjREVYbDRscVJ3TWFVNXpUdDc4aEZEa3FSSzhYaCtmd0Y2Tyt2?=
 =?utf-8?B?anBZY2I3cXd4NWdIMEFKMkxHOGFIQUwrOWFINmJkL2UyR2xYZThFZWp5VVZB?=
 =?utf-8?B?Zk15RkRLSDRPT1JwYkR2NUhaa3laQTRnMnk1VXdOaFJSWis5STNxcEZYa3hC?=
 =?utf-8?B?L2oyaysxVmNORkFQcmszbzBnQkh5SVpBR1d0ZGlPZjJWNi9hVm9KREFnY1Jm?=
 =?utf-8?B?REFMMmVpeXFXWHZYeEYvOGtVQUh4MjJEb3Viemp1dTRiNTBoblVJTVREZkxn?=
 =?utf-8?B?TWxDT2hFanRkbXhvOVVpWFhFamxvRGd6MzQveUJXOXY4aTZpOURVQ3hvTk5B?=
 =?utf-8?B?dzFLa0tpMUxSb2NPUHdnaWErRlpweSswMGg4NmN1d1dqdnFtUEhnaTlYYVJT?=
 =?utf-8?B?WG01U3cvTnBWVXdTeWgzcFY5OGh4OXdiN3Y0cnRWbmlSc0NOOTQxVk9BOWVm?=
 =?utf-8?B?QksxZThlN1BXbWY0YmVpQldqYmc2cm5wNy9oNVlBSEVqYyttZytTWlNucVpt?=
 =?utf-8?Q?HnBORrMQjsG1sPUB8D2Iu5g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ed1311-4bcc-453c-332b-08d9a2c36401
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 14:23:53.0973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuE2JJZbt0bhnkLZ7HFnVRdBiOtNwbZnva87RmZ9oH5EZGdEMgifExCYiSK7HwI3xaQ0BBP0QBDdXMJksMNH8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

On Mon, Nov 08, 2021 at 11:16:42AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 08.11.21 13:10, Jan Beulich wrote:
> > On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> >> --- a/xen/arch/arm/vpci.c
> >> +++ b/xen/arch/arm/vpci.c
> >> @@ -41,6 +41,15 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> >>       /* data is needed to prevent a pointer cast on 32bit */
> >>       unsigned long data;
> >>   
> >> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >> +    /*
> >> +     * For the passed through devices we need to map their virtual SBDF
> >> +     * to the physical PCI device being passed through.
> >> +     */
> >> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> >> +            return 1;
> > Nit: Indentation.
> Ouch, sure
> >
> >> @@ -59,6 +68,15 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> >>       struct pci_host_bridge *bridge = p;
> >>       pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> >>   
> >> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >> +    /*
> >> +     * For the passed through devices we need to map their virtual SBDF
> >> +     * to the physical PCI device being passed through.
> >> +     */
> >> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> >> +            return 1;
> > Again.
> Will fix
> >
> >> @@ -172,10 +175,37 @@ REGISTER_VPCI_INIT(vpci_add_virtual_device, VPCI_PRIORITY_MIDDLE);
> >>   static void vpci_remove_virtual_device(struct domain *d,
> >>                                          const struct pci_dev *pdev)
> >>   {
> >> +    ASSERT(pcidevs_locked());
> >> +
> >>       clear_bit(pdev->vpci->guest_sbdf.dev, &d->vpci_dev_assigned_map);
> >>       pdev->vpci->guest_sbdf.sbdf = ~0;
> >>   }
> >>   
> >> +/*
> >> + * Find the physical device which is mapped to the virtual device
> >> + * and translate virtual SBDF to the physical one.
> >> + */
> >> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
> > const struct domain *d ?
> Will change
> >
> >> +{
> >> +    const struct pci_dev *pdev;
> >> +    bool found = false;
> >> +
> >> +    pcidevs_lock();
> >> +    for_each_pdev( d, pdev )
> >> +    {
> >> +        if ( pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf )
> >> +        {
> >> +            /* Replace virtual SBDF with the physical one. */
> >> +            *sbdf = pdev->sbdf;
> >> +            found = true;
> >> +            break;
> >> +        }
> >> +    }
> >> +    pcidevs_unlock();
> > I think the description wants to at least mention that in principle
> > this is too coarse grained a lock, providing justification for why
> > it is deemed good enough nevertheless. (Personally, as expressed
> > before, I don't think the lock should be used here, but as long as
> > Roger agrees with you, you're fine.)
> Yes, makes sense

Seeing as we don't take the lock in vpci_{read,write} I'm not sure we
need it here either then.

Since on Arm you will add devices to the guest at runtime (ie: while
there could already be PCI accesses), have you seen issues with not
taking the lock here?

I think the whole pcidevs locking needs to be clarified, as it's
currently a mess. If you want to take it here that's fine, but overall
there are issues in other places that would make removing a device at
runtime not reliable.

Thanks, Roger.

