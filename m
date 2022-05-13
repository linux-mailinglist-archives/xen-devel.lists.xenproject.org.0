Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA2525ED3
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 12:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328343.551354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npS5n-0006qG-Fs; Fri, 13 May 2022 10:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328343.551354; Fri, 13 May 2022 10:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npS5n-0006oE-Cd; Fri, 13 May 2022 10:00:15 +0000
Received: by outflank-mailman (input) for mailman id 328343;
 Fri, 13 May 2022 10:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAty=VV=citrix.com=prvs=1253447b4=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1npS5l-0006o8-Ql
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 10:00:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78a37066-d2a3-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 12:00:12 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 06:00:03 -0400
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by MW4PR03MB6393.namprd03.prod.outlook.com (2603:10b6:303:120::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 10:00:00 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::b02b:3af6:daa0:30ce]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::b02b:3af6:daa0:30ce%8]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 10:00:00 +0000
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
X-Inumbo-ID: 78a37066-d2a3-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652436011;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=55k7Zp2QAhQKOsgBKKOHb+MLwCmCtCVvp/GIe816wQg=;
  b=AhZrf1ODeR8n4L44cnNyFzuOhukwdwsp5+XH7IWmu0z36wtbbZzAgsNn
   UIxhAnRdCV21nWDbRyUMxbXXShE8qO2xgXkwczadS6d7zOQE1cQO3ZLS9
   ic6hNdsLtptEorsGOUJOZn6V9MShP63nYtgprumslxyioUXFgBO6bFo+n
   o=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 73739510
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RDp8dqCWS9Cy0RVW/zjiw5YqxClBgxIJ4kV8jS/XYbTApGwr0TYBm
 DcfCG7VPvrYYGene4h+YN/j8x4GuMCBmoQyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhey
 44cnq6UYj02FZTUiL1NAzYBSwFHaPguFL/veRBTsOS15mifKz7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mbHs0m5vcBtNs0rtpJBu2YY
 8MWZCBwZRDESxZOJk0WGNQ1m+LAanzXLGYH8wPI/PJfD2779hxbz4fxa4vvZoaWHZUOk2SUj
 Tme4DGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRolWlR9tVJ
 kgQ+ywvhas/7kqmSp/6RRLQiGaNoxo0S9dWVeog52ml06fR/kOVC3YJShZHb9opstJwQiYlv
 mJlhPvsDD1r9bGQF3SU8+7MqSvoYHBIa2gfeSUDUA0JpcH5p50+hQ7OSdAlF7OpitryGnf7x
 DXiQDUCuoj/RPUjj82TlW0rSRr1znQVZmbZPjnqY18=
IronPort-HdrOrdr: A9a23:s5vfvaGOC1xGZk4IpLqFSpHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdhrNhcYtKPTOW9VdASbsP0WKM+UyGJ8STzI9gPO
 JbAtBD4b7LfBdHZKTBkW+F+r8bqbHpnpxAx92utkuFJjsaCZ2Imj0JbjpzZXcGITWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/HKVwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5t+7Y23+4sowwfX+0OVjbdaKvm/VfcO0aaSAWMR4Z
 vxStEbToJOAj3qDziISFDWqnTdOX4VmgPfIBmj8DXeSIXCNUwH48Ytv/MnTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv9nZMOq59ks5Vka/pWVFaRl/1swGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlJhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OGDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowlLau3ieffFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="73739510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUa30CsaKa5vz2UbeyxPjnO7xVugvRNJijn2WEZKej5y/mkuATXQh5nRvOe+dyKZs0FWWtveGO4j6zAtcuFe9VysJaQh71JzSn4AuSnYzqcHK8/L5FuLpOELhM5r/XqIAp14M0R20/yEvKSMVVgvCjbOvb95HxxaovxbjozMieKQmnE0CqK1sEUkE6Kt8rHKZYg7+nLrPBCJOytlQRqc6Qo+YWQsDJILY9SD8Yr7vF0ko4xjN395aFTovwqjWNITGcEkvmXBGIGkKmwlH69x74xF0qUZvfoLt2iiUlZnMcS0dEK1JvEHwN7MO92ADi0EFUou4ZBxxPdEesHrQmXzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkCjiZO24llJScKgxNzCxomb9h7PP/a3xAvTwnw48Mg=;
 b=Sn2ymt0xOQXPCwSFFzUEz3oydEnAqCenSx0s/7bD1Y4r0vyDTejZMd88hhOt1CTc2fWfIJkN0XYguaub+OuXX+rA3g42XZ5g+c9ITD/SeeoVqJywMIzPTv6/LTJUKTAIYaxtak9msQ89tT67jstWmLRJLD90RzM7v4VTbuGd0FJeHjNcHrGy0dpREq3FTEC+2xxK5IoXC34u/Zn4fZOe8Nx5iuaTsan4sQHTlEE+8/ifCw1I7uTsEx1NHUrvI5+lBwdkSTRkS+aGRxRZVTPUjf0zetrURsf6Kk8YhcqLa5GBszYm/pgmpuvQ+115eXtTJPSFg22K29EpOY+Vn0XKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkCjiZO24llJScKgxNzCxomb9h7PP/a3xAvTwnw48Mg=;
 b=jJA/hD5pSS4ffJHK9POkVBlLf0z+hqi5VcPNFfi7C4YKoIWFT7a2A8WuRq/v8YQ2/KVPOJhmG16gGBMq/eqzI30JQSPL6vzQXDZ/LVwbhAS+HXCObBjjJBsdTJLrqO30qX62AWZkSSy9Fqk9iag1MF2BG6fu/Fspqtvc/sZfHjM=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Thread-Topic: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Thread-Index: AQHYWlVI6k4vzeGas0CbAgtnJ0rrZq0WWb2AgAAQ5LWAAA8wAIAGL25V
Date: Fri, 13 May 2022 10:00:00 +0000
Message-ID:
 <PH0PR03MB6382193356F37C9000946163F0CA9@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
 <Ynje14BbzorbkvkD@Air-de-Roger>
 <PH0PR03MB63820BC5F37E040F37554E32F0C69@PH0PR03MB6382.namprd03.prod.outlook.com>
 <Ynj5wPrz4hEWJOA9@Air-de-Roger>
In-Reply-To: <Ynj5wPrz4hEWJOA9@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14115d4e-f67c-4504-141c-08da34c757bf
x-ms-traffictypediagnostic: MW4PR03MB6393:EE_
x-microsoft-antispam-prvs:
 <MW4PR03MB639352BAEDC056DFA949F229F0CA9@MW4PR03MB6393.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fS5gIxeLWqIlg/g7It5N72UCO1CEMouTjxUJN5H1fwAvS++A0uUrPsBg+mESQ3MVfOr/SGAOOFKq3BxRXe3c20M3iJ+oTpCvGB88skv4g4HYOeENMwCo0HCjpXE462vS+dKwmuwajcDpZ0y8W46nWg9tqfgyUidWrTfA0ycaiA7P71720pjJa/bQHJGyFih8s0a8f2KVJZyMUrXfD1SuOEW0krphtICPHJ0fXmdgtcPg9+BGWcqQhAz+dj9QYjkBMwB2YrKVJxUKQNZnez22t1dTVHzI3zOlvHnc0putpk1K0JNFq2GiQutkW5/eJYa8VHUV9MYEe3/FQL2gJ7eU45wUMXDMl5Wq//ChALjb0cWEcwRuEfcCsBejQvjAA6xKqrX0Bu13zOwXdBXgR7QqmeC3Eqqnct9OPOk3PoHeDeVlyjv+nmj0h8/fjnRGKqwbOZMJdltzSTDFTU2PZaBvFgIqROuZrXZz9MDg6CFrZELPzykf0WVbZIJPELvq8xHAY8qmSqMH7/3qxMMmhNLBxa/MGkIlrAZncmfuYFGR8uoNPhjE45kAZPqDA9RAVTy06AWqVEVzSTTrOYg1wshgNy5Yxko2rIWAMScdGtVhsHgt80WQGzL3ydanUL1ZGJkWZU8GzkT8MYg520yIBpwKRR859/0ob8xGUjP6QL8LATzSQEZ7o/+eAPniX9r6NZVsDxHk4sAx99cV8GAOcC8idQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6636002)(54906003)(316002)(2906002)(91956017)(38100700002)(52536014)(122000001)(82960400001)(8936002)(38070700005)(5660300002)(86362001)(55016003)(508600001)(7696005)(8676002)(64756008)(66446008)(66556008)(66946007)(76116006)(66476007)(44832011)(4326008)(6862004)(71200400001)(186003)(53546011)(33656002)(83380400001)(26005)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?144h3xaGVLWvQZp5bVEys8ypCPS7xfShpbqe9MkVnoPmsBxHZgqCmNyQAB?=
 =?iso-8859-1?Q?CaXwCkuzLJgxOU71lSSMd3ILY43a6B5Awq2w8Cqhu+zcFpcNMkIbeEAOoI?=
 =?iso-8859-1?Q?tzDnrl2hSgDjoc8tfjz6tEtXrBPxvkIL8jutlsav+buSh6u6QobIA6g7m9?=
 =?iso-8859-1?Q?u1CNdQw85IrwKWr1SxCtAMF02k4SIjjTxpAORw33eG1uvE5+D8mDpgczha?=
 =?iso-8859-1?Q?VQU5emkqmon9E/ciAFQWkUieW0r6wwqE+Y1NKADEDxGclL0U2hpax331A/?=
 =?iso-8859-1?Q?HeqcIw4HA1QviAWRf3naCkvJ5wlrOsx3qaEz7hl6nbH9M+BWWZuqrfdbb8?=
 =?iso-8859-1?Q?LUEz4TsnQw6PcOeTRLELrHaovZhiUEhWSNE3QovXBzkRSpjhjsPf83oq/v?=
 =?iso-8859-1?Q?bj/Qya6VOhyA5AGwgWlWIKwE0Ou7ju085dMuHHeVcpdrGknYVdBsRDZmva?=
 =?iso-8859-1?Q?n/RY8lSL7X0jR9xd5p2zprIxpSc0d9bP6ruxCpkyQdbc4P/SpAUuPG7mb6?=
 =?iso-8859-1?Q?ixA0nfmmz3N1giStomitSETRjiMUiqzOtPQPHJBgVIhMnwNJTMzbFPE+Lh?=
 =?iso-8859-1?Q?EzAe4HHxBTfjO3yBBekzGpp1UDm19c2yImIkObiYEMyvm+4rNj5c6xvwAl?=
 =?iso-8859-1?Q?cQcsx5DM/HQYtgMsNSLnBNSYIUj+v8WKZDzJvb1dtzBNUb6gi7KEojT9SX?=
 =?iso-8859-1?Q?J17Azrkae7W5FaN75oIQsIjBs+aMtaZ3fGbHHAH4ySZQhQcuiuAJ9UEmTY?=
 =?iso-8859-1?Q?ESuw3mH41qYdwZaV5PjS7MfyW6ZUxBu8bQTMMIXVHsJW50Lo/k2zM+HSv7?=
 =?iso-8859-1?Q?kZhRT9erz2L78v6FgYAN9aNNnBHhaU6jVAIXAB49thbSV0UecSyl3GqUHx?=
 =?iso-8859-1?Q?KfCxGaESv8Qr8sgOpHq7tRjWzBx4sQsWr9tcxTcLf9UlvSWMukGaCiv193?=
 =?iso-8859-1?Q?ONmCmwcwj0HMeUDURs4NwhlR0uEHeHrgpcWcKWhgf/8o2YLa8+iZCTVCz7?=
 =?iso-8859-1?Q?QTYsqqvJ2pJTuJbocSMGC10E1dCYQvAYsOOkDylfwYydTxnyKOxzJjSYU/?=
 =?iso-8859-1?Q?p7rCRyDqtR0ojsfTQuMy1stARgCP2BmajbyEFipXD2urPjaZfos4SBJdGc?=
 =?iso-8859-1?Q?UIB+UypYqvNw3yrToxYXVQUcgjb2uAcU9YYkaesOkBYluleXDMu5Sm3u37?=
 =?iso-8859-1?Q?6io2a45mjhICZngh+PuoCroo56mvIkfK9et4MelHBV+0u8AqghDWNgye4Z?=
 =?iso-8859-1?Q?6TD6KSIgSlkYAqT+mhA2w4krX3rqe8HMEKnWO+bG2dftB7DsrRG2EPUPx4?=
 =?iso-8859-1?Q?7H2I34BgKK6GpqEYASluR/GHKytXg8r/F1zkFow8v/z+B8jFofy2jrOqPz?=
 =?iso-8859-1?Q?aUv9k/iqg3eawCzTooAN860gCOjzQAfdCCZSLdbbEjCzsB0RAAszFsLQCO?=
 =?iso-8859-1?Q?ukOlPMpQ1QDqKf9r8UlsrvATywIYzQX3Kzn3bZOUQGS/fzVSlwSmKHFNfx?=
 =?iso-8859-1?Q?X75LjYvZfGIhXz3uRf9efW8Ancbw3RDj59z8BT682/tBjagUVrm+Sdyk/7?=
 =?iso-8859-1?Q?rMc+UnnrOuSdj89yhN2NRFjEohXG3CLftIHFxNdToaJd4OnJU7Y7iIMd4W?=
 =?iso-8859-1?Q?CjoSwDoKjyGVaWZO+Zh5Po9q2363xLlwBKqYtTdVGik/kBv0G7Vqc3MIx7?=
 =?iso-8859-1?Q?/v11ZD7uAK8wDSvlkZMjDwxg8nmRfIj++77LNu7+7LkBuCy81Pwd/69LdW?=
 =?iso-8859-1?Q?bDuK8eizZhTI+lh3+wU51/rkuzpTIQ3AJz0aMoDGViEXTT1yiO3k8JnwW6?=
 =?iso-8859-1?Q?pzl+vkqrmTrZHYxQPhXIEA2rmpzMuAA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14115d4e-f67c-4504-141c-08da34c757bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 10:00:00.1310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6xMrD494ypIQBms8kZes+7zJqcqsLJQsv+HFH8263EvbApHn+Fjpt3/iSlg6ftcV2ZnaQhQGXXbCo5FmOCOkB8r6S9IHzsP5vy9LLjAl4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6393

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Monday, May 9, 2022 12:23 PM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Stef=
ano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@cit=
rix.com>; Paul Durrant <paul@xen.org>; qemu-devel@nongnu.org <qemu-devel@no=
ngnu.org>=0A=
> Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host ones =
=0A=
>  =0A=
> On Mon, May 09, 2022 at 10:39:32AM +0000, Ross Lagerwall wrote:=0A=
> > > From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> > > Sent: Monday, May 9, 2022 10:28 AM=0A=
> > > To: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> > > Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; =
Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard=
@citrix.com>; Paul Durrant <paul@xen.org>; qemu-devel@nongnu.org <qemu-deve=
l@nongnu.org>=0A=
> > > Subject: Re: [PATCH] xen/pt: Avoid initializing BARs from the host on=
es =0A=
> > >  =0A=
> > > On Wed, Apr 27, 2022 at 05:38:12PM +0100, Ross Lagerwall via wrote:=
=0A=
> > > > The BAR emulated register definition does not set emu_mask because =
it=0A=
> > > > varies depending on bar_flag.  If emu_mask is not set, then the BAR=
 is=0A=
> > > > initialized based on the host value which causes the BAR to be init=
ially=0A=
> > > > mapped at whatever value the host device was using. Although it doe=
s=0A=
> > > > eventually get mapped at the correct location, it causes unnecessar=
y=0A=
> > > > mapping/unmappings.=0A=
> > > =0A=
> > > Would it be possible to just unset the memory decoding bit in the=0A=
> > > command register if it's set?=0A=
> > =0A=
> > I don't think that would be sufficient since AFAICT qemu does not read =
that=0A=
> > bit so will still call into Xen to update memory mappings, etc.=0A=
> =0A=
> Hm, but this seems wrong?  QEMU should not set memory mappings if the=0A=
> memory decoding bit is unset.  While the bit will be set for the=0A=
> underlying physical device, it shouldn't be set in the emulated=0A=
> command register provided to the guest, and hence no mappings should=0A=
> be established until that bit is set by the guest.=0A=
> =0A=
> In the description you mention not using the host BAR positions, which=0A=
> is fine, but you also need to prevent mappings from being created=0A=
> until the guest has positioned the BARs and enabled the memory=0A=
> decoding bit, or else you end up positioning the BARs wrongly has QEMU=0A=
> has no knowledge of where should BARs reside.=0A=
> =0A=
=0A=
I was wrong - I missed the point where QEMU checked the memory decoding bit=
=0A=
since it is in the core PCI code.=0A=
=0A=
This patch was originally for some older combination of Xen/QEMU. I=0A=
rechecked now and I'm no longer able to reproduce the symptom in the=0A=
description (unnecessary incorrect mapping/unmappings) so I guess=0A=
something else changed in the meantime. The BAR register being=0A=
temporarily populated with host values before being programmed=0A=
is therefore not a big issue so I think this patch can just be=0A=
dropped.=0A=
=0A=
Thanks,=0A=
Ross=

