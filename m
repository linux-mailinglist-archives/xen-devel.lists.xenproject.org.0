Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B09157558B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 21:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367781.598913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC448-00008G-BB; Thu, 14 Jul 2022 19:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367781.598913; Thu, 14 Jul 2022 19:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC448-00006F-7N; Thu, 14 Jul 2022 19:00:00 +0000
Received: by outflank-mailman (input) for mailman id 367781;
 Thu, 14 Jul 2022 18:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4joA=XT=citrix.com=prvs=1872ec3d0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oC446-000069-3s
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 18:59:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25dbddd9-03a7-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 20:59:56 +0200 (CEST)
Received: from mail-bn1nam07lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jul 2022 14:59:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5875.namprd03.prod.outlook.com (2603:10b6:303:90::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 18:59:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 18:59:49 +0000
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
X-Inumbo-ID: 25dbddd9-03a7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657825196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nRcjv3beWnD4LWIRFTqpeKJtj5MF12QYMuqTM7uC+D8=;
  b=f5KLC3B5BzOMxuIZp2JTYKROQG7vIRls3hz7/XAyXRdpj8cvoZ3XuRBz
   7CzYgCBDVwq9OLa2gYliEozPmZTTcj8MuqJsYAHEjs7MKrZx5G+uJeto5
   txDaZHpXCEi+X7mApGXdwauFkdAz6h4znxssqGhxziT6RgC5bb9+vZX3/
   o=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 76257622
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8HawFqjSMldTjARuSmovij3SX161JxAKZh0ujC45NGQN5FlHY01je
 htvWz+FMv2LYWrzLtwlYIy280pSuZGGnIdqGQBprXhgEyMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kur5GtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eZrESw/d4DHpy9
 aImKgA9aw2SgcO1z+fuIgVsrpxLwMjDGqo64isl5xeASPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF8RTJ+8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSz227CRx3mTtIQ6EoeV5t13oGKq4E8zTx5NcGufuOCooxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkwZRTcHRtUgv8IyQSEC3
 0WM2djuAFRHtbSJSXOQ6/GIpCmoMCw9NXUFeSgCSAIE55/op4RbphDFQ8tnEaW1psboAjy2y
 DePxAA8mrESgMgjx6i9u1fdjFqEvYPVRwQ44gHWWGON7Q5jYoOhIYuy5jDz8vJoPIufCF6bs
 xAsscWE8PoHC53LsSWXWfgMB5mg/fPDOzrZ6XZPEp875nKS8nisVYlK5Xd1I0IBGsMNYzSvf
 UnctBha5J5QIGCCc6Zrbpn3Bd5C8ET7PdHsV/SRZNwXZJF0LFCD5Hs2ORDW2H3xmk8xl615I
 Y2cbcunEXcdD+Jg0SayQOAel7Qsw0jS2F/ueHwy9Dz/uZL2WZJfYe5t3IemBgzh0J65nQ==
IronPort-HdrOrdr: A9a23:Gfbr36G+W6Bs4gpBpLqE4ceALOsnbusQ8zAXPiFKOHhom6Oj+v
 xG8M526fbUskdzZJhCo7C90cu7IE80nKQdieJ6AV7LZniAhILCFu5fBOXZrQEIYxeOk9K1rp
 0QEZRDNA==
X-IronPort-AV: E=Sophos;i="5.92,272,1650945600"; 
   d="scan'208";a="76257622"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6Y8F3B8MVEnt5dxyc3VszVyL6kqmLnzrR4mXSq/0jajoyBjmOWwBIW4eJq8eKTKPjg2KmePWWzqGlRdD0lAfEK1O45IY8dMH4gXWVnuHn4k60Ejqha7BYKg+rw+GVEoP4r2tfoMQojPJqf60uQXSmOK0uUhXsZ8MSJ5/FgWUzQNYaydd8X3tQi19w1HgAAJYS6MHSnErheckew6kX3DMtGO2CwA39Pkq19LdpjI29+N7Pvv0L9UccCGrDC5pgahQVoIHvAF+5pYYV9sXG1Ho+GvnKWaCvfEeUAvhvuGEKngL8KUnV/6KUrLWB475pkF4Gb8Oc6PQ54poOws3tGUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRcjv3beWnD4LWIRFTqpeKJtj5MF12QYMuqTM7uC+D8=;
 b=BREWy5r+Vy+r7oKit/DezKRzRU+fpxAEyqwBXVU4RTzhTbsY41jmYHyQhWRUMZueitKYYAq73UlbbAx+CYA9e7v3W0CjK76ZkyTfqvOKBxkytbhsPjzhszDcjO+IG048S+oPGxJrt5ZTmtX+Aa6RtRy26Acv47bk7A8YOTAg5+vjEwdKiHg+3p61KVpwg5kQJm4yVvuTQPO3XheJx1VZyw/x9KlIW9bb/L+tyTs1y22XkRGTPsP+zfA42iVkE1pD+M8n+vdmt0VFgyr/OLnx/2ZI33iw11tDBg+xyPkBLBu/q0dR14AeX56BGWYAP0aVYrXDcz5Ju6VWhotD6FtKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRcjv3beWnD4LWIRFTqpeKJtj5MF12QYMuqTM7uC+D8=;
 b=KCHVDMM1cET0UB2pWcxnYmf4KY8McGihHh5p51FYsa6K/7rkpkABuZVxFQP9TtAJgrXXmgig+syF2iPwdd1x2jVbEeyo3i7oOC0neMyn4fXOL6aLnef50txjgfgxTfm86VRr8uvDrfscFEZn3bvWTrwT8Lh7Tmc+9USY7fF8mQw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"marc.ungeschikts@vates.fr" <marc.ungeschikts@vates.fr>
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Topic: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Index: AQHYl4+Dg7FHxwiGFEGkNOu8rM/Cw619+TQAgAA/dYA=
Date: Thu, 14 Jul 2022 18:59:49 +0000
Message-ID: <57df4df1-2145-72c6-7268-eba6de7c6a55@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
 <c62efff7-7817-9d17-ac30-04957f14d4a2@citrix.com>
In-Reply-To: <c62efff7-7817-9d17-ac30-04957f14d4a2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d4ac924-fca2-4958-5015-08da65cb06e4
x-ms-traffictypediagnostic: CO1PR03MB5875:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SqSvOcgAjaKX1s89WBP0q0MPWeWu3EHB6KidQ0Wd6FlQZHtBQ1fhN6erqlC/bAsQmRvYYRm360+kkz6NzGnO4Spr33IAQAuErgntZ7iWYqAU9Z8jycKvnloEm0sU7WdSUnF77FEl7MFpHXungobM2Vkh0kEXvgaXKvelAE2CzFsnocrXSdAny+nj1XizhmK4WxXWZ/kq0h9JkWdSVJp84qO6rtjVUnWtOR6xr/Tk6Dtkvu/OJuftrg5reU6anTIjdYzHkWQ9hvveulw+XgeOay9MoTf9+S+7k+ZY6HD1R7FvqMZxmn/ZdhJKUTc9Xbj/Eik7hHaPXrNDyPwwfGAKviG9xiwZsnDMPuWvuu7P59o3SCSImnZ1TazrltTulqeJABi8cUBkdiB757fJdExv013+1+YOYEFD4fA9Ks9FH41unsepBBr4xwHfFMI3Zmeh1cEAT7cmyrBA9LeVfz3EVcZN6sx22YhYI3wl169CZlmnaSX0zSAKJeBsiPTJv34Zk51I7iiiBSanR46QKXTn/TeChpWtYknL4lYAlhnW2hXhHyKABKpY4NKWxKxcB6u/5Oc3x8VIVNPe9imN8ey2GA4UHaCt143fY4rrpOf+XCka/S+BQZ+Uw0VZBhQ4LeZKEVwLn/fdHpTF7w+hCuDENzeVE7zDo7Mr+gjxQOCe4h3QnNgYIB2z4La3ZOOj9BuSRP1r75QNenNlhUzzakovnUmoNr9v/8v6EUv8s3JqusVJT7xffUVqir7RffkgifzKuqw4hBe4E4Ck2N4QBYxgN/y+Nhcn48sfRa7jrYkI2oBWvfqQQP+X835+32EqnHumfgqA6VR7M8MErG41/Y7Je5ljPvGYxDH9EQ3ryXVMFMlb5l51/VhKUAtWLhZp1M5FKDZuVAePppjd9sunA6A6Nfiy99tnW8IR+43ehc4/x0g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(71200400001)(26005)(6512007)(53546011)(6506007)(478600001)(41300700001)(5660300002)(8936002)(7416002)(2906002)(54906003)(8676002)(110136005)(316002)(6486002)(66446008)(76116006)(91956017)(66946007)(66556008)(4326008)(966005)(64756008)(66476007)(122000001)(38070700005)(82960400001)(31686004)(38100700002)(31696002)(86362001)(36756003)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yk4wVHA4MWpoM09WL1AvNnBsTWRkRE9Id3VPQXorKzhXTW9qak1GMzJnNjlW?=
 =?utf-8?B?cVB3MjRnaGkxTDV5VlFHQk40d2I3eUhmcWNuQWFOQi9WQVoybENNZmV2cWRQ?=
 =?utf-8?B?b1BYbFZYdzhsSUlVRUlWcWNnd0FSbXN0VVN5S0UxZjd0SjZoNDJVYy9JdVY0?=
 =?utf-8?B?ZmtpYm5wTkpmRmxEcVBGVXBuWnlkTnVuQ2I5ejdKOHNBNGowTlhPNmxkQjkr?=
 =?utf-8?B?SGtjN3o3bWR1Y1RIaUp0UnBaSlJlaXlvM1REM1IySnRJSXQvZTVnem9xRUU4?=
 =?utf-8?B?c20rdmtOQmtNdTVvQkNVNUJQZE5vZ1BNeXZOUnpCaTNIc1J5dWEvMkRhWHpO?=
 =?utf-8?B?eDNyUlFpMys3dFFPQUtUME8vaTRpV0xkU3NiUWVYTkZkOHBvaytVRkMrbUZZ?=
 =?utf-8?B?bENkeldid05HNjAyM0R2NXhDUjlMWXAxN3VMQUxoQmZLRGQ2UmlkRVJIVDFP?=
 =?utf-8?B?cDdKUFhIT2dKZnFWL3lnTVpiY21MU1BXdkltcUpVQmxQUnZKTjE3UkVRTmZk?=
 =?utf-8?B?R2FUYStwK3VzdDcxZzlDSkUxU0ZSZjcycGFrWU1iV2l2WTBSMnk3VXkrZDhU?=
 =?utf-8?B?VCtuTEpoQStSd0FURGtXaERGVTNEOC9PellubFVrZHpOeWg1UGMrNTBmYndu?=
 =?utf-8?B?TlNLSUFZa3JWRVdUNW0xZ2RvMHpHVVRWdjFHL0tOeURkN3FUbElvRkNYeVlC?=
 =?utf-8?B?R1ZhQU1DU0dSS3BBbGlXQ2FHU3IxUTFwRzc3eDNGRlk4UGVvS3VWS2xtbXBI?=
 =?utf-8?B?OGxnWm1vb3B3akp1REZ6T3cyK3VYNzRsUEYxMzh3TXVZVEdCa3pNQVZNZlox?=
 =?utf-8?B?UmJRT0M2WmdqWVdiQ3plbWZzdVlMWXlJRlRXRjFtZW1iTjJpaVpWNlRScXIr?=
 =?utf-8?B?RW9aU2V0QUFOdEVhNFNpSEJ5cDVEMEwwNkJQYkhEYk9CblRZM3A4OUtvbGth?=
 =?utf-8?B?cjl1MUFFdWRNOFpqM0xIWm5CSDhSK1pieGFEVzFrNGxFOVl3K0Z3ck8vaTgv?=
 =?utf-8?B?K3ZLTDFXQk1FdzFQMytjYWZMakFqZDV0dCsrS2gySlRKY2ZtUkRaeE9oUHhO?=
 =?utf-8?B?bkpFVzZMcENtVFFMSjZMZnZCcUtaUzNBSVQ4VTBlcTdRaWRQYk5NYktLOHYv?=
 =?utf-8?B?Uzl4VXRwb2JvdCtKREEyWmdtOWc4ZFJMaUxsa2lQcHp2U09BNER3TldYdm1I?=
 =?utf-8?B?MkExWmxCWnlzTFJUNFM1Tzc4WW9tRXRNYUI4NTc1b3lrUm5NSzBQcmJtNDFF?=
 =?utf-8?B?enRrUUFZWHVoTnYrcURiWjlub1NXdkpUa0pZNkJRdVJERW9RMDd5STVjcEdh?=
 =?utf-8?B?TWg4MjVkcU1QMkJFRjdIMHd2VFRhSHBVMXNMQWxJUmZwN3Noc202Qk8xeS93?=
 =?utf-8?B?WGJDS1pNUnp4aWoraC9FbSswTGMwQzloR2U3Um01WnJPUGRwaWlWaTJOcWJJ?=
 =?utf-8?B?VlhSWkMwVzQxd0s0N1gvdjFwN3dWOFNiWTFMaERNVitEM0ozQXlyclJacXpp?=
 =?utf-8?B?MGFzSkYyTzkxQnV4OXZDKzdSRTBTV1ZkdW40Y1RSV0NqQk0xbklZN0RUOUlF?=
 =?utf-8?B?a1RuSGNqOWoyTS95ZENtRnovWktKNmxvK1ZuNDdodTVaUmJEWXQ4M01ONWt4?=
 =?utf-8?B?NkNZdDVnZkNmaGpaM3VlMmRyU0lFcDZnTGFEU1ZGSDBNRWNxbCtydTAySGoy?=
 =?utf-8?B?SUdLZEJiWHdXLzFiajhjVjdGeUdWQlBLRFlCQ05QTUJ1VHBzR2JUMFpTb1lt?=
 =?utf-8?B?OG5xU0ZVZFJKYlMwQzIyRmUyY1NwQWFGYnB2aUY3VnU5YTRiRk4wb050T0dZ?=
 =?utf-8?B?N3RQbGhhTVZQY1g5clFNWWpVaythdTBjb09DNUlOeURnVytiT3l1SWZIMUNS?=
 =?utf-8?B?ekJTc0x5ZE96aVZvKzNiT2RFVlZxandYUGFYOEJvVk51VVhSazRtbmVzV05L?=
 =?utf-8?B?Rm9YUnJNdjNFRmNkTUhZUjFhb1BhUnlONEFFQWVLV0xacXFQQTZNUjNzQzZH?=
 =?utf-8?B?YlEwR1Ewc0tTK0ozcWhNUTZ3TlA1cVVRaGVyc1ROdzI2VlpwdUZPbkhkWmNT?=
 =?utf-8?B?bFMrYnJOREU3OE11dmZHUm0zVXlldTNjSEpsM2sweXhKZmIySW85L0gyL3lN?=
 =?utf-8?Q?0jKp7MMmBqVB0LYCi2WhMWNZi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01095F175B638844948B13F9EA93ABB0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4ac924-fca2-4958-5015-08da65cb06e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 18:59:49.4426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaE5EKZi+sPlqZfgZdk2j/x0NQPBH21aNOQb0vx/zdJsD8Y+4umW52UA1UUjER8KNTN1pMTEY4xqEuHcqkje8+IawyFmsqg3KqK6WWbBUIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5875

T24gMTQvMDcvMjAyMiAxNjoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTQvMDcvMjAy
MiAxNTozOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+PiBjaGVjay1lbmRici5zaCB3b3JrcyB3
ZWxsIHdpdGggZ2F3aywgYnV0IGZhaWxzIHdpdGggbWF3ay4gVGhlIHByb2R1Y2VkDQo+PiAkQUxM
IGZpbGUgaXMgc21hbGxlciwgaXQgaXMgbWlzc2luZyAweCR2bWFfbG8gb24gZXZlcnkgbGluZS4g
T24gbWF3aywNCj4+IGludCgweDJBKSBqdXN0IHByb2R1Y2UgMCwgaW5zdGVhZCBvZiB0aGUgZXhw
ZWN0ZWQgdmFsdWUuDQo+Pg0KPj4gVGhlIHVzZSBvZiBoZXhhZGVjaW1hbC1jb25zdGFudCBpbiBh
d2sgaXMgYW4gb3B0aW9uYWwgcGFydCBvZiB0aGUNCj4+IHBvc2l4IHNwZWMsIGFuZCBtYXdrIGRv
ZXNuJ3Qgc2VlbXMgdG8gaW1wbGVtZW50ZWQuDQo+Pg0KPj4gVGhlcmUgaXMgYSB3YXkgdG8gY29u
dmVydCBhbiBoZXhhZGVjaW1hbCB0byBhIG51bWJlciBiZSBwdXR0aW5nIGl0IGluDQo+PiBhIHN0
cmluZywgYW5kIGF3ayBhcyBJIHVuZGVyc3RhbmQgaXMgc3VwcG9zZWQgdG8gdXNlIHN0cnRvZCgp
IHRvDQo+PiBjb252ZXJ0IHRoZSBzdHJpbmcgdG8gYSBudW1iZXIgd2hlbiBuZWVkZWQuIFRoZSBl
eHByZXNzaW9uDQo+PiAnaW50KCIweDE1IikgKyAyMScgd291bGQgcHJvZHVjZSB0aGUgZXhwZWN0
ZWQgdmFsdWUgaW4gYG1hd2tgIGJ1dCBub3cNCj4+IGBnYXdrYCB3b24ndCBjb252ZXJ0IHRoZSBz
dHJpbmcgdG8gYSBudW1iZXIgdW5sZXNzIHdlIHVzZSB0aGUgb3B0aW9uDQo+PiAiLS1ub24tZGVj
aW1hbC1kYXRhIi4NCj4+DQo+PiBTbyBsZXQncyBjb252ZXJ0IHRoZSBoZXhhZGVjaW1hbCBudW1i
ZXIgYmVmb3JlIHVzaW5nIGl0IGluIHRoZSBhd2sNCj4+IHNjcmlwdC4gVGhlIHNoZWxsIGFzIG5v
IGlzc3VlIHdpdGggZGVhbGluZyB3aXRoIGhleGFkZWNpbWFsLWNvbnN0YW50DQo+PiBzbyB3ZSds
bCBzaW1wbHkgdXNlIHRoZSBleHByZXNzaW9uICIkKCggMHgxNSApKSIgdG8gY29udmVydCB0aGUg
dmFsdWUNCj4+IGJlZm9yZSB1c2luZyBpdCBpbiBhd2suDQo+Pg0KPj4gRml4ZXM6IDRkMDM3NDI1
ZGMgKCJ4ODY6IEJ1aWxkIGNoZWNrIGZvciBlbWJlZGRlZCBlbmRicjY0IGluc3RydWN0aW9ucyIp
DQo+PiBSZXBvcnRlZC1ieTogTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPg0K
Pj4gUmVwb3J0ZWQtYnk6IE1hdGhpZXUgVGFycmFsIDxtYXRoaWV1LnRhcnJhbEBwcm90b25tYWls
LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPg0KPiBUaGFua3MgZm9yIGRvaW5nIHRoaXMuwqAgWW91IGJlYXQgbWUgdG8gaXQu
DQo+DQo+IE9uIHBvbGljeSBmaXJzdCwgd2UgaGF2ZSBodHRwczovL2dpdGxhYi5jb20veGVuLXBy
b2plY3QveGVuLy0vaXNzdWVzLzI2DQo+IG9wZW4gZm9yIHRyYWNraW5nIHRoaXMgYnVnLg0KPg0K
PiBXZSBzaG91bGQgY29uc2lkZXIgaGF2aW5nDQo+DQo+IFJlc29sdmVzIHhlbi1wcm9qZWN0L3hl
biMyNg0KPg0KPiBpbiBvdXIgbGlzdCBvZiB0YWdzLCBzbyBHaXRsYWIgY2FuIHByb3Blcmx5IGNy
b3NzLXJlZmVyZW5jZSB0aGlzIGZpeC7CoA0KPiAoSSB3b25kZXIgaWYgUmVzb2x2ZXM6IHdvcmtz
Li4uKQ0KDQpZZXMgaXQgZG9lcy7CoCBHaXRsYWIgc3VjY2Vzc2Z1bGx5IGNyb3NzLXJlZmVyZW5j
ZWQgbXkgZGV2IGJyYW5jaCAuLi4NCg0KPg0KPiBodHRwczovL2RvY3MuZ2l0bGFiLmNvbS9lZS91
c2VyL3Byb2plY3QvaXNzdWVzL21hbmFnaW5nX2lzc3Vlcy5odG1sI2Nsb3NpbmctaXNzdWVzLWF1
dG9tYXRpY2FsbHkNCj4gaXMgdGhlIGZ1bGwgbGlzdCBvZiBwYXR0ZXJucyBhdmFpbGFibGUsIGJ1
dCBJIHRoaW5rIHdlIHdhbnQgdG8ga2VlcA0KPiBGaXhlczogZm9yIGl0J3MgY3VycmVudCBtZWFu
aW5nLg0KPg0KPg0KPiBJIGFsc28gd2FudCB0byB3YWl0IGZvciB0aGUgcGF0Y2hldyBDSSBydW4g
dG8gY29tcGxldGUNCg0KLi4uIHB1c2hlZCBiZWNhdXNlIHBhdGNoZXcgZmFpbGVkIHRvIHBpY2sg
dGhlIHNlcmllcyB1cCBmb3Igc29tZSByZWFzb24uDQoNCn5BbmRyZXcNCg==

