Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC6F650967
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 10:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465933.724737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7CaW-0005hV-9d; Mon, 19 Dec 2022 09:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465933.724737; Mon, 19 Dec 2022 09:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7CaW-0005e1-5p; Mon, 19 Dec 2022 09:37:36 +0000
Received: by outflank-mailman (input) for mailman id 465933;
 Mon, 19 Dec 2022 09:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kQjb=4R=citrix.com=prvs=345253497=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p7CaU-0005dt-Dz
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 09:37:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c09ac914-7f80-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 10:37:29 +0100 (CET)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Dec 2022 04:37:10 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BY5PR03MB4968.namprd03.prod.outlook.com (2603:10b6:a03:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 09:37:08 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23%3]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 09:37:08 +0000
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
X-Inumbo-ID: c09ac914-7f80-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671442652;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zUrxbQRu8xi4bZH+EYtKrxfnZJckc1/W43AOesxT4aU=;
  b=aU3YCtCOSDxtKdvINsZkj6X/J+/yfjDIzZrcXYwAUjH+6SjQGIo1/yMg
   1nVvrklSbW2wY7nO9IbKMiornNitcH92wOv/or7Sr7arRaVke5iWvTjQS
   Aj6xBaambb0D0dsBcfZoLMHhbH+PWs8iZhSlro6lo8XkmuOjO2HbUKBxf
   8=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 88012182
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:m4U+0aIRPGuyTJq0FE+R85QlxSXFcZb7ZxGr2PjKsXjdYENS0mMFm
 2dNCzrSOfmKZjP3KdlzOozi/U8D68CEydNnTQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AVvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c59HSZy0
 +c4KQkma064irPq47KGENFz05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMl2Sd05C0WDbRUteKX8ROgkeRo
 CTC/mL1Ax4yP92D0zuVtHmrg4cjmAurCNpLTuTorJaGhnW/4lQ0OjYrXmep/9/+0RaaeOx7N
 Gwbr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAcAvd/qpdhqigqVF4k4VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraT0gbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:s24ggKq2yvq+GN0VeVkrzC0aV5v5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssRAb6La90cy7LU80mqQFhbX5UY3SPjUO21HYT72Kj7GSugEIcheWnoEytZ
 uIG5IOcOEYZmIK6voSjjPIdurI9OP3i5xAyN2uvEtFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 656tBcrzStVHwLZoDjb0N1KtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 zukhD/5I+kr/anoyWspVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBbV7iLrFkO0Z+SAAJBqr
 jxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS2tL7t0YvHLf2VYUh5LD3vXklZqvoJRiKn7zPxd
 MeRP01555tACynhj7izyVSKeeXLwgO9ye9MzU/U/OuokJrdVBCvjolLZ8k7wc9HdQGOu1529
 g=
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="88012182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOUdziiJPLWVy5S5vPA8wpuDINnsoBuKed0xF2Gx4h2vpEjRq0S2z5yb67W69dXykSBh6A89C3WJWSEKpreXLL+nSgwa9H9bwSQyvgY9N+0Z/o8UWvCKTPjdiWKkiKhW+XBcbctleblK77sQJ4yiKXMw7Q4fFPjM/3MJIEyxIxihbKSPJOqMLKwL01AjtK9rv13RG1LJg7LqhPuGd+aT4YZ1Ep6LrerV8EaxrJlvBakKD+DUqO64VFA4uChap3r25uWqzVDSkC/jQ1jdaTHdsPq/3gTPc1DbiE7uuLj+BbMrOsSNuI0WwDk9PM2Wl1w78fCm2TgKut8M0l+9Xaz5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUrxbQRu8xi4bZH+EYtKrxfnZJckc1/W43AOesxT4aU=;
 b=IzJ4BtM0tkVlLgx7MAn5UvBAgv35+3S3EBffWM9cwBTPgsj8OgBPSaGGdM4SGHr7dzQaMez+jkANSwV6jrXMZNAq02Fw7qBRMBN614E7g8NFtCE9S7kDOU2yUbWJ8Ng0Kh7PtdBCnibdpChlO1v8S67R8TEoYt4mKvmT9lI07oEXj7uQErTdm3Cxs81KEYlrMjf5+MHDFq2lVnkuK6aVOivji+v6YzWRi7whZf1gXjrMMfNc4bmJzT3hrur/D4jT+xNhaBjGHM5HqsCLR4QPSolsrYRle4APcGAQ8XNzaQTA+we0fXZsDDf3xGQ/hC18pFTq45UbHQ69hCQSu5zkmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUrxbQRu8xi4bZH+EYtKrxfnZJckc1/W43AOesxT4aU=;
 b=pk+XqPDgaE6jPrQxCcQiUAJVB73erfF2Vjl+WzLFyQJKdop1MrLh/7K4XZHiP5WReVfoCNj1+Aq8hdEeNOvwDGjPOx+nRarBDtcbNoktBBOSs+u4RaFg3yqyAxX1K7EhhJoULlEFLOUzETcXdPBz1bDjkPZoUoDo/6lExoqYHAw=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 10/11] tools/ocaml/xenstored: validate config file
 before live update
Thread-Topic: [PATCH v4 10/11] tools/ocaml/xenstored: validate config file
 before live update
Thread-Index: AQHZEXvyCby50r0CD0WQ9S77gzQLM6509/OA
Date: Mon, 19 Dec 2022 09:37:08 +0000
Message-ID: <421BC7DB-EA22-4EB2-883A-21E136367820@citrix.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <a9414ef542c7c5c7f1423efdf1a117431ae569b6.1671214525.git.edwin.torok@cloud.com>
In-Reply-To:
 <a9414ef542c7c5c7f1423efdf1a117431ae569b6.1671214525.git.edwin.torok@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BY5PR03MB4968:EE_
x-ms-office365-filtering-correlation-id: b28598c7-72d8-4d52-70f5-08dae1a49916
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 b6jVvxa8JuSsjiezk3Yf8xR7qi8LYemN8VU5egENtyYBTihtWwqymrFxfjtz7tkypgsL0DXPDBk2gLh4YmkLdy+GhoZ4ISi2OeRkmHA/k8XCDizHkIagpZNJLfJM7APb1ljUpZAvkDq6pHpqp+niuLlXRJfX/zHhHm4JrI55XCKYGq4S8pBVA7TtXomT8E/rRNcRAwqVXa+szfpn6WVwUMr0ayFjetFjGqPtV/HFV+br24xI98RpkPHNLZKVBZGYoNrp/KAVcivYO1iKsdc1Hv/cP64vDCvg5kORzoqXG/IkvDB3kh4K8+4B+teuiqpGxBXvp5nB87dckQt7WooNf2HewY4F9V99SoZZqU5V25f5e7wBHOB3ygOngvM1W8SmRKvId+AD0hPs23afOtAC4ZxZG9xyL9qK2joMGyFIhN+W/Z7rUcC73CSk8OW3v67Osiisc6BQA5ympmtUbSKtqvdSSp582D4yy5d9cjm1e/ub0vIC6MsmfaDkq8jg2f61J1ZfOjV/MBnD7K4Ji6QfUaA+Ck3CQJFh//1M2Z4lC94S4bSXJ+nrzQOymkO7hyPsnJALcIoDiVGyraTY02PUUd8OCbxrHsjLiZ8p788ZIuFSXeQIBkIJM3lgJaCTn0OMeRZogDGDj9HpfhR+Vfi5Pu8fuJyVthyYK5c9zLSzieqH51yKwOCKNBFhPNg3s1K/8rGc4GCfLjkjrVLhPypBNe93JGU8uCvHdg3x4YfR7jGO2beWK45qs5CMpPiXbNGR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(38100700002)(82960400001)(41300700001)(6862004)(8936002)(122000001)(64756008)(5660300002)(91956017)(76116006)(66946007)(66476007)(66446008)(66556008)(4326008)(8676002)(15650500001)(316002)(478600001)(53546011)(83380400001)(6486002)(36756003)(6636002)(37006003)(54906003)(66574015)(44832011)(2906002)(38070700005)(33656002)(186003)(26005)(71200400001)(6512007)(107886003)(966005)(6506007)(86362001)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTNVdDZ0WXVhblhaOTJFb3hpamp1S05sdXlDM1RDeGg0K2x5LzBNWFR0ak0z?=
 =?utf-8?B?WWFxVDM3QSszdTVXL3hVbWlXcUdodTZpb2l4MmZjNXJ1QU95cUc1dnRuSVhu?=
 =?utf-8?B?a241V0xDcGFzNU40WHEzNitUS1BXRDdUVzJ1OUtOZ0VHZjFrQ0lYVnYyU0M4?=
 =?utf-8?B?WkFrV0NmNktUZFVjOWlNUExZYjNMNmJ6QmNCZmJjOEd5S2Fhc1BQcVBOSlcv?=
 =?utf-8?B?YVJJNVlIUWpRQTFYVSszYTdBN2tVV0xSSTYvS0ZZWm42Q00xU0lLb2hkaFdo?=
 =?utf-8?B?RkdMN2ZvU0d5Q0cvcWZxSHloWktZV1Jpb2xwbmNXakU0ejlZRnpaS0dXN0x0?=
 =?utf-8?B?Q1pRT3BvdGJIWkswS29TNmFjSUlnUjcrRk1PVHVMUDY5SEcvaE0wd2VHSG0w?=
 =?utf-8?B?YXlIVzdBbk96bVlhL2NWRU85b0tEM3hqbitFS05oYXBURGFrYVBiSnJHbTlw?=
 =?utf-8?B?c1Yxdjl3M3NKeCtqQ3VRT2NqcXlXTmpFUVBhT3M2M3hFTW1EV2gvZDJoNzVt?=
 =?utf-8?B?V0MxQTVhUGhxR0ZDb3lxREprM29QeDFxY0p6OFNLWDlBemhIaUlhb3cwMDQ4?=
 =?utf-8?B?dENsdU81RVJ6ZUVCVGQyVzYvaExNNFpROXF0aHQybDZzVGhMTXE1NHhZeUpV?=
 =?utf-8?B?N08yZ1dEK1oyanpyR1ZIUk43S3lyYzNvUXRjeFB1K1Y4RzN0YkZYYkUyRXBp?=
 =?utf-8?B?OEhvQzRlOWhIN1NjWEtjaXdpSzhialU2QVFOd3lOV2xTUlFQQ2JhTExmOVh2?=
 =?utf-8?B?QjRNam5EN2VyMFNtVkd5aDZnME5NekY0QVYrc3ZyVSt6Q1gzQ3R5TWpYR1g1?=
 =?utf-8?B?V1lDU2JOZVVSUWorNXB1WDZHcHBkWXpDb0FiMmZiVEZFR2E3clpYcFUyWmRh?=
 =?utf-8?B?Uk0wSVJHTGJhRGZkNlZIV2UzTitXQ0lHcGhnMzlUM1FRejE3TXozWmNtbi90?=
 =?utf-8?B?cDg4MUZZYlduRXJoY05XMEp4SDhMSURkOGJ4VjI1eUJIM0xWSVFPRzNKeVVS?=
 =?utf-8?B?NXdnTEhVbkowNlRadUNzT2tuN25HcW53VEVtT1RsVUo5OS9IRHNpQWRRdFhJ?=
 =?utf-8?B?VWFCZDF6VTBVUHQ1NVV2eWRHNzVYR0doRjNxbXMzcStVZmxnYWZka2IxbThW?=
 =?utf-8?B?WTRLZVhTeVNsMUNNb3V1ZUhPWDROOGhJRzg2T1c3b0FDWlV5U2htdlFhWXo5?=
 =?utf-8?B?aVRhdmFUeVlsT2E2THp1Z1pFMzhXZUZEc0p6K2VLMWYxaVRvaUQ1YkVWVXRr?=
 =?utf-8?B?TVpCNVVsdkYvZ0xRZDRzOS9EdlhqSDRVcHNXZ09qL21Jczl5RkwzeGpnVC9k?=
 =?utf-8?B?UWRBRDk1cW11WEw4ZkdpTHB6ajd0NHE2aWJvWVVHb1JSaSs5dENaWmoxTXhj?=
 =?utf-8?B?eVZ3RmFzYTUrQ0M4NlFpVDZ1K0tEMXo3T04rdE9jNHVKZEx6cFZmelliNEFJ?=
 =?utf-8?B?WVVMSTF0VmsraUZOdmxTcWNVSGltaHF1emZkcWRtblovTGRyM2lYck1qM0RL?=
 =?utf-8?B?QlF3NE16bHRhT1J4cHNGazNsdHJ5TVlUejhIK3JFUGxJRmFiNVNuN3I2UEU5?=
 =?utf-8?B?MFFKZGdVcHJLa0gwY3pPWlp6RFJxblR0R2xqVHpaYzlCTldHWDhEMmZrSzZG?=
 =?utf-8?B?Y3ZNUFo2aTYvZ3ZYYkc3SFlyS0JjeEFTNFFwdkhQbllOTU9zYjFEV1dOWWoy?=
 =?utf-8?B?dE1xaVN6MWRVWDE1QWh3anJTTkNJUUIwcnl0Rnk0bXVlV08zYzdSWStURjhk?=
 =?utf-8?B?a2JSSUFzMUJDTFVlcVJLTWdGUVlzVFFPdllUQmlueUx4ZzlUN2dqNGIzUm5m?=
 =?utf-8?B?Q2J3N0xacHh4dEtnd1pwQk13b0pqRTZkU1RObFpUUUd5QnB1VEhJdWhFcENH?=
 =?utf-8?B?dnVqN2g4VGhKMmNqVVFOcnlvT0RDbkRsUkR0U1dUbkJNYUxiSENOTDdYaGN2?=
 =?utf-8?B?dU5VR2o3L3NHSXlWZlowOVBtcy9KQ0NrV2lRM2JFRTVGWjNINDBhOUxTTjI2?=
 =?utf-8?B?NE15ZVpJMlpVdEFQdUNieEh5RlVDUkFwa0hXRDVhRG1ZcnRUOFVDdDhCY29F?=
 =?utf-8?B?aFdkcXRqRFpJVmMwTTZIZm91RThVcU5nK3g3RVNad0FtRURXbTN3SDEvNnJ0?=
 =?utf-8?B?Y1Ywd3JIT1lrM05DUTkzb0FzVHhXMHVVUzBTVXUyMmZFSGJRZWdrdjdoY0VJ?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8E308241EA28F4B8904E1EFD0FECDEC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28598c7-72d8-4d52-70f5-08dae1a49916
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 09:37:08.5304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLen/xYF5jbOh72o6ZgNWaAmoo068MusT7dMHaBsB1GVJAT8QfbJew8ZDgQsT3CE5qmyht5AngqfJTI52nDY+IO9R8SruCVQxNLxDF+v8mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4968

DQoNCj4gT24gMTYgRGVjIDIwMjIsIGF0IDE4OjI1LCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jv
a0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFRoZSBjb25maWd1cmF0aW9uIGZpbGUgY2FuIGNv
bnRhaW4gdHlwb3Mgb3IgdmFyaW91cyBlcnJvcnMgdGhhdCBjb3VsZCBwcmV2ZW50DQo+IGxpdmUg
dXBkYXRlIGZyb20gc3VjY2VlZGluZyAoZS5nLiBhIGZsYWcgb25seSB2YWxpZCBvbiBhIGRpZmZl
cmVudCB2ZXJzaW9uKS4NCj4gVW5rbm93biBlbnRyaWVzIGluIHRoZSBjb25maWcgZmlsZSB3b3Vs
ZCBiZSBpZ25vcmVkIG9uIHN0YXJ0dXAgbm9ybWFsbHksDQo+IGFkZCBhIHN0cmljdCAtLWNvbmZp
Zy10ZXN0IHRoYXQgbGl2ZS11cGRhdGUgY2FuIHVzZSB0byBjaGVjayB0aGF0IHRoZSBjb25maWcg
ZmlsZQ0KPiBpcyB2YWxpZCAqZm9yIHRoZSBuZXcgYmluYXJ5Ki4NCg0KSXMgdGhlIGNvbmZpZ3Vy
YXRpb24gdGVzdGVkLCBjaGVja2VkLCBvciB2YWxpZGF0ZWQ/IElmIGZlZWwg4oCcY2hlY2siIG9y
IOKAnHZhbGlkYXRlIiB3b3VsZCBjb252ZXkgYmV0dGVyIHdoYXQgaXMgaGFwcGVuaW5nLg0KDQoN
Cj4gRm9yIGNvbXBhdGliaWxpdHkgd2l0aCBydW5uaW5nIG9sZCBjb2RlIGR1cmluZyBsaXZlIHVw
ZGF0ZSByZWNvZ25pemUNCj4gLS1saXZlIC0taGVscCBhcyBhbiBlcXVpdmFsZW50IHRvIC0tY29u
ZmlnLXRlc3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jv
a0BjaXRyaXguY29tDQoNCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGlu
ZGlnQGNpdHJpeC5jb20+DQoNCg0KPiA+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAq
IHJlcG9zdCBvZiBsb3N0IHBhdGNoIGZyb20gMjAyMTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9wYXRjaC9hNTM5MzRkZmE4ZWY5ODRiZmZhODU4Y2M1NzNj
YzdhNjQ0NWJiZGMwLjE2MjA3NTU5NDIuZ2l0LmVkdmluLnRvcm9rQGNpdHJpeC5jb20vDQo+IC0t
LQ0KPiB0b29scy9vY2FtbC94ZW5zdG9yZWQvcGFyc2VfYXJnLm1sIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gdG9vbHMvb2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbCB8IDEx
ICsrKysrKysrKy0tDQo+IDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQvcGFyc2Vf
YXJnLm1sIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3BhcnNlX2FyZy5tbA0KPiBpbmRleCAxYTg1
YjE0ZWY1Li5iMTU5YjkxZjAwIDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQv
cGFyc2VfYXJnLm1sDQo+ICsrKyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wYXJzZV9hcmcubWwN
Cj4gQEAgLTI2LDggKzI2LDE0IEBAIHR5cGUgY29uZmlnID0NCj4gICAgIHJlc3RhcnQ6IGJvb2w7
DQo+ICAgICBsaXZlX3JlbG9hZDogYm9vbDsNCj4gICAgIGRpc2FibGVfc29ja2V0OiBib29sOw0K
PiArICAgIGNvbmZpZ190ZXN0OiBib29sOw0KPiAgIH0NCj4gDQo+ICtsZXQgZ2V0X2NvbmZpZ19m
aWxlbmFtZSBjb25maWdfZmlsZSA9DQo+ICsgIG1hdGNoIGNvbmZpZ19maWxlIHdpdGgNCj4gKyAg
fCBTb21lIG5hbWUgLT4gbmFtZQ0KPiArICB8IE5vbmUgICAgICAtPiBEZWZpbmUuZGVmYXVsdF9j
b25maWdfZGlyIF4gIi9veGVuc3RvcmVkLmNvbmYiDQoNCknigJlkIHVzZSBGaWxlbmFtZS5jb25j
YXQuDQoNCj4gKw0KPiBsZXQgZG9fYXJndiA9DQo+ICAgbGV0IHBpZGZpbGUgPSByZWYgIiIgYW5k
IHRyYWNlZmlsZSA9IHJlZiAiIiAoKiBvbGQgeGVuc3RvcmVkIGNvbXBhdGliaWxpdHkgKikNCj4g
ICBhbmQgZG9tYWluX2luaXQgPSByZWYgdHJ1ZQ0KPiBAQCAtMzgsNiArNDQsOCBAQCBsZXQgZG9f
YXJndiA9DQo+ICAgYW5kIHJlc3RhcnQgPSByZWYgZmFsc2UNCj4gICBhbmQgbGl2ZV9yZWxvYWQg
PSByZWYgZmFsc2UNCj4gICBhbmQgZGlzYWJsZV9zb2NrZXQgPSByZWYgZmFsc2UNCj4gKyAgYW5k
IGNvbmZpZ190ZXN0ID0gcmVmIGZhbHNlDQo+ICsgIGFuZCBoZWxwID0gcmVmIGZhbHNlDQo+ICAg
aW4NCj4gDQo+ICAgbGV0IHNwZWNsaXN0ID0NCj4gQEAgLTU1LDEwICs2MywyNyBAQCBsZXQgZG9f
YXJndiA9DQo+ICAgICAgICgiLVQiLCBBcmcuU2V0X3N0cmluZyB0cmFjZWZpbGUsICIiKTsgKCog
Zm9yIGNvbXBhdGliaWxpdHkgKikNCj4gICAgICAgKCItLXJlc3RhcnQiLCBBcmcuU2V0IHJlc3Rh
cnQsICJSZWFkIGRhdGFiYXNlIG9uIHN0YXJ0aW5nIik7DQo+ICAgICAgICgiLS1saXZlIiwgQXJn
LlNldCBsaXZlX3JlbG9hZCwgIlJlYWQgbGl2ZSBkdW1wIG9uIHN0YXJ0dXAiKTsNCj4gKyAgICAg
ICgiLS1jb25maWctdGVzdCIsIEFyZy5TZXQgY29uZmlnX3Rlc3QsICJUZXN0IHZhbGlkaXR5IG9m
IGNvbmZpZyBmaWxlIik7DQoNCkkgc2VlIHRoZSBsb2dpYyBob3cgdGhpcyBmbGFnIHdhcyBuYW1l
ZCBidXQgZmVlbCBzdGFydGluZyB3aXRoIGEgdmVyYiAo4oCcdmFsaWRhdGXigJ0sIOKAnGNoZWNr
4oCdLCDigJx0ZXN04oCdKSBsZWFkcyB0byBhIGNsZWFyZXIgaW52b2NhdGlvbiBwYXR0ZXJuLg0K
DQo+ICAgICAgICgiLS1kaXNhYmxlLXNvY2tldCIsIEFyZy5Vbml0IChmdW4gKCkgLT4gZGlzYWJs
ZV9zb2NrZXQgOj0gdHJ1ZSksICJEaXNhYmxlIHNvY2tldCIpOw0KPiArICAgICAgKCItLWhlbHAi
LCBBcmcuU2V0IGhlbHAsICJEaXNwbGF5IHRoaXMgbGlzdCBvZiBvcHRpb25zIikNCj4gICAgIF0g
aW4NCj4gICBsZXQgdXNhZ2VfbXNnID0gInVzYWdlIDogeGVuc3RvcmVkIFstLWNvbmZpZy1maWxl
IDxmaWxlbmFtZT5dIFstLW5vLWRvbWFpbi1pbml0XSBbLS1oZWxwXSBbLS1uby1mb3JrXSBbLS1y
ZXJhaXNlLXRvcC1sZXZlbF0gWy0tcmVzdGFydF0gWy0tZGlzYWJsZS1zb2NrZXRdIiBpbg0KPiAg
IEFyZy5wYXJzZSBzcGVjbGlzdCAoZnVuIF8gLT4gKCkpIHVzYWdlX21zZzsNCj4gKyAgbGV0ICgp
ID0NCj4gKyAgICBpZiAhaGVscCB0aGVuIGJlZ2luDQo+ICsgICAgICBpZiAhbGl2ZV9yZWxvYWQg
dGhlbg0KPiArICAgICAgICAoKg0KPiArICAgICAgICAgIFRyYW5zZm9ybSAtLWxpdmUgLS1oZWxw
IGludG8gLS1jb25maWctdGVzdCBmb3IgYmFja3dhcmQgY29tcGF0IHdpdGgNCj4gKyAgICAgICAg
ICBydW5uaW5nIGNvZGUgZHVyaW5nIGxpdmUgdXBkYXRlLg0KPiArICAgICAgICAgIENhbGxlciB3
aWxsIHZhbGlkYXRlIGNvbmZpZyBhbmQgZXhpdA0KPiArICAgICAgICAqKQ0KPiArICAgICAgICBj
b25maWdfdGVzdCA6PSB0cnVlDQo+ICsgICAgICBlbHNlIGJlZ2luDQo+ICsgICAgICAgIEFyZy51
c2FnZV9zdHJpbmcgc3BlY2xpc3QgdXNhZ2VfbXNnIHw+IHByaW50X2VuZGxpbmU7DQo+ICsgICAg
ICAgIGV4aXQgMA0KPiArICAgICAgZW5kDQo+ICsgICAgZW5kDQo+ICsgIGluDQo+ICAgew0KPiAg
ICAgZG9tYWluX2luaXQgPSAhZG9tYWluX2luaXQ7DQo+ICAgICBhY3RpdmF0ZV9hY2Nlc3NfbG9n
ID0gIWFjdGl2YXRlX2FjY2Vzc19sb2c7DQo+IEBAIC03MCw0ICs5NSw1IEBAIGxldCBkb19hcmd2
ID0NCj4gICAgIHJlc3RhcnQgPSAhcmVzdGFydDsNCj4gICAgIGxpdmVfcmVsb2FkID0gIWxpdmVf
cmVsb2FkOw0KPiAgICAgZGlzYWJsZV9zb2NrZXQgPSAhZGlzYWJsZV9zb2NrZXQ7DQo+ICsgICAg
Y29uZmlnX3Rlc3QgPSAhY29uZmlnX3Rlc3Q7DQo+ICAgfQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
b2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC94ZW5z
dG9yZWQubWwNCj4gaW5kZXggMzY2NDM3YjM5Ni4uMWFhYTNlOTk1ZSAxMDA2NDQNCj4gLS0tIGEv
dG9vbHMvb2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbA0KPiArKysgYi90b29scy9vY2FtbC94
ZW5zdG9yZWQveGVuc3RvcmVkLm1sDQo+IEBAIC04OCw3ICs4OCw3IEBAIGxldCBkZWZhdWx0X3Bp
ZGZpbGUgPSBQYXRocy54ZW5fcnVuX2RpciBeICIveGVuc3RvcmVkLnBpZCINCj4gDQo+IGxldCBy
aW5nX3NjYW5faW50ZXJ2YWwgPSByZWYgMjANCj4gDQo+IC1sZXQgcGFyc2VfY29uZmlnIGZpbGVu
YW1lID0NCj4gK2xldCBwYXJzZV9jb25maWcgPyhzdHJpY3Q9ZmFsc2UpIGZpbGVuYW1lID0NCj4g
ICBsZXQgcGlkZmlsZSA9IHJlZiBkZWZhdWx0X3BpZGZpbGUgaW4NCj4gICBsZXQgb3B0aW9ucyA9
IFsNCj4gICAgICgibWVyZ2UtYWN0aXZhdGUiLCBDb25maWcuU2V0X2Jvb2wgVHJhbnNhY3Rpb24u
ZG9fY29hbGVzY2UpOw0KPiBAQCAtMTI5LDExICsxMjksMTIgQEAgbGV0IHBhcnNlX2NvbmZpZyBm
aWxlbmFtZSA9DQo+ICAgICAoInhlbnN0b3JlZC1wb3J0IiwgQ29uZmlnLlNldF9zdHJpbmcgRG9t
YWlucy54ZW5zdG9yZWRfcG9ydCk7IF0gaW4NCj4gICBiZWdpbiB0cnkgQ29uZmlnLnJlYWQgZmls
ZW5hbWUgb3B0aW9ucyAoZnVuIF8gXyAtPiByYWlzZSBOb3RfZm91bmQpDQo+ICAgICB3aXRoDQo+
IC0gICAgfCBDb25maWcuRXJyb3IgZXJyIC0+IExpc3QuaXRlciAoZnVuIChrLCBlKSAtPg0KPiAr
ICAgIHwgQ29uZmlnLkVycm9yIGVyciBhcyBlIC0+IExpc3QuaXRlciAoZnVuIChrLCBlKSAtPg0K
PiAgICAgICAgIG1hdGNoIGUgd2l0aA0KPiAgICAgICAgIHwgInVua25vd24ga2V5IiAtPiBlcHJp
bnRmICJjb25maWc6IHVua25vd24ga2V5ICVzXG4iIGsNCj4gICAgICAgICB8IF8gICAgICAgICAg
ICAgLT4gZXByaW50ZiAiY29uZmlnOiAlczogJXNcbiIgayBlDQo+ICAgICAgICkgZXJyOw0KPiAr
ICAgICAgaWYgc3RyaWN0IHRoZW4gcmFpc2UgZQ0KPiAgICAgfCBTeXNfZXJyb3IgbSAtPiBlcHJp
bnRmICJlcnJvcjogY29uZmlnOiAlc1xuIiBtOw0KPiAgIGVuZDsNCj4gICAhcGlkZmlsZQ0KPiBA
QCAtMzU4LDYgKzM1OSwxMiBAQCBsZXQgdHdlYWtfZ2MgKCkgPQ0KPiBsZXQgKCkgPQ0KPiAgIFBy
aW50ZXhjLnNldF91bmNhdWdodF9leGNlcHRpb25faGFuZGxlciBMb2dnaW5nLmZhbGxiYWNrX2V4
Y2VwdGlvbl9oYW5kbGVyOw0KPiAgIGxldCBjZiA9IGRvX2FyZ3YgaW4NCj4gKyAgaWYgY2YuY29u
ZmlnX3Rlc3QgdGhlbiBiZWdpbg0KPiArICAgIGxldCBwYXRoID0gY29uZmlnX2ZpbGVuYW1lIGNm
IGluDQo+ICsgICAgbGV0IF9waWRmaWxlOnN0cmluZyA9IHBhcnNlX2NvbmZpZyB+c3RyaWN0OnRy
dWUgcGF0aCBpbg0KPiArICAgIFByaW50Zi5wcmludGYgIkNvbmZpZ3VyYXRpb24gdmFsaWQgYXQg
JXNcbiUhIiBwYXRoOw0KPiArICAgIGV4aXQgMA0KPiArICBlbmQ7DQo+ICAgbGV0IHBpZGZpbGUg
PQ0KPiAgICAgaWYgU3lzLmZpbGVfZXhpc3RzIChjb25maWdfZmlsZW5hbWUgY2YpIHRoZW4NCj4g
ICAgICAgcGFyc2VfY29uZmlnIChjb25maWdfZmlsZW5hbWUgY2YpDQo+IC0tIA0KPiAyLjM0LjEN
Cj4gDQoNCg==

