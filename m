Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7A575FBB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 13:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368138.599334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCJ84-0003ku-UJ; Fri, 15 Jul 2022 11:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368138.599334; Fri, 15 Jul 2022 11:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCJ84-0003hv-QR; Fri, 15 Jul 2022 11:05:04 +0000
Received: by outflank-mailman (input) for mailman id 368138;
 Fri, 15 Jul 2022 11:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xid4=XU=citrix.com=prvs=188d5c0a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oCJ83-0003hp-KE
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 11:05:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7cfc30d-042d-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 13:05:01 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jul 2022 07:04:58 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SA2PR03MB5721.namprd03.prod.outlook.com (2603:10b6:806:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 15 Jul
 2022 11:04:56 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::ec74:68a1:2448:721b]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::ec74:68a1:2448:721b%6]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 11:04:56 +0000
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
X-Inumbo-ID: f7cfc30d-042d-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657883101;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eiZL8Jhc13u9kBT840U8XZEo9UKoSJkaebqVB5hSbr0=;
  b=KkRrcPF7GkIEbvdnI05qzj+y3BoUZ23sRyj7SqEEHzg+Q0fb/R+NkS1L
   oPBPQecYPHDaq5tiuzoiY7brQMWyFZE3gKySgqQd3fQnuDfmVrIUch5Jx
   kAy0RoJRT6BSOmA6UXZKLEpxnvaZXAqY2TdbiDKLYdMOGUR9Yc6m8ztXP
   Y=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 76303260
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GBbjZ6kfunNfwn140U9WPDzo5gx+J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDWCGOazfZGqkL4oka4i+oR9Qu8eEzN5lSwJlqHs3RSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8uWo4ow/jb8kk3462v4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kqZtVG37hcLV1K5
 MI/FhosTk+p2euflefTpulE3qzPLeHNFaZG4zRL6micCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAG7gvK/8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSz33rSVw3uTtIQ6K73i5NMyp3moxDYSK143Xn3g+t6ghRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4N/Ax4Uejw6zf7gKdG0ANVDsHY9sj3OczTCAq1
 1KU2c/gHyZmtJWNU3WB8bGRpDK2fyMSKAcqZzIATAYDy8nupsc0lB2nZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/7q/1UDKhXSrvJehZh444EDbU3yo6it9ZZW5fMq45F7D9/FCIY2FCF6bs
 xA5d9O26ekPCdSGk3WLSeBURbWxva/aanvbnEJlGIQn+3K14Xm/cItM4TZ4YkB0LsIDfjyva
 0jW0e9M2KJu0LKRRfcfS+qM5w4ClMAMyfyNuijoU+dz
IronPort-HdrOrdr: A9a23:KJARv6/k3Ot84SQOccBuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.92,273,1650945600"; 
   d="scan'208";a="76303260"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcFKJWxpPoQN3EYJWvFlWjXvvh91aR/qRAMd4lu3k2iWKvixgFinTaKz3hiH16z1O95jsHvXQIdu+Y2mIsqs7bdPjjaxL9GnQtjjBy2bvjRg4OjyFrDdR1iO1Dj3PmafHvA22ApZP9bxorXWBAnC0jLZdJXKh3b7/fdwDlJVyVP4QYobh1caSkqF+EzCByxqIh7pzLRyNT+2CFRC6d84daOWkpUHX0rCv2SbqWr3JUImjQaGoFYtgWhEvm0MKRKk1YLAwscZmgZJbD6TfQi/25DOIEHcqdU878BWMlFtN8WNpBPOWP+nPzcLqHyokFqnkfAA7/hDGFrBOhhTaRPlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiZL8Jhc13u9kBT840U8XZEo9UKoSJkaebqVB5hSbr0=;
 b=c8HL5GF9qfwOz4uZn3WJy/7+AMLqB0Qkbd0iqfW8KBTAqn/HxLcKP9sZpkLWB+/psbAnRZcxhXx2vkpwCA5o8aegiFoqubswoHBnhZOscoO8soPKp0bNzQMsSbQBST3tDIsBcaTCYyoO/R9mXPy7D0sPBFYo8Rz4rDTaCRR7dU79pRWAAB4kp6JpC6mAFuNzu8a5IuPBhjHxeTajgb27h0vKRPupizNj/FMCqo8mFYjZNmx+NOsOwnzsyW/gnb7lUtC7zxVqq1ykzXGk8srDVVacSi2mNlGzWzREiwdlKX6fTlbx+3IRjwCb+KLVgyQ2a1GjctBDVi9Z1BOs2q/fKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiZL8Jhc13u9kBT840U8XZEo9UKoSJkaebqVB5hSbr0=;
 b=dccVkEtVLB7zz5CroP4pOndqnFJ8fPk+y5oRujJ574CWWKnHpqypBql0cNlvF1joofKG/85BwPQlT/yWdZ6horaKF3Q6BEERTkDPdytffVjxnFBD7zwAsEekfFmBk9pAMz5g0nC2u9xfoMJOH+9Aoy5ltZJpK8fNm3NvZc8Los8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Topic: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Index: AQHYl4+Dg7FHxwiGFEGkNOu8rM/Cw61/OECAgAAIBYCAAAJngIAAA6MA
Date: Fri, 15 Jul 2022 11:04:56 +0000
Message-ID: <2bba36f5-5da1-c685-cd49-fec253e97ca7@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
 <d4767bc7-0f0d-7fde-4a9e-c6d4bc7ca2c2@suse.com>
 <a3484e66-4c02-91e6-2ffd-f82b1f96058d@citrix.com>
 <41ea1e23-83fd-d4ef-c279-fad7f5611a43@suse.com>
In-Reply-To: <41ea1e23-83fd-d4ef-c279-fad7f5611a43@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1a1b895-3ed2-45c5-cbef-08da6651da2a
x-ms-traffictypediagnostic: SA2PR03MB5721:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 f5p5iITkjpkopP/Sq58pKaQujdToOrSG616TEgmMkreu4jPa5rZvFuIPt9MDGQvhQzEnLEr+pkSJOVoeLN2BCMoZd1Id6ic0lFQW5r0X0/qZ9/ELqpLEkj0B3qmeuKRvoG327nYNYkMkQvnf38NLbDVjlDrA3jNq8QSbwdAIamyXLzGxUi/NHX1ulO9sRzrjrSjgzDb+d4FP8B6zyRMhsfmWWfnlo/QWsDMTcJxqn0QoCYh0FvrgGdNQWwut7BIz4LPL5sHm+3YFZycqlcJ2Fre8cNoGA16BYPcDZtSWBz1HCR1NI792VkOYu3HE9QXtQG2bPRstVZZaW978RLSAObBsYr8tSrzeQHS0qq4KyfE7KGSQ+Hpngo5vSRyQavWAbHjcjEjVsFUcomfuDindDSHJNg5UuXN41ErX533hrhQoNFgkmfM51OKPG+Jr8bFYOjGCHX8t07C4kzGlYAg3iO+4vKDeesS4YG+SKZN2IGhl7hvBtWLxxD/P8FKo5HsRoxKE7G55PW49ghTGt/jO6k0ht+BTThlkKnWWNedO6ZXWfup3e165ob1ejZBFZ5ghhboQmeYb7NtSo4tkECzLF7b3S4ZZS9izTNXNnMpkCL8jX+JlBOGB2vjsuar+ntfrG/yQ5AMOfXdnOw2GgQrTygWwI+5Cvn2pp8obCTaiatiSuN1Hg3ydPUwYyk+RzDX+7DwdTbfOqFr73jw2iFzZspgy79Ztt61+SB7yMEwtlOQe09F3HWZsc8Im0tIyNjBY6WYlCtRF6nH34EFkpDiWIim7+3iH+dTRwuGxTujXgVVPRfQWk6WyFRj3jktOtXUke3jJNy9XzErytuunL0sMBKUgoRdG+rf478RYzJ9EQDdCFy7GiA16qnQXxkIw/Cxt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(71200400001)(186003)(38100700002)(66446008)(38070700005)(122000001)(83380400001)(54906003)(66946007)(6916009)(31686004)(64756008)(53546011)(36756003)(66556008)(91956017)(4326008)(316002)(82960400001)(8676002)(66476007)(107886003)(6486002)(6512007)(86362001)(478600001)(2616005)(6506007)(8936002)(5660300002)(31696002)(41300700001)(2906002)(76116006)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmtFOVhPS290ZGwwQTJDVEU3ZjAzcjB5Uk81TldMaEtOVDZDenNjY1RETnhQ?=
 =?utf-8?B?bFRIb0VyRGJDMXdiRU1HYjNwekFKdmZpeXMxaGUwd3lFMnFPT0NTd2s4NWgv?=
 =?utf-8?B?cm5KV2hiejdyaEpLRDRuVmlvc2NtMDNnTzhSQWg1ZVVNd05lajJvRlhlMGZL?=
 =?utf-8?B?NjNaeDBiejhvZXNEREg0M2pRYWlFY3FWUzRNc0dZa3BGQ2w0WG5KeFMwZTVL?=
 =?utf-8?B?RG9EdDRRQUV0RWlVNUJqTjNYZnNPL2JZTzVLalE3MkFOK3lTUGUvaFh4RVpQ?=
 =?utf-8?B?cFdNT3dUbGZCSHBhclpmdXdUTis3RWorbmNIaTJmTnhhYTFId3cySllyd0pY?=
 =?utf-8?B?cWs2NnVRdjU2aURzVWlHZGJqNEJBRXFvWVVXU0ladHRaRk9BZFJoWUVhWmZ0?=
 =?utf-8?B?cEpKU3YySmdpMHhqL0EwcDB6S3BnTmkvRUZ3bEVPMHp2WkpTZjY1TUJra3Nw?=
 =?utf-8?B?RnpoRC8wOFBDVmJKTTA2S2puVTVXb0V2Rkd2NVBLVGdsVlE1VEk0OGpiZEhp?=
 =?utf-8?B?aFVhQWtSNEJ5bU1xVWo0RnFReDdOVWcvOU9SeFBJMVVJaS9YNmptN0RXcjd1?=
 =?utf-8?B?VDcvZm90QUVHL2swYnlBUUZmcHpaeXlpK3YrYlhhT2NxUUJ6cjJUbkNqemlp?=
 =?utf-8?B?RUpMTG1uVzBzemZ4UUdyYTZObTFlRXEvQkJ4Q2NNLzU2QlJoMGN5WmNsaFVI?=
 =?utf-8?B?alhEWmtTTGx6R3lVV0p1NFUzbVQxTVZ6VDE2cTJSRUR2WWtRSCtnanRFOUo4?=
 =?utf-8?B?b0tjQkxKQ0NxVU0vcm1oNGk0bys1NlZRYjRZb0lSb2RkbDFqME50MjhrTFlB?=
 =?utf-8?B?RkcwRlQreE8yOUJDV2VPQ3lBNm8wZG5iUVlHRzRUMFNwb0FJYWlmV2FENlFX?=
 =?utf-8?B?Wk02L1VxSXB4RURpaWxLbnBmMFNkV1BjbmhwaEFLc09xckJ3bS9aYldmL0Zp?=
 =?utf-8?B?ODM1dE9RQUFMb3g5UlcxSXZWOG5QVE1EUmpFYzY4RlFTVDQxaWNNbGUzRjRw?=
 =?utf-8?B?RHlzUjlyV3pEMWxweHpnK3ljdVdkZFAzVzBPSkxNN1czdWV2eWI3bWtCd3Bz?=
 =?utf-8?B?RTBwKzVxbmx4dXdOcjZFWFFWQnNTVWg4ekRPaDYyU0U0eHM0TDhiZjIzV1Z2?=
 =?utf-8?B?QzZOUU9KRjlUeWdIWWg4NFFHR01nVFlBcnhXSllEd1hjdDRNQmFMSmlHQnh4?=
 =?utf-8?B?SFZqQ0RnRnZzYW5MdzVsN3orWGphU0E0YVMwMll2aDZTWTlCNm5EQzFPeW9Z?=
 =?utf-8?B?MERqM1NVUDNYNGp6VlFOQUc4SVpodTkrNzVFQWZ2WUwzek9sejluNzhReldQ?=
 =?utf-8?B?TDdTZlJlaDFNQ2QzaGlZSmkvYVFqYWNnMEcybHA1b1lXM3lQNitIUmFNc2NW?=
 =?utf-8?B?bm1GTUlvV2pQR1ZGejZYczdNTXIrazNjbllpMDdBZFQ0eDEwOWtETFZyVU5j?=
 =?utf-8?B?eHlnd05qd2cyY1lhQit4QXZJWEd3SXJDdWY3dEd1U2N1ZWc3dEZ3K0lwazVn?=
 =?utf-8?B?V0hYRXBUeGVLVnNyaHZTTmxTYWFTL29FdWpnakp0czJJY21hbEtvbkFhUGpa?=
 =?utf-8?B?VlRjTDlLMXIvd29Xc3J3N1drYlN4YmRldk1QRGM1WTRIbUdCTXlXTGFvWCtU?=
 =?utf-8?B?M2psazA0SFRmOWpvWmc2VnZBUUxTZTAwUSt3VzduQ3BNbmg0MmJvUkc0cE84?=
 =?utf-8?B?TUphQ0VaTy9yb2ZrMkpFZXBXbk4xbTZNRGdlMmUzeFk0YVFWQ3pLanBrZ01j?=
 =?utf-8?B?QTIyUmJEN1Y1bmJQa0d3MEhHM1ZqbGNsNDJrWlltTVI1N213WXNOY2QyTXl3?=
 =?utf-8?B?QjN5WHBOWGVoVnZaQU5PVEtVekJBYXF4ekdlUmNZOXlxWTcxbmx1Mnh0TG1k?=
 =?utf-8?B?MStwK29WV1FCY2hRNVg2Nm51eGRkMkR1SFQ3WGtvMnYyZHlyTVUydHhnWGN2?=
 =?utf-8?B?TFJIcWROc0FYZVF2Y2NDbC9wY2x4WUtUOE5hSzRlN0grRERmNllLa2RtQ0VM?=
 =?utf-8?B?UTFKQkJORi9LWVVoeDd3dUJtU2FMZmhjeVlYaCtQb1luMHBKZm1KWXVBUERK?=
 =?utf-8?B?emdyN01xL2tkdzFYZmRPUy82a1BIR1JtM3BuVGVIQkRRMEVrajl6TGVjT0VD?=
 =?utf-8?Q?M6BF6F98bd7BRYNCnRhVb0DW7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9838B3BE6AB9EA489DF7D8F0610972A7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a1b895-3ed2-45c5-cbef-08da6651da2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 11:04:56.4499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lufKE+qhskFD65s4iKl4Op0cvOdfg0qzAhEsR3nhmUSfl2qCC49pXVyxt2rYJ0PVeTchUWWOc5VbYHd2sQbFnqWQEaeCcflep6OKvcNuB3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5721

T24gMTUvMDcvMjAyMiAxMTo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjA3LjIwMjIg
MTI6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNS8wNy8yMDIyIDExOjE0LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wNy4yMDIyIDE2OjM5LCBBbnRob255IFBFUkFSRCB3
cm90ZToNCj4+Pj4gLS0tIGEveGVuL3Rvb2xzL2NoZWNrLWVuZGJyLnNoDQo+Pj4+ICsrKyBiL3hl
bi90b29scy9jaGVjay1lbmRici5zaA0KPj4+PiBAQCAtNzgsNyArNzgsNyBAQCB0aGVuDQo+Pj4+
ICBlbHNlDQo+Pj4+ICAgICAgZ3JlcCAtYW9iIC1lICIkKHByaW50ZiAnXDM2M1wxN1wzNlwzNzIn
KSIgLWUgIiQocHJpbnRmICdcMzYzXDE3XDM2XDM3MycpIiBcDQo+Pj4+ICAgICAgICAgICAtZSAi
JChwcmludGYgJ1wxNDZcMTdcMzdcMScpIiAkVEVYVF9CSU4NCj4+Pj4gLWZpIHwgYXdrIC1GJzon
ICd7cHJpbnRmICIlcyV4XG4iLCAiJyR2bWFfaGknIiwgaW50KDB4JyR2bWFfbG8nKSArICQxfScg
PiAkQUxMDQo+Pj4+ICtmaSB8IGF3ayAtRic6JyAne3ByaW50ZiAiJXMleFxuIiwgIickdm1hX2hp
JyIsIGludCgnJCgoMHgkdm1hX2xvKSknKSArICQxfScgPiAkQUxMDQo+Pj4gSSdtIGFmcmFpZCB0
aGF0J3Mgbm90IHBvcnRhYmxlIHRvIGVudmlyb25tZW50cyB3aGVyZSBzaXplb2YobG9uZykgPCA4
Lg0KPj4+IFRoZSBzaGVsbCBpc24ndCByZXF1aXJlZCB0byB1c2Ugd2lkZXIgdGhhbiBsb25nIGZv
ciB0aGUgZXZhbHVhdGlvbi4NCj4+IFl1Y2suwqAgVGhpcyB3b3JrcyBhdCB0aGUgbW9tZW50IGlu
IDMyIGJpdCBidWlsZHMgYmVjYXVzZToNCj4+DQo+PiArKyBvYmpkdW1wIC1qIC50ZXh0IHhlbi1z
eW1zIC1oDQo+PiArKyBhd2sgJyQyID09ICIudGV4dCIge3ByaW50ZiAidm1hX2hpPSVzXG52bWFf
bG89JXNcbiIsIHN1YnN0cigkNCwgMSwNCj4+IDgpLCBzdWJzdHIoJDQsIDksIDE2KX0nDQo+PiAr
IGV2YWwgdm1hX2hpPWZmZmY4MmQwIHZtYV9sbz00MDIwMDAwMA0KPj4gKysgdm1hX2hpPWZmZmY4
MmQwDQo+PiArKyB2bWFfbG89NDAyMDAwMDANCj4+DQo+PiBzbyB0aGUgdG9wIGJpdCBpc24ndCBz
ZXQuDQo+Pg0KPj4gQW5kIGdvaW5nIGZyb20gYW4gOC84IHNwbGl0IHRvIGEgOS83IHNwbGl0IGRv
ZXNuJ3Qgd29yayBlaXRoZXIgYmVjYXVzZQ0KPj4gdGhhdCB1c2VzIDQgYml0cyBhbmQgd2UndmUg
b25seSBnb3QgMiB0byBwbGF5IHdpdGggZ2l2ZW4gLnRleHQncyAxRw0KPj4gYWxpZ25tZW50Lg0K
PiBXaHkgZG9lcyB0ZXh0IGFsaWdubWVudCBtYXR0ZXIgaGVyZT8gQWxsIHdlIGNhcmUgYWJvdXQg
YXJlIG9mZnNldHMNCj4gaW50byB0aGUgWGVuIGltYWdlLiBBbiBJIGd1ZXNzIHdlIGFyZW4ndCBy
ZWFsbHkgYXQgcmlzayBvZiBnb2luZw0KPiBiZXlvbmQgMjU2TSBpbiBpbWFnZSBzaXplIC4uLg0K
DQpWZXJ5IGdvb2QgcG9pbnQsIGJ1dCBpdCdzIG5vdCBldmVuIHRoZSBpbWFnZSBzaXplLsKgIEl0
J3Mgb25seSAudGV4dC4NCg0KRnVydGhlcm1vcmUsIHdlIGNhbiBoYXZlIHRoZSBzYWZldHkgY2hl
Y2sgZm9yIHRoYXQgaW4gdGhpcyBzY3JpcHQgdG9vLg0KDQpMZW1tZSBzZWUgd2hhdCBJIGNhbiBk
by4NCg0KPj4gSSBrbm93IGl0J3MgZGlzZ3VzdGluZywgYnV0IGhvdyBhYm91dCBhIEJVSUxEX0JV
R19PTihYRU5fVklSVF9TVEFSVCAmDQo+PiAoMXUgPDwgMzEpKSA/DQo+IEluIHRoZSB3b3JzdCBj
YXNlLCB3aHkgbm90LiBCdXQgdGhhdCB3b3VsZCBiZSBhbiBvZGQgcmVzdHJpY3Rpb24gb24NCj4g
Y2hhbmdlcyB0byB0aGUgbWVtb3J5IGxheW91dCAod2hpY2ggd2UndmUgZG9uZSBpbiB0aGUgcGFz
dCkuDQoNCkkgZGlkIHNheSBkaXNndXN0aW5nLi4uwqAgSSdtIGVudGlyZWx5IGhhcHB5IHRoYXQg
aXQgZG9lc24ndCBhcHBlYXIgdG8gYmUNCm5lZWRlZC4NCg0KfkFuZHJldw0K

