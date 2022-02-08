Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EBC4ADDDF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 17:02:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268454.462290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHSvO-00025g-A4; Tue, 08 Feb 2022 16:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268454.462290; Tue, 08 Feb 2022 16:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHSvO-000230-5x; Tue, 08 Feb 2022 16:01:02 +0000
Received: by outflank-mailman (input) for mailman id 268454;
 Tue, 08 Feb 2022 16:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkaY=SX=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nHSvL-00022s-Tt
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 16:01:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac61849-88f8-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 17:00:56 +0100 (CET)
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
X-Inumbo-ID: 4ac61849-88f8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644336056;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZNBMT+8cjMEACLKu2VApF6fj8meZ3l30g+HS/RUbY4o=;
  b=OPYLqUD619QxRvfEJBVUQP4nj1n7doW5qa/StA5Murjs857Y8k5sQ/V/
   Xc0sZ0Em1zmYQKPEPG0JIMlK5CQjMecjdU4EIR0xWGCAXR8uU/2RUDXsx
   6kK4aqlqVrx1Ou58kAnFFG0hIoCxanHRqEABDtQppvzCllNp17adkoZyE
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: D9Mcc0Wu470JP6qVflOkUR0eiOCC6uZFWhlgxDhYahmMWJ+vLNdncJ751lCi2rLbHTY2F22xE9
 lCTSapGuu/UFFJPPGr+Lchd45rSbdAImd93pcMIcwhL2pfWCbaOgle2BZT3uD5S7ltek3a9b5i
 7WCdXn1gphJ0lL8nN/5RLRLUBRqA2p7MgFM6VraIV8fH+z3+BpTt2wQ+d8auIfVR4AmBTn/ru2
 FIhWis6NzUGy8uWpzVaRU2JqWkWcm7MaOMxSFE3aiRfWEC3qLoNx9RTso0D+vrKy5zImSgVpvc
 9ReU6y9D2l/d+TkvvwCM8ZSF
X-SBRS: 5.1
X-MesageID: 65962671
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uCWzG6PlWJ6iSwvvrR3hkcFynXyQoLVcMsEvi/4bfWQNrUp21jZRz
 zAfWmqHOfnZY2qme4x0aYvi9E8OuZTTy4RkQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500ozw7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2S0nOp46
 /5Dj4SpRQJwMonHwN4vcyANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YstlgMllCcDvNYcWvHxIxjDFF/c2B5vERs0m4PcGgWZu3J4RRJ4yY
 eIaMBlUXB7ncyRdeQ8SIpshxsb5j3zGJmgwRFW9+vNsvjm7IBZK+LTkLtf9YNGBQsRR2EGCq
 Qru5H/lCxsXMNiezzut8X+2gOLL2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIQqqw1+F2uX8PKdRSyq36ZvTYRQ9NVVeY97Wml1a788wufQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmL+ITXOQ8J+EoDX0PjIaRUcAajUDVhAt+MT4rcc4iRenczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV//SG/mrOoBminIDQQgts6iHcBliXzjosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6q8gjlmOMEZmOq7EMZGPx/44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2PGcmqlk35gODHPxZ5rIvp13PUP4gEAF6s+l2Jo
 76zyePWo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2reWJb9JUaI6aJm9sJItU994wMz7ug1
 iztCydwlQuk7VWaeFriQi44MtvHA80gxU/XyARxZD5ELVB4Ot3xhEreHrNqFYQaGBtLl6YrF
 qJYIJXZWZyiiF3volwgUHU0l6Q7HDyDjgOSJSu1Jj85ep9rXQvS/dH4OADo8UEz4uCf7KPSe
 pWsiVHWR4QtXQNnAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvGUw0FoeTtopMu9IWbj66zsIr0QfB1GVBXHjeH4O/uZzXa5Geq3aRJTP2MIWLGTGrx9aj7P
 bdVwvjwPecphlFPt4YgQb9nwbhnv4nkpqNAzxQiF3LONgz5BrRlK3iA/M9OqqwSmeMJ5VroA
 hqCo4AIN6+INcXpFE8qCDAkNunTh+sJnjTy7OguJBmo7iFA47faA15ZOAOBiXIBIeItYp8l2
 +oopOUf9xe71kgxKt+Dgy1ZqzaMI3gHX/l1v50WGta22A8iy1UEap3AEC7mppqIbowUYEUtJ
 zaVgovEhqhdmRWeIyZiSyCV0LoPn4kKtTBL0EQGdgaAldfyj/Mq2AFcrGYsRQNPwxQbi+9+N
 wCH7aGuyXliK9uwuPV+Yg==
IronPort-HdrOrdr: A9a23:ssia1KtXOciOhmeWTiZ+hDnA7skC2YMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKceeEqTPmftXrdyRSVxeZZnMrfKlzbamLDH4tmtJ
 uIHJIOcOEYYWIK7/oSpTPIburIo+P3sJxA592utEuFJDsCA8oLgmcJaTpzUHcGPjWubaBJTq
 Z0jfA3wAZIDE5nF/hTcUN1OdQryee78a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MmTvKQ0TtQgDg76t
 MX44vRjesmMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1UwKp5KuZJIMvB0vFtLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZNyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR52Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFAgFCvsukaSRloeMNoYDABfzP2zGyfHQ0Mn3KverLs
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="65962671"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKVY0KHMYNTDDpmWNnJo56lJrpckQpJ6x0e1Pcn2Cuz077vkq7LyWsGajRQ1rKE4Q3A8H2vxL+fDCOEL7q2GBfQMB5AUuAxklJT1KPsS/3vRwudJOO8QWok7hpLUT4go1WgB6wowzZYB07+S2iplgOU8wz5WUqX9dwBWIT52sCNS8EhDVassz+18n0dGcYOGJIIFhMLFrem1mjSC2w4MJR2RIu+kB8Fk6KQynDEQ+YkDpeI3OgbWbxUyhu4pRJmkiBV1aMGsuhmrMOPbh+Z6krSQPvYORkyY/eSHEp3A1nrKMTIDkbXJHbiJduFzP5KtZtu7TCLc3xuhs8RCdLZK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNBMT+8cjMEACLKu2VApF6fj8meZ3l30g+HS/RUbY4o=;
 b=mYYFi/uNjLOQD3TkPY8UehGaLDrvA+l+EJq6WhbrEcrF6+ZSqhaof2iDBzyO/HcAAxayptl7ZQGWztShCKakdsc3Wx1KIgdsyBZjvEre/h1yCvXZo6eAuzIO9oUXpTbQa3jiaPGGhh2t46Ui+kIRQ3rZMZtC8CApHcfsqpwsM/ZCJDMHkby4b3rmLhHe1yCo2OMyf84/hTeyGdvoMriywoZ4nSmOU+owZKixwsuplaMDjthx8mj1omSQAvBL5rvOfGXl9oss/I/OPse4aOm6jQBu40vjfXHtucYUlgjWIVy5Q9HUxSddB8EWN3I6ylItPPyqdNGkXfldooUJN71c+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNBMT+8cjMEACLKu2VApF6fj8meZ3l30g+HS/RUbY4o=;
 b=BnM7XZ8d4fOjT+09Ww8GDgV+vKgx4pSNVXoo48aAAqUE+qQVh6pSNnpX/4dEDKkFigpJYBkFnsjg7TDbYV8Nt5vBiqGBH6lkI0eCP5+Fti5qzwdVkBZKtmuxZIy+wxeMTwbYEdB1Od/4NeEKiwnjl/oh0jVeFK8Zfmvr6Vgl2WE=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYE5eVWWLwfSz8JEi35sISHqV9YKx9DnUAgAypmgCAAAcRAIAAI8CA
Date: Tue, 8 Feb 2022 16:00:48 +0000
Message-ID: <016a8399-989b-3f11-3dff-093691690ee1@citrix.com>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
 <8b59b7d7-2d0a-0b8a-f936-1e537dfc4f9a@suse.com>
 <a4af7c49-99af-b66a-a05f-2907fa6d50f1@citrix.com>
 <f725c58c-1f70-893c-b6a4-649c636263ec@suse.com>
In-Reply-To: <f725c58c-1f70-893c-b6a4-649c636263ec@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc423add-7623-495a-8db9-08d9eb1c2c8b
x-ms-traffictypediagnostic: BN6PR03MB2481:EE_
x-microsoft-antispam-prvs: <BN6PR03MB248134BF4367CA25A86EEEE0812D9@BN6PR03MB2481.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +wA5+P3MEM6vrojL7w+zW+uiW5BsoyFN8F0WwKQ4WELox3ga/9L3O+AuGwWdR19nFkbak4oLSmno4LCqyUHBd0gh/C4FxKKjeea3s3OxfMQge+vTG8Gx/PXGsKYTvM+pQHAKEbEHsNKAH41FAVXiMQSQoEjFJ0Mxjb998j4dJJ/V4WAve/lQf/q7wO7xPn7pVZ44x9UrwUWKAH9UbnY/+gjVgR6UI4QVA+4IXQiC+MIa0x6Zgbd5sxZAtp6hX0xPRNb3Llvm4YN4eg9VZL977/4lwRXQGYqtQ4afcnBcHItIoyfKiCvscpYkSIH2bsATfzK2Em5y78In/V6kkoFYInUgPmlWSGr3LYy5U/vCGonG5W6RUj/an140HLVBI44sJuWWkTxphTeq+top6qd+AgL735a6W1CWWt+roLbJaZrG84vZ5GQA3+tX8FCtvPX5q0NdXo5TW7G2iP64kwvmcjzEvldceFGYuGLitwcQP9xz5fcaRVPvgxLHwBxtizrGeiQ8Ot2/ErsZwu+/CtBpASBFq2GzL0siZaNI5gH+Wq2YksUf2NL6Hgvpi92jSyuFcz4HtYyxgqdzpVQqUa+PQ1gbUPsfij6H4GNG8cfM+85K8dXUAUcCzxRccaEZ4tvi7TrHZqD37yactdVbunvpdwJb0JM3H9AT04XpsfbIFcr5FmjV1/y2VHsPq6TrXcgkRXkIDj+lZF80wKDtbzWhU5de50mNfaLrd8+4h+Lz/KGTomeWUtSEjDgR3C/AQ6ke
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(71200400001)(6486002)(36756003)(6506007)(31696002)(8936002)(66946007)(66556008)(76116006)(66446008)(8676002)(86362001)(4326008)(91956017)(6512007)(64756008)(66476007)(38070700005)(2906002)(31686004)(186003)(26005)(82960400001)(122000001)(38100700002)(508600001)(54906003)(6916009)(2616005)(316002)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFJRVE9WNldqMmpDd1FXUkVodlpmYm5iRlBkdXZEWlJnSzVCWG1BVDl3azhM?=
 =?utf-8?B?L1JnRGVsbDRyYi8rRy9kcm1PdWhaaTMydHR2UlhhUndoTUtzT0sxcThReUZj?=
 =?utf-8?B?VGxZRmVFMGtMc2REMVlLL2c0YXNiOUZ6NE9BQ1ZHNGtFY0F6ZUt1eG9MZkFk?=
 =?utf-8?B?VGovRDRUSTAwOFVsSm5RcjQ1clUvaEw5bUxwaVBxQTVteWZUN2NsQnc0cHJI?=
 =?utf-8?B?NjhBTFp6WHVVQ05pc1kraGNFUTVQQWkrdzdHbUdzVmNJOG1ET2RRaUNtR2pu?=
 =?utf-8?B?cVRkVzcvODU5NDBwcHljeWxYNUgrV1dPYk1OUGx2MG42NXNjclhSa28vbndG?=
 =?utf-8?B?RzdLNWVWdER1Z05HMEJ3MlpZMDJkaUlUTGZBRTZLeC9naXpRcDlDZklQd1NJ?=
 =?utf-8?B?dTA0c1g2QTk1RmlrWVBJUEpmR2lnOXVTOHQySVdGOGRWRE5KVW9VSVd3Qlht?=
 =?utf-8?B?ZmZ3dUdBOUo2QlcwenNmbjJwWVdTcG9GSUVkVHVVRndidE5SaS9iVE1mUTR6?=
 =?utf-8?B?T1UrZnFTYitOdS9OYktzSU1UaXpmODdJd1FIaHZ4eWtGSDdXNHRmWG56dGFm?=
 =?utf-8?B?NnYxYkhHZUZQazBicEhyTUp4cnFvSS9Jd2ZDVUROejdmTmE5aHVtb0NjbTZF?=
 =?utf-8?B?cjZEeDQ3Y2gxY3RDNmtzRE4ycW1PWVVhekNEWEEwYkU5VXQ5OU1tYkE3SUlB?=
 =?utf-8?B?YWhDTksxN3BWODVPdmxZYVJGc0p4TlI4Y25YSGdJYmtVc00vcW9CcnRCS205?=
 =?utf-8?B?SEJ3a0VIMCtYYy9VUHBaY2JPTlJhbXdtUzZud3BFelc1bDk2WmdWWjRGVVhK?=
 =?utf-8?B?OFJTMEVWdk9VMzBkaHZmUEJicDdONHVNSWkrN0hYcmJzWlVLbmJ3bUZEaTl5?=
 =?utf-8?B?cVZLMjdYbmpnbzRjazIvdTY4RzRyKzdNRGdIUFhuMVlPOU05U0VVU2ZJd0xh?=
 =?utf-8?B?NzdsMEZkemh5aHVjeW5yVElkNWMvdnVrMlY0NUN3RlRQYVdmdEFKdE5GMEJz?=
 =?utf-8?B?S0paTFpMcTZWQUZ2RkJEY0NsK3FCUW9JMWJMUzI0MGdvSzBaelMvZHZJSzVV?=
 =?utf-8?B?ZUhRSDRqWDBUdDQxNE9Dc2NKK01rR2I1VmRtUUloTDNrTWEwQnBiTnFCSlZQ?=
 =?utf-8?B?dVd4QWNkSGp5QmlsT1hORFZtNEJRaGhsSmxmYzMwTFUxSEdiSkRhL295Y2RF?=
 =?utf-8?B?SVViQjNvQXlpYkU3SDl4QmZiajRSK1pZbHl0UlRGYncvQm9zYUtQSmRWUzFz?=
 =?utf-8?B?V0pGZmd4VVNpMnJEMmE3SzFoVXQwRzMvZ1ZLWERvWHZVOXpMaEg3czlSelpE?=
 =?utf-8?B?bTR3dEwyelczK0ZXTFlsRThLV0RvREErRXVVdGkwbmZWL3hNTXhxRGFZR1N5?=
 =?utf-8?B?UHlGcWlicXBZVEtxa2xpZzhKU0VOQkllVllUVTY3WGt4QVJNM1Jkbk81SmFS?=
 =?utf-8?B?MGpHeDVNTXZGdGF6ZEc5dXkxWkk0M1hrSWJJSzIwNlM2amlPL3FVSitmUVJz?=
 =?utf-8?B?TEZNa3I3N2R2OUtXbW1HMEljZ0pleFF1Z2dYNitjanFQNUdPaGlURTQxdUFa?=
 =?utf-8?B?Lzh0cmxab1R3eEdwVElibEtuSTFka1NoMWxaQldIU0xGN3RYZUhZRzBSVFRY?=
 =?utf-8?B?YlYwcDZpeXE5a2JreEV2N0pDZXZPZVFHUHIzNEE3d293L1FxZEhKVFRXMFF3?=
 =?utf-8?B?bnlDV1hWVXkwT05memsxR2R2ZmxRMUV5c0dJcEFtN04wY2VOTk85ckVxelVR?=
 =?utf-8?B?WVV5KzNZOG5xazZvODNWemNhZFYvRHFVdHZwcVRxckdaOUs1M0MrdU1rY3JU?=
 =?utf-8?B?Uy9KVkZLVGVIeHUrbWh3UW00MG92TDY2ZFRydy9ZZTN0WjE1Q2ZIZlkrQ1Ra?=
 =?utf-8?B?NlRsa0NSWGxPY0tMcE5ZK2NGVG5LUGRNN1h3b2RSUmRXT2w3RmsyRTFsTEZo?=
 =?utf-8?B?d3dRejNPYWJzaE56bytYOVRxUjMvcWRPQ2lvNDFBMit2TmREc0lwREM4Q3V5?=
 =?utf-8?B?eEduK3JrWTZNT1VDTk12SHM0Y09HSXYzdmpyY2lPREZMZ3RHc0d4R0szS011?=
 =?utf-8?B?dWg5S0pxU2Z6eUdQMFpOWjY3ZTRFK3Bhci8rbkJkcDVzTjA0bS9NOXFWTmg5?=
 =?utf-8?B?aDVWUWNLVlEycVgycWR5UzFCbWVyR2M4djkzeUtnQ2krRkpnMU04U3A5aVoz?=
 =?utf-8?B?cnpHemlXNXM4dW9mNmR0OVVLMlNiL1kyRDg3VEt5YWxHVjZkU0ZucXFjamFP?=
 =?utf-8?Q?hqFzCi6+tpshh54ceBmjOPiDeet8cWoLwFdbtPhPa0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <961D6E61DA38A246B87BA7A602C858E9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc423add-7623-495a-8db9-08d9eb1c2c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 16:00:48.7653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okMv1LzLWIw8+e9tigPaf0oQz1UAyxBnu7jSQhGKgkxWoJ+Rek0V290rswJ+/0DowGrGvPrs+dTQayQ5qbC5NSgdqRA0322AmeL9rrQTqJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2481
X-OriginatorOrg: citrix.com

T24gMDgvMDIvMjAyMiAxMzo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDA4LjAyLjIwMjIgMTQ6MjcsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAzMS8wMS8yMDIyIDEyOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAy
Ny4wMS4yMDIyIDE3OjAxLCBKYW5lIE1hbGFsYW5lIHdyb3RlOg0KPj4+PiBJbnRyb2R1Y2UgYSBu
ZXcgcGVyLWRvbWFpbiBjcmVhdGlvbiB4ODYgc3BlY2lmaWMgZmxhZyB0bw0KPj4+PiBzZWxlY3Qg
d2hldGhlciBoYXJkd2FyZSBhc3Npc3RlZCB2aXJ0dWFsaXphdGlvbiBzaG91bGQgYmUgdXNlZCBm
b3INCj4+Pj4geHsyfUFQSUMuDQo+Pj4+DQo+Pj4+IEEgcGVyLWRvbWFpbiBvcHRpb24gaXMgYWRk
ZWQgdG8geGwgaW4gb3JkZXIgdG8gc2VsZWN0IHRoZSB1c2FnZSBvZg0KPj4+PiB4ezJ9QVBJQyBo
YXJkd2FyZSBhc3Npc3RlZCB2aXR1YWxpemF0aW9uLCBhcyB3ZWxsIGFzIGEgZ2xvYmFsDQo+Pj4+
IGNvbmZpZ3VyYXRpb24gb3B0aW9uLg0KPj4+Pg0KPj4+PiBIYXZpbmcgYWxsIEFQSUMgaW50ZXJh
Y3Rpb24gZXhpdCB0byBYZW4gZm9yIGVtdWxhdGlvbiBpcyBzbG93IGFuZCBjYW4NCj4+Pj4gaW5k
dWNlIG11Y2ggb3ZlcmhlYWQuIEhhcmR3YXJlIGNhbiBzcGVlZCB1cCB4ezJ9QVBJQyBieSBydW5u
aW5nIEFQSUMNCj4+Pj4gcmVhZC93cml0ZSBhY2Nlc3NlcyB3aXRob3V0IHRha2luZyBhIFZNIGV4
aXQuDQo+Pj4NCj4+PiBUaGlzIGlzIG9kZCB0byByZWFkIGZvciBhIHBhdGNoIHdoaWNoIG1ha2Vz
IGl0IHBvc3NpYmxlIHRvIF90dXJuIG9mZl8NCj4+PiBhY2NlbGVyYXRpb24uIEluc3RlYWQgaXQg
d291bGQgYmUgaW50ZXJlc3RpbmcgdG8ga25vdyB3aGF0IHByb2JsZW1zDQo+Pj4geW91IGhhdmUg
ZW5jb3VudGVyZWQgbWFraW5nIGl0IGRlc2lyYWJsZSB0byBoYXZlIGEgd2F5IHRvIHR1cm4gdGhp
cyBvZmYuDQo+Pg0KPj4gQWZ0ZXIgc3BlYWtpbmcgdG8gQW5kcmV3IGhlIHRvbGQgbWUgb2YgYSBw
ZXJmb3JtYW5jZSByZWdyZXNzaW9uIHRoYXQgd2FzDQo+PiByZXBvcnRlZCBzb21lIHRpbWUgYWdv
IHdoZW4gZW5hYmxpbmcgYXBpY3YgcmVsYXRlZCB0byB0aGUgcGFzcy10aHJvdWdoDQo+PiBMQVBJ
QyB0aW1lciBvZiBhIEhWTSBndWVzdCBjYXVzaW5nIFhlbiB0byBpbnRlcmNlcHQgdGhlIExBUElD
IHRpbWVyIE1TUiwNCj4+IG1ha2luZyBhbnl0aGluZyB0aGF0IHVzZXMgdGhlIExBUElDIHRpbWVy
IGVuZCB1cCBzbG93ZXIgdGhhbiBpdCB3YXMNCj4+IGJlZm9yZS4gU28sIGFkcmVzc2luZyB5b3Vy
IGNvbW1lbnQgaGVyZSwgb3RoZXIgdGhhbiBtZW50aW9uaW5nIGhvdyBiZWluZw0KPj4gYWJsZSB0
byBkaXNhYmxlIGFjY2VsZXJhdGlvbiBmb3IgYXBpY3YgY2FuIGJlIHVzZWZ1bCB3aGVuIHRlc3Rp
bmcgYW5kDQo+PiBkZWJ1Z2dpbmcsIGRvIHlvdSB0aGluayBpdCdzIHdvcnRoIG1lbnRpb25pbmcg
KGluIG1vcmUgZGV0YWlsKSB0aGF0IHRoaXMNCj4+IHBlcmYgcHJvYmxlbSBleGlzdHMsIGluIHRo
ZSBjb21taXQgbWVzc2FnZS4NCj4gDQo+IFllcywgSSB0aGluayBpdCB3b3VsZCBiZSB3b3J0aCBt
ZW50aW9uaW5nLCBhcyB0aGVuIHRoZSBwdXJwb3NlIG9mIHRoaXMNCj4gY2hhbmdlIGlzIGFsc28g
dG8gYmUgYSB3b3JrYXJvdW5kIHRoZXJlLCBub3QganVzdCB0ZXN0aW5nL2RlYnVnZ2luZy4gSW4N
Cj4gZmFjdCB0aGlzIHdvcmthcm91bmQgbWF5IHRoZW4gYmUgdmlld2VkIGFzIHRoZSBwcmltYXJ5
IHB1cnBvc2UuDQo+IA0KT2theSBJIHdpbGwgYWRkIHRoaXMgaW4gYSB2MyAoYWxvbmdzaWRlIG90
aGVyIGNoYW5nZXMgSSdsbCBoYXZlIHRvIG1ha2UpLg0KVGhhbmsgeW91LA0KDQpKYW5lLg0KDQo=

