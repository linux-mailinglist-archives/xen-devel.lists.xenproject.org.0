Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05C55B82C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356277.584412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5j7Q-0006GA-QU; Mon, 27 Jun 2022 07:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356277.584412; Mon, 27 Jun 2022 07:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5j7Q-0006EA-Mi; Mon, 27 Jun 2022 07:25:12 +0000
Received: by outflank-mailman (input) for mailman id 356277;
 Mon, 27 Jun 2022 07:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=voCP=XC=citrix.com=prvs=1709c1826=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1o5j7P-0005xG-Gd
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:25:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45441373-f5ea-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 09:25:09 +0200 (CEST)
Received: from mail-sn1anam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 03:25:05 -0400
Received: from MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9)
 by CO3PR03MB6791.namprd03.prod.outlook.com (2603:10b6:303:175::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 07:25:04 +0000
Received: from MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::e0da:b315:76f5:37f9]) by MW4PR03MB6539.namprd03.prod.outlook.com
 ([fe80::e0da:b315:76f5:37f9%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:25:04 +0000
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
X-Inumbo-ID: 45441373-f5ea-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656314709;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=yN03zbmEe0prQ8YQ5CJ2engNoW7qr0rHH/OFoSAUPb8=;
  b=QPnluloemBOkEzGxUcrbypYTMmVlRibySQ9wd1+uipyaoJy8JBCMpCHB
   l9gQI9m+TmNMkncQztBzc3c3H9A2gPO/PbOx2F3UzEly/H0iOMGfQAMNQ
   f1g/uO3YpsmNhWH9JXl0SmUi2aULGNieqoYlYqaOU8Xha2quTbBzBfmLA
   E=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 74894703
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7egbDKg9Zgvb8CWiSFudKFMtX1610BEKZh0ujC45NGQN5FlHY01je
 htvXjqPPanfYmSkKN91Pdi2px5X6sPRzNVrTQM+rnpgEXsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXVnT4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSMxDITlybsvaD5dEnhsepEYoIbtKlHq5KR/z2WeG5ft69NHKRlseLY+o6NwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIAegG5YasNmRJ4yY
 +ISaSBudwjBahsJPlYRBJMxtOypmmP+Y3tTr1f9Sa8fvDSDnVAuiOOF3Nz9UNKSZeELjluju
 kmFwkTiQTsoPeGnxm/Qmp6rrqqV9c/hY6oCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80iY2tq0z6EyDR8HwRQGlu2WDugMAWt1WCKsx7wTl4qjb+QGCHUAfUyVMLtchsaceSTMm2
 1CTlvv1FDdvt/uTUnvb+bCKxRuwMyUIKW4JZQcfUBAIpdLkpekbghvRQ/55HaWyj9mzHiv/q
 xiRtzQ3jbgXic8N1o248ErBjjbqoYLGJiYp5wD/Tm+jqARja+aNeIiA+VXdq/FaI+6xTESFv
 XUCs9iT6qYJF57lvCGJTeMEWqyn5vOZKzDCiHZoBZAq8znr8HmmFahK5yp0PkBuMcAsdjrgY
 UuVsgRUjKK/J1OvZK5zJpm3Us0sxK24T9D9DKiIN5xJf4R7cxKB8Gd2f0mM0mvxkU8q16YiJ
 ZOcdsXqBnEfYUh68AeLqy4m+edD7kgDKan7H/gXEzzPPWKiWUOo
IronPort-HdrOrdr: A9a23:KxjSO6u/IRG/tshqRv1SIvpO7skC2oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKdkrNhR4tKPTOW9VdASbsP0WKM+UyGJ8STzI9gPO
 JbAtBD4b7LfBRHZKTBkW+F+r8bqbHpnpxAx92utkuFJjsaCZ2Imj0JbjpzZXcGITWua6BYKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/H2VwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5p+7Y23+4gowwfX+0SVjbdaKvi/VfcO0aWSAWMR4Z
 rxStEbToNOAj3qDyeISFDWqnTdOX4VmgPfIBmj8DTeSIXCNUwHItsEioRDfhTD7U08+Nl6za
 JQxmqc84FaFBXagU3GlpD1vr5R5ziJSepLq59ts5Vza/ppVFZql/1XwGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlJhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OGDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowlLau3ieffFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.92,225,1650945600"; 
   d="scan'208,217";a="74894703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKYMicz5E6/Qd/58EzDdg3nvV+46NGyyf8JlxcjQCUm9AcIfmPYpWAkxAkg+m7xyNfARLS2t0PaQHpatLl7vS48Xfh43RFIt336qYfGhx65VkuCUcmh+EuKaOzxc3ecTuuTw94rKntW9PGvLjI0cmNMWi+GClAt5vxJm6q364nR9Db2R6hN0g4EhoGlIMgYnUFDFVrJjeIntJUJ7lX7bWjNHaTz8PHKjO4KyZHTn4XWcKaU3j4/rssgz/seHbmA2f2aTtQxZ12omBx75TGTlK0GEZw7S1Wmr24dErOegRPIpVh8ImGOEWii3yw7z2T/JOL9YRpDzgVeup/A9VKW/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN03zbmEe0prQ8YQ5CJ2engNoW7qr0rHH/OFoSAUPb8=;
 b=HIeKYGp55lt00q8WJT5svPuoNAJMNTNr/DKzCNZ3kI9ncVG2WdEcFt9p+5hAEi3ixHnZr72LpYVmcVViY8LUL4ilHDudSyN/FdRTF+ym5RQaLZZ2I+d/fnEXky2T/2NzZyLevHlbNwuE5I9bicxOzjuMv28v8Jraku3hN/aS9b3LkkETHTas4vsGQVEQgvungNgxuJFDRt3WOx3gDRbe2hDSqw5GOQS3nI/GeAWPKfTMxh+sVCt1jiaI+A+uZ27k09wEgAwM3bRyygvs/OD1OgWjIWzMAK0P0m8fi+8VICt9leTRwxh2BJqpj/b/cBAJDjYPTCfzqcVRrhEIobXttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN03zbmEe0prQ8YQ5CJ2engNoW7qr0rHH/OFoSAUPb8=;
 b=PZ7DsahCeq9CS/EQ2Wq2wyPujTZ/6TbzyxhBC74qlKCKFA7B20+gNccVW03UpxRV8bJi3uWXtC5TNyNdI7xxGiMBiA6Ww7xdLY+NaS/xIllrW8o1RughHSjqnZxiDcmgofNi+1rtkdKIEk6Ha4QT7QYRS/KJjV2QgkZTxEzOEc0=
From: Christian Lindig <christian.lindig@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, George Dunlap <George.Dunlap@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	David Scott <dave@recoil.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Tim (Xen.org)" <tim@xen.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3 00/25] Toolstack build system improvement, toward
 non-recursive makefiles
Thread-Topic: [XEN PATCH v3 00/25] Toolstack build system improvement, toward
 non-recursive makefiles
Thread-Index: AQHYh+QgqCvAj4yQ00ukgLMeVhoHyK1i3kCA
Date: Mon, 27 Jun 2022 07:25:03 +0000
Message-ID: <3AB6FD34-EAAB-4644-9060-C83DBE617992@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 717d1fbc-76f6-496d-a134-08da580e2766
x-ms-traffictypediagnostic: CO3PR03MB6791:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OawPuh8l5v12vlrTzD5hP2U7iS2G+rGStjcZuwTs9ctEgSBHsoo/JWJhryhLh/37PcOBwVFweUTWf7/zjKZMPgwGYzI78Fj6qSAtHYSRRk/8nzWDNNpIXXBN63T8hZgKreHrC4ePQOhkRAKnu/HVl16Ow4j2AHrif06muyyLLfzQiy5CYoCeIanr8DdQOCngV11cjJ2D33xSXFD1jnWq4KMcc+ADwzJOxCvLsU82gD0ZWdeZlcvJyvRlQylWEMdojyG8jJvteMvZaJ4HO52aDdjXCqtHTCANUvZmkI9cnBnXIehV8T71PvxqjfohquYfdWLEV8Bo1aU9qvFeqOJmqBUT4KsK58fKMvhFGVgovvDa24R3aH0pT5P3vIU8U5UntYe80Bf77iFTKyqJu/QVw2ocvUY2Bm5CT7vLBWJtsZmuWX7bGgp9ESS6y+1c1lGTIPw3HKKkj8sIhYIbX9nmsuwd4+o+5sE2hz82+lwdg3CRH6rUhhLRmcoQ8ROwdcp9yEl8rZACS47+tQ6OaB8RBR5eG7zz6OFBjxpoeAoHzPjsfGkkYyZqakqRfF1pqsjl84iALgFXaKR3vpnzA/5lPAABHImI3I3wphDt5gW7hCLaVHidBQd0QDjaNaeEkrnLXYAp8k+CULQDxT5wEbcGg0Wmr/yKnBtt08Q1sCQMlPxAl0n+Z8huUXhSraK44EQ6R2NDfAYw9QgthW9c4NqHCYUqtXG6JnOimdOnLJ9UN62Um550YXjifOFtj9zibWXC6jA6CGnn9ZmqNbXRlXGijROehi9sVE5lqSHl/4DSwftz4h87wWw6cJAPkyiW8MM5bVCqKiDh5g/I0C2Zk3Xh8A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6539.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(44832011)(36756003)(33656002)(2616005)(37006003)(66946007)(66556008)(66446008)(66476007)(316002)(186003)(71200400001)(107886003)(6512007)(64756008)(6636002)(91956017)(82960400001)(76116006)(41300700001)(38100700002)(86362001)(2906002)(478600001)(8936002)(54906003)(6506007)(6486002)(38070700005)(8676002)(4326008)(26005)(7416002)(122000001)(53546011)(5660300002)(4744005)(6862004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aLa/z5guVC690SUzWudUwhJfc+tD4HZhGwoGjn+X2sc7tvydJfgFdesbqLiA?=
 =?us-ascii?Q?wLCPdi17dPQ7wBNpI/K0BZcL7WiZhCM6eXNljOYJ1AGeuj33eTyeD6JuCsNz?=
 =?us-ascii?Q?AoWYzhdxnqHhRGkEgnCWe9FVXaeuWVhQcnrUlVNP6agIC4y1v0gQUDs4NiFM?=
 =?us-ascii?Q?oYGqS0ub3bgd9yNzft6s1tVRQy8tGtlHWqzKDcVYNZ7lpjZ6/L4K7/Gf85O1?=
 =?us-ascii?Q?nKO/t+0Yh+LJrghmr934SziuQ3SDqZlpAgsMBeTAXJJlG4G/Jk99K/icIeq0?=
 =?us-ascii?Q?O2WqvAfidXAASTWYhTr35XJPWVNbrOYu7VkBtx1O/pyPFAqAZInEYhSIsQy1?=
 =?us-ascii?Q?xFedzf2rXkCwzRt+lQnK7eXnuvxSDqTpSuT7Pzbv1175DUYJymYulPsswfBV?=
 =?us-ascii?Q?uGT2wCYmhWJNuAKjHlBkdSV+JbfGWATCiZYjFPoIDK+oWhqC2629PT0r9rIx?=
 =?us-ascii?Q?tjjzelZY8wYwI1vS8zyLsIs2Pq/rScfzYlrz8DfYZjSNWNmfHZJwafoIrK/k?=
 =?us-ascii?Q?dKsHg2TFK6gHzrLY0ILroGbw0qsNY+cWtXJZvZAxlp7wFHGUzR4Iq5Ys8sTM?=
 =?us-ascii?Q?3J4UFvfOZ9Ptr7dxLYa5S/1gwoymaoFI8fQo+FWLy/92Yw8HfHLEGjqOeFI3?=
 =?us-ascii?Q?xBBDiwYO5LUKEVHZrq1ZZrWbX2+RJcyza7S2bDYY8vODj8/z7H6EmK4S8f1X?=
 =?us-ascii?Q?bfnVuABvTyl/AW4E7iftk8aaSM5OsVFZN3VhGNTQ9d9Hb8Te3sAfWqeeVh1n?=
 =?us-ascii?Q?xZ2L2OYYn4qHrNg/cRisjBUSO84pOjT97NxqOSXrfMJmxzr/JfrxA9GNrXkA?=
 =?us-ascii?Q?msHy60V3ZUmNBRUhPFHL/mODRjej22v5+kpBltMpo1TE3EzVrTFyIaYMvDNM?=
 =?us-ascii?Q?/pj7RmSg0PRoSXBFiq2DNVN6plHUIpHpgEhEsZWf7eGuFNCnXwdcoImQK8Yz?=
 =?us-ascii?Q?OZYgGnTTUVX7BuabthIJzfq6zsvp3/VY+7Vq0QHvs0tiJ6BZOIPWIdW3nbBW?=
 =?us-ascii?Q?Lz5iVVfIcmx8zCWz1urmAFsfKd/aSLvoLNMFkynWxUAAkOpUEacz3R4nsqiO?=
 =?us-ascii?Q?lxBYt3VmL1qVgdto7YjDlNhDJ65Aq+ed+Xyay1oJ11oXbsW+46aa2lHs0rPf?=
 =?us-ascii?Q?KtVlj/+6rzlxbaRiL5zRhr/0+zvCI+M+ot28zSfH330abUgJdywVaZ/+lwlF?=
 =?us-ascii?Q?pIaBOG+ns+Tv3XQJB55QFWlbauiPfS9G644o4L8Cca1jyjy2nIqCol1BYAhC?=
 =?us-ascii?Q?A7e1hBHpjIK6y5BC5TS8ez6G+0Wa2wgGo20eybEj+bfEEc2VPY/egO/OrwKe?=
 =?us-ascii?Q?g2Vmjfd1LnM3dXbVDc7ZHy2qt9DgIiYmkmnEkLUHsJAY0mq/TSyP4BnerM/r?=
 =?us-ascii?Q?SZ60nQKP1o4GJeb5DqpYt5K4LNt1bY+rnD41hDVjyKceTTwXOgswk247qYWt?=
 =?us-ascii?Q?uFH5cHNsjcAT0e02lTqZOjOCPP8uK/O+mJsYmvO4lg9nPeFD73w+9NAZiP1B?=
 =?us-ascii?Q?O8NKbe2DwUSYVdTub/Brp9Hth3iqPxIY4tWw6Mjk29ak0Fgd+YGxTEE8FeRB?=
 =?us-ascii?Q?HTsF6TUY8oG58lR302PmHrWRR+tqdtAW6EV6Jc5LYLqclNpIQjgCZ4/OFtgJ?=
 =?us-ascii?Q?tg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_3AB6FD34EAAB46449060C83DBE617992citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6539.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717d1fbc-76f6-496d-a134-08da580e2766
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 07:25:03.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9SlO+x1a8BoRagyKW5KMZJCb8VnY71srS2WLeyBpW29GXH46qhNA973Tkt2Qj8Z+l3SmhO6ohOE8CtObYwUgbR48Q3MFE7TNs3bhr+Zzp/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6791

--_000_3AB6FD34EAAB46449060C83DBE617992citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 24 Jun 2022, at 17:03, Anthony PERARD <anthony.perard@citrix.com<mailto:=
anthony.perard@citrix.com>> wrote:

Changes in v3:
- rebased
- several new patches, starting with 13/25 "tools/libs/util: cleanup Makefi=
le"
- introducing macros to deal with linking with in-tree xen libraries
- Add -Werror to CFLAGS for all builds in tools/

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>


--_000_3AB6FD34EAAB46449060C83DBE617992citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <9F1E69BC1010BA4A922222B829C1191B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 24 Jun 2022, at 17:03, Anthony PERARD &lt;<a href=3D"mai=
lto:anthony.perard@citrix.com" class=3D"">anthony.perard@citrix.com</a>&gt;=
 wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Changes
 in v3:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: normal; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">-
 rebased</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 12px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">-
 several new patches, starting with 13/25 &quot;tools/libs/util: cleanup Ma=
kefile&quot;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">-
 introducing macros to deal with linking with in-tree xen libraries</span><=
br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">-
 Add -Werror to CFLAGS for all builds in tools/</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
</div>
<div class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures"=
 class=3D""><br class=3D"">
</span></div>
</body>
</html>

--_000_3AB6FD34EAAB46449060C83DBE617992citrixcom_--

