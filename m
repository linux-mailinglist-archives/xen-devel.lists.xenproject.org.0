Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205C462D979
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 12:36:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445130.700183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovdB1-0001ln-JP; Thu, 17 Nov 2022 11:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445130.700183; Thu, 17 Nov 2022 11:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovdB1-0001jc-Fe; Thu, 17 Nov 2022 11:35:27 +0000
Received: by outflank-mailman (input) for mailman id 445130;
 Thu, 17 Nov 2022 11:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovdB0-0001jW-JK
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 11:35:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6b65580-666b-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 12:35:15 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Nov 2022 06:35:16 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6873.namprd03.prod.outlook.com (2603:10b6:a03:438::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 11:35:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 11:35:13 +0000
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
X-Inumbo-ID: e6b65580-666b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668684924;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZSaoL3foRwDHJ84aHiU2WU2nhqVi4vluKK2+KvEBuUo=;
  b=JTjgl4sD6LbE1SUgGVUccpP7NB+EG7jVkPNqiYYrjXkTOr4rWxwT24qQ
   GAlLvVC8lEmPS9uKh7IQJWRcbmqMF2h+TKvgwQRAsRzvxYEF+DCxTuV0Y
   mVH8lZPhEPhN9CjLjlASrbL0/pKT1ytb75MTvkJk39JEa9X3KqHNH7haU
   I=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 84603650
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+Hkk+6ry4GaVDU2wucsjAgNUwxdeBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBmHa6qMNGf0etwnaYu1/B5SvsPVn4RlHQY6rC42HnhG+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHziZNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA0GPxHYuM6/+4ucSNV1h/8HJZfPEIxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWKEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXoqqAy2wPOngT/DjUnc0rrseTginKlfMwYB
 RQ3vTUCtpELoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2gheRSN9mSfexloesRm62x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:o1KPBKnpSVWxlcQg0Sn3uWDmwanpDfMEiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdh11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtlqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWDHAcEcYa
 xT5fPnlbFrmGChHjbkV65UsYWRt0EIb1O7q445y5SoOnZt7StEJgAjtbEidz87he4Aot9/lq
 T52+1T5c9zpoV9V9MDOM4RBcSwEWDDWhTKLSabJknmDrgOPzbXp4fw+6hd3pDiRHUk9upEpH
 36aiIviUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDAlGqbrqn9wPRsnAH/
 qjMpNfBPHuaWPoBIZSxgX7H51fM2MXXsEZsssyH1iOvsXIIIv3sfGzSoeaGJP9VTI/Hm/vCH
 oKWzb+YM1G80CwQ3f9xAPcXnv8E3aPia6Y0JKqitT75LJ9RbGk6DJl+GhRzvv7WQFqo+gxYF
 Z0Jq/hn+eyuXS2lFy4nVlUBg==
X-IronPort-AV: E=Sophos;i="5.96,171,1665460800"; 
   d="scan'208";a="84603650"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ezp230hIbmlqW5vT6ku98JfkKEXeenfSmcTQH+VGFi0qBcrI71MqQmaIZ3rik/KH/VLNaX4F3Ie8EPOxNSlqx1E9pJjmzcfvWWXgY7G2Wu+EI2sohjHY+O/2GUHr4MIg6uNwOOUAMvfYNI3dGwA7efZU5G3R3q/oKKEID1DlODz8fheA0Lffqrz+QQO8O/7rHh+3bbwb2Vcr3EVM7rRo3Gk37xg+XMPSXxboSDyCxotve9eeVmhc52BAO0yDYxg5Z6m1hw2Np8mSgCA43HdRLZ33M7MgQ0SPYoxOPdFTLItvOFbMZ0K5HKK3ivm2zNpLUfukBJGeveudfJFm8hmUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSaoL3foRwDHJ84aHiU2WU2nhqVi4vluKK2+KvEBuUo=;
 b=HVDJbscpWISEtRs+kg70XDV3zBcxdB+Qu6dgfDFgGakuVq3A7R6zdMF4xx96a3LNAUTKTf0ynbzeVOvLI1oMPZ6IHqY2GWgxwYFdNImIuljlJKcK0zN7blCQrNYimJ/z+7qMUxi/zMBqfSpmeTMlpntjw7gCDO4zz+8Pj7ycm7iUlXU154il4IWpthoHabfnpMxZ9+O40AvMEC0+YNVrtDj0OVw5DArmNuXP64kAlnnYSDSatpyrfk4Bd9DvCJl4XW6UbhU3cmQe1QipdIOND96eC2D2Bmgl44oNe93Yev9qzRzWJ9P7pnI+g3wTpqYSlNLT9xzJnV/GNm6U5nop/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSaoL3foRwDHJ84aHiU2WU2nhqVi4vluKK2+KvEBuUo=;
 b=ufA8yvxPOLPfytHO1ceJZlx2rgTp/ZDQX4jdvUcYsoBHVi+4QF7z1aMXCG/D6w7dgW421O8YhLVQzXr2jSS+OsFH1KIr8Z7C9JtdGPQfySPgxu97vcjEVCebWj16JTbYG5YUtocYwrtAAM02ETSz0HwW4e2zt9oxYU52TVt7WUo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures to
 dom0
Thread-Topic: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures
 to dom0
Thread-Index: AQHY+dppI/YDqtuG9Eua4T+BrggU9K5C2fmAgAAjooA=
Date: Thu, 17 Nov 2022 11:35:13 +0000
Message-ID: <0a5fd907-a822-4ea5-5f5e-4cbe8ec2816a@citrix.com>
References: <20221116164216.7220-1-roger.pau@citrix.com>
 <9b559146-11d8-f848-d6fa-baed7e0fa06f@suse.com>
In-Reply-To: <9b559146-11d8-f848-d6fa-baed7e0fa06f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6873:EE_
x-ms-office365-filtering-correlation-id: 24893500-a086-44dd-5efa-08dac88fcb11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vbg8VdknIj9UTdTk+IH9jm/Red35Zxs5S5T5B8//TsFi+L9XO/RZmbPaJ1Ty9QyzzJF2GctRxPB0Yd6xJf/lcQAS+etRzqHSn4VzWlqExDLyWP6mEJSV0GITQ3yJ49BY8qw7CRtNr9KvDDVUrOAPiNtN1FZOoBQPjLUk0n4YUmLBYVsYPXgvAwOiS32L3dqcAJZfZO/uzXOOY3rnLAnmsOkX17OV8+m+W+p5RZG9gKytpXA1RgvYupZwBHF1s71OXsB4HENOjIKEpYMzpx+bEp7wI2/vWW5zA4vwYLsP6ss7gutA5jbkt5xYhu7CAfYRpUOmy6z1wDcs09fpYKE8n4FFtCU0YO3Iiw/K/uoififGuHMbqbceh5NmCUWSbcMLYZ7B+g50JFvt12kqKFv9p00z7G/m17RPpXOa6/yu9MOEzvPZsQgKSWYqqjgB4919D2rt/5VMVfp6IHrroNLdAWnR15G7UpNiV8QgyIqvWkfijpQ/5258h4M97Psk+PUEb/hZcVLkTPr/kkVKTa5ZR+5iqbE18YXmqUZurOoWur2o0uWQ7YlEGpl7w78YPMLGZ2+NoEydpiy2w33kveqIEuzrXhlbnhxP2PVnXyPC5w/KVWG7YcZLgYcmFqHYckaf8kA4P0RkXqczQh/AwxCDRITbmvdKlVO7MK5dwhW7VIrUZjdZuzSQL3x0n9m79gJR7oVKdV93ti36iF4sVwY40G0e7Yk/T45Z5frnUbT14799XwkM+Z9UepcC/hcZr9Tz4Wzq/LPmg+sPcZ5qmA/tIg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(122000001)(83380400001)(31696002)(86362001)(38100700002)(82960400001)(8936002)(38070700005)(2906002)(4326008)(41300700001)(64756008)(66446008)(5660300002)(66946007)(66476007)(6512007)(71200400001)(26005)(6506007)(53546011)(2616005)(186003)(76116006)(91956017)(54906003)(316002)(8676002)(6636002)(478600001)(6486002)(66556008)(110136005)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjlJTlJaU2xDR2N0RnJ1T0Y3ZWw5STkrVWxiU0FYWkRlRURmK3dtdS9WNGRk?=
 =?utf-8?B?VWNwVFZPSnZZaHdCN2tXd2dUY0FxV1lCNnJZTUlNMFB5czdIVW1jZFdvdjY1?=
 =?utf-8?B?cjdZRUtOdVI0T0taak54R0NBSnR1VXZPMWZQT1I3NzROckNCZFN1UzVMSFJV?=
 =?utf-8?B?aGNkVFl5MHduK0YrZk16UXZRR04rTHdMWFMrbExwd04xN2NGOGtLVk9LYXJQ?=
 =?utf-8?B?ZnkzRS8xcFdvb0NiRFhOcGY2MllkUS9wSGd4a2NERHBkbzJkODNLcXJWSkxF?=
 =?utf-8?B?eXdHRkRJY2ZaTDlwLzJEc05rcGdaWnptWWxObTlTblZ4R1BSeXdDazNSZ3h2?=
 =?utf-8?B?MDNHYVJtbzI0NWFwcmV2T1hkYU03STVpS0djWi94UDZ1SHRSaW9XTnpMRlZk?=
 =?utf-8?B?MDlsY2YyWFN5MnVtdElrMFlNcXJDMXlNL24yREJIZVlXY20zb3pJaEpGUlZI?=
 =?utf-8?B?d1BJbWdrRnpUNUlhQkZqM2tpZVNZVmpzVWFaWWVjQTFkT1dzTVN2OUhyaEJy?=
 =?utf-8?B?M1hmbnJMVzVtZGNyMGJnemZ6VUZJZTBEaEwxWHVTMlRtcDd0QUVLT3BiQ3p5?=
 =?utf-8?B?SlJjY2xHc2ZFOGdzMFpVbER4WjhkSWdtb2NYL1NJZE1nSjFPM3JidW1hZUd6?=
 =?utf-8?B?UmMwQXVQblZVWVV5SWFlR0VQc1JJcHhlT1FDYW9OaUZkQkR2RWtFUE5MS3VR?=
 =?utf-8?B?R0ljMzgrZ3pzTHRtd0NXcTNVc3VlWkQ3RWZRTW1mZVhxMTl5Zm9pZzZkMWxK?=
 =?utf-8?B?bUdFbURzbkEwRXdoRzg0SmdBRk1hNzJId0owZHpxQVA1MkxOQThXMThsUkFE?=
 =?utf-8?B?ZTAreHFHdTRpZE1SUjNnN1g3S1NmMUgwVnlhZG02RkhSdjkvK0syNFB4eXVV?=
 =?utf-8?B?clhRbTZaNUt3aDU0Z1FmZkM1VjI5V0sxVGdHckNRTzFSeTN4bk1TdWJHMGda?=
 =?utf-8?B?cEV2YlNJc3lMZXpJRXlPei9BRG1ud2MyYlRyWjFmZVUvaUJzZC8rRmxpbkx4?=
 =?utf-8?B?R0ZvakZrRCtXZnphdDRGcU1KSldCQVpQQXBueGtjT2FFNytLamhhN0ZRc1NB?=
 =?utf-8?B?NmZRcnUzc1RoOHoyeFdWWjBGMTRZTlFCUDR5c1JqYlBCUVNGcHF6b0JOVSth?=
 =?utf-8?B?eG9jQzZuWXdhcmxxUmloOU9mV3NiSjJOVkJ5dmt3aTZvSFBFQWdGSmhqTkxW?=
 =?utf-8?B?WUV5eFU1Y2RacXg2a3FDK1FDczg2MDdpWDk4UU1rZVA3UzBSd0h2VVFLR2lQ?=
 =?utf-8?B?ZnpBd1N5MTEvYVVYdE0xZDFmMlBFMExQbytsd1Y5MjJQNW81T24rVGFGSVVF?=
 =?utf-8?B?VWFMQjZqUDdOYTdlbkw5aDZYeUI3ZjR1QlBzU2dxUHBScVlQTkdHNXNNOU81?=
 =?utf-8?B?MFd3YllhQlZDRlhwUGFlSFR0TXdjSERWVHVqL0tzSmhBQXZCMkJsVDFQYWxr?=
 =?utf-8?B?Q3NmOHAvYU1qZkdOWURiaThoZFZmckprREhpd2JZVjJFcGhlSmJoaHFZK3VR?=
 =?utf-8?B?YlYzWkYxcWd1cEdHZDJvd1BkNkgxYlhIaEl6Q1RibEpBSDdjdUViTXRzZy83?=
 =?utf-8?B?SDZnTWxGVE5iNDU3K2dZT1BmbmExdCtnV1M4cjMwcDBHTXdpaXhaTmROZEpN?=
 =?utf-8?B?dDV2Wk1IdUJBNTI5OGRQeEY1LzN3REtoTEhQRWI2ZENaaWpKbnVLMkg4UUNh?=
 =?utf-8?B?Tk9rOHJLdFI4dUFoMlJhZXMxL0R4RUZWN1RTcTZGdUlWeDVISVh2M1RPRGdm?=
 =?utf-8?B?U1czREpVTjh1Uy93MWF3bVZEVm5qZUdUZzhFYVE3QzN1UVJjNFV6TzY3TVpx?=
 =?utf-8?B?WnJyNU8xRGlDSzEyVGJnb1BQeGVlZ09USFU0SGg5ajNqeXNOTnUvM3E4Mko4?=
 =?utf-8?B?Q2I4cFlBcjJicEdoU01XZlVqTjRMNWxNVCtnblNWSVVxUitNUURKalpCMmht?=
 =?utf-8?B?MndXQkNqYk9laWtPL3BnL2M4WEZCZm8rSWlHRkJqYWQ3N0ZxTFJtaHBpMU95?=
 =?utf-8?B?UUlSVU0ya3QwdUZ5S01Bb0pHREJ1UHYzakx5NDlBcHBYODkxaWUvc2swTkdP?=
 =?utf-8?B?bFBLbkFueFYvYzJ2OUlsNHFPVVZoY281WU4xekpCRWJ3S1JJM3kvOUxVaWUv?=
 =?utf-8?Q?19nDCAsGwSlHQvCU7DWjZHpSW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <215703AF9A9DDA4885BE6E052B740B1A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XzOc/rAfvcHETQ81OIAvOwCDb0ERPN0PA52iPB5ebboxkIH5UVXBgoyFJ4UlPog5rpqGqE7KvRb8OTzYLtr9jN8ZCbIRxKbPo+GqqKtiPt9zQapmCvxMBipMyp0Rgfju3k0VV52NwyLbJYhDNGM7dlTQP8SqS9BQfxObY+XcUWCHUPS4pmhm8ZNweKJygFhc3Kp4y90Y5D+npJNwKT9IJ+hi36bRI5oRyFZp5EIWYoyCpNA01qvPnlFks3xG5NSsYjPqncqmJvc0NXVL+Xyms3GzN20A6ct4EzV4eK3nXhpUB+NZTAeOkD7rvkAo0XxgPQyIj/ZJSPC+GYC237QsRHeG7pTBg63HY3+ZayzkGaDRPqHDMv4gHR+w3EOIo5l3pOAoRzivJPCATG/dwIjW5oCMv6ncsTrrR2c0dcsGYIPet0H7Jf8Fy/hGKbgqXmBe6ya+OzoS9+GBfwamssVv588Ncxjx+/0E6x8eTuRWGvJKUAmkusWcgqg5r3MVYzdFdAWQFEZjU5Iq5uQy0PvUrYoAey+qegzJIqG5epHHKebjoos0a9EFLpoz2wJ31BRrKamKbRVEqo7KK3yER7ZpyTlAfEuqqH1/2+uZYU5+YXHkmxy55PDEiJF5dsuW/c/SkQO+YM9dtggH4CHrYl5BzwHMl1Mfh1DhdNGSKZbKDLsz3Pf/WmJN+XCGPXXhR99HuGYm0viLdN22SSFIDRqLabLJULFSmUEs9HqAb9iTHihvFvoSTrwnmyv0KXDI92Spr3xe/WnFinLPQpOfXJ4cAMWtGoorP3GCoeRA6hGD2flvGIuCaVpeVDDmPu904I5eOSG4uPUjmj/nO8DXo15pCQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24893500-a086-44dd-5efa-08dac88fcb11
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 11:35:13.8513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laVeFPvdr2JtIp1klM8/X785Xl2lwHo/4xLvtE7sdHiX547SjA6Pq98raznD3QcQ90EWPSyivX4iDaWKAAdKEpq3X/t0tUZRhbjZL50N1a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6873

T24gMTcvMTEvMjAyMiAwOToyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE2LjExLjIwMjIg
MTc6NDIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4+IEN1cnJlbnRseSBYZW4gd2lsbCBwYXNz
dGhyb3VnaCBhbnkgTG9jYWwgQVBJQyBOTUkgU3RydWN0dXJlIGZvdW5kIGluDQo+PiB0aGUgbmF0
aXZlIEFDUEkgTUFEVCB0YWJsZSB0byBhIFBWSCBkb20wLiAgVGhpcyBpcyB3cm9uZyBiZWNhdXNl
IFBWSA0KPj4gZG9lc24ndCBoYXZlIGFjY2VzcyB0byB0aGUgcGh5c2ljYWwgbG9jYWwgQVBJQywg
YW5kIGluc3RlYWQgZ2V0cyBhbg0KPj4gZW11bGF0ZWQgbG9jYWwgQVBJQyBieSBYZW4sIHRoYXQg
ZG9lc24ndCBoYXZlIHRoZSBMSU5UMCBvciBMSU5UMQ0KPj4gcGlucyB3aXJlZCB0byBhbnl0aGlu
Zy4gIEZ1cnRoZXJtb3JlIHRoZSBBQ1BJIFByb2Nlc3NvciBVSURzIHVzZWQgaW4NCj4+IHRoZSBB
UElDIE5NSSBTdHJ1Y3R1cmVzIGFyZSBsaWtlbHkgdG8gbm90IG1hdGNoIHRoZSBvbmVzIGdlbmVy
YXRlZCBieQ0KPj4gWGVuIGZvciB0aGUgTG9jYWwgeDJBUElDIFN0cnVjdHVyZXMsIGNyZWF0aW5n
IGNvbmZ1c2lvbiB0byBkb20wLg0KPiBQbHVzIHdlIHNob3VsZCBoYXZlIHBhc3NlZCB0aHJvdWdo
IExvY2FsIHgyQVBJQyBOTUkgU3RydWN0dXJlcyB0aGVuIGFzDQo+IHdlbGwuDQo+DQo+PiBGaXgg
dGhpcyBieSByZW1vdmluZyB0aGUgbG9naWMgdG8gcGFzc3Rocm91Z2ggdGhlIExvY2FsIEFQSUMg
Tk1JDQo+PiBTdHJ1Y3R1cmUgZm9yIFBWSCBkb20wLg0KPj4NCj4+IEZpeGVzOiAxZDc0MjgyYzQ1
ICgneDg2OiBzZXR1cCBQVkh2MiBEb20wIEFDUEkgdGFibGVzJykNCj4+IFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBhbGJlaXQgd2l0aCB0aGUgaW1wbGll
ZCBhY2sgaW4gdGhlcmUgcHJvdmlzaW9uYWwgdXBvbiBBbmRyZXcgYWNjZXB0aW5nDQo+IHlvdXIg
cmVzcG9uc2UgdG8gaGlzIHJlcGx5Lg0KDQpJJ20gY29uZmlkZW50IHRoYXQgcmVtb3ZpbmcgdGhp
cyBjb2RlIGlzIGJldHRlciB0aGFuIGxlYXZpbmcgaXQgcHJlc2VudCwNCnNvIEkgZG9uJ3QgaGF2
ZSBhbiBpc3N1ZSB3aXRoIHRoZSBwYXRjaCBnb2luZyBpbiBsaWtlIHRoaXMuDQoNCg0KQnV0LCBh
dCB0aGUgbW9tZW50LCBJJ20gbm90IGNvbnZpbmNlZCB0aGF0IHRoaXMgaXMgdGhlIGVuZCBvZiB0
aGUNCm5lY2Vzc2FyeSBjaGFuZ2VzLg0KDQp+QW5kcmV3DQo=

