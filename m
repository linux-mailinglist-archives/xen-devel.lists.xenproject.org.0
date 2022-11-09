Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B162344B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 21:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441124.695433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osrQN-0008RI-Bl; Wed, 09 Nov 2022 20:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441124.695433; Wed, 09 Nov 2022 20:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osrQN-0008Np-82; Wed, 09 Nov 2022 20:11:51 +0000
Received: by outflank-mailman (input) for mailman id 441124;
 Wed, 09 Nov 2022 20:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5F/s=3J=citrix.com=prvs=3057ff164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1osrQK-0008Nh-Ox
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 20:11:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baf7ab3f-606a-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 21:11:46 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 15:11:42 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5409.namprd03.prod.outlook.com (2603:10b6:208:290::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 20:11:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 20:11:40 +0000
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
X-Inumbo-ID: baf7ab3f-606a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668024706;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I/GmRUIs0ZBdVCOdBUQ3r9oVmexp/wRq6r25pT5EQjs=;
  b=UnbTJ9BZwAPjuMWd3S2TYUEcu7jBmQ2dRodvOhXKVoOvJ+Avxm86Xsl+
   ++EcZ/N0yDMoN6n87A4tqTaeU87oohGewGmYIHiibs8oikhNeLGRsb9zO
   ubSBbkoVXBOwFpOIlKZNg8vYYCcSzxjev7zgPns8aTcKgZGLyETNbr9Xj
   U=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 84532695
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jZqZiqLIS15LSFC9FE+RN5QlxSXFcZb7ZxGr2PjKsXjdYENS0jJRz
 GcYXm/TOK7eN2H1L4wkO9u08R5Q78eBndVrGgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRvPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5yUHtR7
 NUHGAsrTTmYgdOxwYDkW+RV05FLwMnDZOvzu1lG5BSAVLMMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGNnGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX+mA9hMReDQGvhCg3CWm28CBj0tD3SL/eWVtVXud+puE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN07rcMNzbT9wlnBjBqlvJ2PRQkwjjg7RUqg5wJ9IYSjN4qh7AGC6e4addjJCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:cM6CHqN9T0FuHcBcT3n155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Ar5K0tQ4uxoWZPwCU80kKQY3WB/B8bHYOCLggqVxcRZnPLfKl7bambDH4xmpM
 BdmsFFYbWeY2SSz/yKhjVQeOxQo+VvhZrY4Ns2uE0dLz2CBZsB0y5JTiKgVmFmTghPApQ0UL
 CG4NBcmjamcXMLKuymG3gsRYH41pD2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8F
 LCjxfy6syYwr2GI17npiDuBqZt6ZrcI+h4dYyxYw8uW3bRYzOTFcpcsnu5zXIISa+UmRMXeZ
 L30m0d1oxImg7slyeO0FHQMkDboUoTwm6nxlmCjXT5p8vlADo8FspanIpcNgDU8kw6obhHod
 V2Nk+ixu9q5Cn77VDAzsmNUwsvmlu/oHIkn+JWh3tDUZEGYLsUqYAE5ktaHJoJASq/sekcYa
 BTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8xUoFw84UmGsG6fsGOu95zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIWh7IOHL6GyWUKEjGAQO/l3fa2sRF2AjxQu128HIbou
 W+bHpI8WgvZknpFcqCmJVW7xGlehTMYQjQ
X-IronPort-AV: E=Sophos;i="5.96,151,1665460800"; 
   d="scan'208";a="84532695"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0OtnUg7FQ0mP1QvoPFmb+aXaHX2y51tT9toOjgu7dKeVNbr+crGQ0vLquYg4M0YSBAWFOY2qXbd3xcrA+plW1Ye1ZS/BLtEFiGGrsxZbEzvjbEreaMmrUYqtOBLuDGxpvdxHZ66kCAPdJza7UQDaYcASJV2odVw98PjWA6NMOpde1KB9rWAJaMWfbggnfBJORHxivxYtDczIJZPTdUZSq7YGdZ33LSicMeVNftpql8tJWgUlb1eIyBryMeTmdr5goMsP6GZXpxz+4R8oDINlN9QWoJcF8gR/7950gUBtx2HrReqUg7LULwII+Ym021YJ9HL9VWYQZHtA4pGXGZAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/GmRUIs0ZBdVCOdBUQ3r9oVmexp/wRq6r25pT5EQjs=;
 b=Ko2BJGrZd5iiq1g9UuunbyWXBcM4H98+0hFfA0ETx5IRvR4BUpStswfRV6i6iSp20roUiK1hGa8nRYKLe81Uf22DPuhwoGYkSudJAwpjuqghLP6rTGwKcbj6QD1/nf87NsDw8fQl/s2b2nhmyqTHzyqg3CrQy0zeDjy1fAsp8s25+QCkuUxPqlyXoXacnrzeMfuUoQNXlSMlfgrwyQ8UTHJ9SG2QBj6p/KPWF+YRmxjQYmriPyGEbEOpthUSO0e/susCA3tsStrzTxU0cte633TzFv2TBpbop64S5dZK8LW/q2eUfYqRH7w5lAiwLuJWqRgOpDtdsTk0IJ+tuPXVgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/GmRUIs0ZBdVCOdBUQ3r9oVmexp/wRq6r25pT5EQjs=;
 b=sm8KcZtGbTWflXsqgsJDQpPi2OqZNKnExaZHA1PegX7LlFxahgEI6J1lVXq6R8XAQKldza7COkbz29KqE0XA5bApATEmn39NHjDE7GnmEZvdTzGdiP3tYa2xXWBpZnZNryLXbGzwGgaN6jSjG4V6CtnERITQtp8PQEYqBW8L5Ac=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] kexec: restore hypercall 1st arg's type
Thread-Topic: [PATCH][4.17] kexec: restore hypercall 1st arg's type
Thread-Index: AQHY8rrxB22D+mhDmkyvs7CT99N0gq43CX2A
Date: Wed, 9 Nov 2022 20:11:39 +0000
Message-ID: <f68cc2d8-7d9e-8cda-479a-d20a40dc1e40@citrix.com>
References: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
In-Reply-To: <be670676-91c9-abb1-3a0f-e1481f0a104c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5409:EE_
x-ms-office365-filtering-correlation-id: 93e02fde-4678-4752-8e86-08dac28e9ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xgGhkhPMhnu9GddJnz0qiApmFr+CIKgmld3hMhQnA7ddfS1O2O6guhhdcF2QJuzKkTYYUkMHAyUj9WGFL4eENdDITzYG94i+9yHBTkvynYadnoIioB4RHmq/+37h827oXU7Fjc7ZXjOgnZv5STJ1MCPyHGkpJ3I0vzH/C/116AYEuG7a3FDQfwX5bm8F/poh6oJvaQBklitOeZCBKrHjxa2mDzOPZg6EwIqkaYw9nulI3nPpQSSTpjL69Fao6cXcxZnFsNpDSK4OM15HlfR/wagtudtjZGgI+HfJUAKuNfzxUt9eXchcs0sVzphOSuPzuwMzoux20C5vLqmBFGTdH4FY1QAWj08axIafUbHmUl4qM5iUSuKCeJdUTKvKFCKhrdIi07/Ex0McGbljBYTcx44ws6I2/iuRB0LCAkHGC01tFTRYnZJNE0svcq6BA+uX2dZcNpn5R4xi/bMpaJFNxGf3oZV1SbliijfVahvRzPk423EAwVYlotsOFg3kg0skMIuuKnhFEA3pdfPZU05SP2oqawFNbMPvDXvychvmfyYAYjdtqxe1ZWiXtyIbSeqVCsHY2aImdDO/uWToWCXUaEvu2pb972+KYF148RkuRoBGVh+7ej2ivyN00f/8eMkiW3RRDusVDUb6EA0wZjU6PR5ZceHT/l5BW1tdHJErq5RkG+EMh+VP9trMGmWW5XvspDDS48nc4jctunMF+fCYtyoS5b5lmHsg28q8DbQ/sk67uIsk+fZNNMBWGWVvYGAmkE0lXD+CHepUkJKzW/IVdv9WHkOgUIorZ1U/UPKcvP0PpUTJ0tJyvm+Il/y0+PRajEWwasqceFlI70BZANbt4Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(31686004)(38100700002)(122000001)(82960400001)(478600001)(6486002)(38070700005)(31696002)(83380400001)(86362001)(4744005)(53546011)(186003)(6512007)(26005)(91956017)(6506007)(2906002)(76116006)(8936002)(71200400001)(66556008)(66946007)(66476007)(5660300002)(41300700001)(2616005)(110136005)(4326008)(316002)(54906003)(8676002)(64756008)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3daUDJEWDVEVVlCS2V6M2dvZVE1R2JHc3VhWjJ3QXEvQWhKL0c0Q0VlZkhv?=
 =?utf-8?B?OUZ4aUF6NkdNMG5Cb3BDK1NpbzRGR2ZtSFdyVFB1YjNRYUlDTE9EWlFoYWVW?=
 =?utf-8?B?MUZrTlhERXR6QW5KaGhOMGV2ejgzVVhhenk2VXlhVUlrcEFISUl0WFRKUldM?=
 =?utf-8?B?ay9ERzdXT0pHSjVnVnRkVzJsQzllSW9kN2czTERWb3dPNTgzSVN3U29pMlJR?=
 =?utf-8?B?dStDeW9uT2xRTHpkTm8yMSttTEEwamxWSTArNGFsbXYrQTJ1N3d6akk1ak1E?=
 =?utf-8?B?TmtxQzVJa1c1US9jS3pkV0V1cG1JR1NzOCsxbjU4OG5iWXRQWWh6SFZERzNy?=
 =?utf-8?B?c09HaUR6anpOUTFhTUlXejlIOGpFYTlpdmd3Ui9PMks2eFh0YnRCYndCSVNm?=
 =?utf-8?B?ck1hZlRXcllwNGN0Wk9jZXVzbmNza0N3anhYWHpKVEdnNUo4cVZiYlhCMk5t?=
 =?utf-8?B?d1RwU1lnNkJLNXRIZURET0lqaHZibm5YM2xoazVjMlpPbHlsUk5PYSthb1U4?=
 =?utf-8?B?VTZsa0hmc21QQVJqbUZmZkp3VFJ5VEVwV1pSRmFHYmh6MXRZYWdvdUdGeDRP?=
 =?utf-8?B?ZmhMZDd0NVJUYUdFTHR5cDR2TWd3dmg0bkVCTTVIYVRwREpuZWhFalBnTVdH?=
 =?utf-8?B?V2pBTE4wc0hlUnVxYUp3bllaVHJ4K1c3eFB1UUVFMFFHNWtqVXI2S21PZkt0?=
 =?utf-8?B?WUZlYVVVZ293ektrN29CVWhNMy9oalpTU0U0dFByTkwycGZFSG10RFM3d3Zo?=
 =?utf-8?B?bXJGc0dMZ2hVY2tPQnR3b2hxaDgvSHFPLzE0TFFKSkIwOEFKZjJKKzlWNysz?=
 =?utf-8?B?a29qNmNZUFpvRlZiU2VFQ0I4YTJGTW14MHlzOTY0ODA0V3k0ek1CSTlCNnpl?=
 =?utf-8?B?ZkhxbGd4TUdhemhNSkxzQVpUdkRLS2hWYTJaSVFMQ2ZVOFY5VU0vYzFjZ1VN?=
 =?utf-8?B?SlhacFZ1MUQxSmZUVDY1dXhlYjFNQm5DZHBlODkzeEZhbG1PNFBHV2NNNHlC?=
 =?utf-8?B?eWM0TTJaekV6bTdoN3B5SXRXUTN2L2dyaHF3RDJicHJyS2FDZkNaWSt2YWl3?=
 =?utf-8?B?Uk80QVVSSW90VytIRVJFMnFXTGxPOWYzTk02MTZRUllRWjFrSzNQK01qdjZs?=
 =?utf-8?B?OUlUN0ZvSm5sQTkwRjFpZ3hVK1NmZVQrT2dZK040YU1TQlVsczFKSHc2TWJJ?=
 =?utf-8?B?YkFxbXc4a2xGR0hEMW40RUZaY0xhQ3o1RDJsa0ZkRThyaTZScDlPLytJR3Nt?=
 =?utf-8?B?TkdNdEtxWEtzUEhKM1NBZmdoOHZRd3FFN1JacnIrUWpNcGVyNGtqb1A1UkZn?=
 =?utf-8?B?aTIyMzlKVWk2STFXUnJFeEZ6bHZJYXhvbCtOYS9kT2RzNk9zZkJGUWd6bzFs?=
 =?utf-8?B?N0lTS1laUWNFd29Uc0k0amFsQXpoaW5udWptZ2ZRUmFXQWxFcUlPM3k4VkFv?=
 =?utf-8?B?WGpRbTlYWVBaWmt6VzJQdGVzNUVkQko5cklZUTJZOU55cDBMRXpYNDVRZUxt?=
 =?utf-8?B?WU11NUdqK0JHSmJjaDB0U1Z2NjNJMnYwZHFLMWQreTdwZU1DZERzaFZIUHRI?=
 =?utf-8?B?UWh5OFBYb0t1NUJsbmFLa0wvUVRCSzFZUXdaSGJzS0NDZFdqUnZxYkJIWHU0?=
 =?utf-8?B?a0NEWFBhVVY3bEhITjE4c2dCdGNHVFhCc2dzR1lGTnYwSHZ5am1NSDhxSU01?=
 =?utf-8?B?bms5TG1jdTc2V0F2UDVKV0Q5Z093YkZBaVNQdG9obWpwMFIwN3EwS3l4eEls?=
 =?utf-8?B?VndaRzU1OG52dTE1ckhtdnN2Q1R2ayt1QzRxVklPVXE5SGtJc3hJd20wUWUz?=
 =?utf-8?B?eFgySXl1QmdWWkJ1dGpROWkvdnpMcGU1UEFjbytwSEhWWC9ndW5nb0lBTjAx?=
 =?utf-8?B?MXpSZTgxQjNzWWJ2UlNYMXdDL1NvcnRKTzhTQnFBNlRCWUNpZERoZ3NibVUz?=
 =?utf-8?B?QjErdUZ4NE4vNTR6NC9TZUdkWHI3YWVGUDMvY3drTXE4bkc1NHVadjFkK0Ja?=
 =?utf-8?B?SjNMZWxsakdocGNORmJmZVNyM3N3SWRTWVZqd0ViWTJMdFlFWU1TelVTWWJR?=
 =?utf-8?B?dmNJbmJCR1FuREREQW5qdTVwUlV4ZVB0SDQ2VVlRc0VqU1QvemcwZ2xqZFhN?=
 =?utf-8?Q?zVokRPk8IfebeCkG8+Fu11Z6v?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75515F104CCF5647A9E66F8712C3D125@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e02fde-4678-4752-8e86-08dac28e9ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 20:11:39.9156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRSO+GbPyTRI+5tkUTXVm+LihyNgQBAbY/sliDbNoV92LLv7wpr5uEkrfOPavyrlt6erhQNc7RuvANbjeOetIMz9TK8ShfwNbLUaadOqE4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5409

T24gMDcvMTEvMjAyMiAxNTowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoaXMgcmV2ZXJ0cyBh
IHNtYWxsIHBhcnQgb2YgN2UyMWIyNTA1OWVkICgieGVuOiBoYXJtb25pemUgcmV0dXJuIHR5cGVz
DQo+IG9mIGh5cGVyY2FsbCBoYW5kbGVycyIpLiBUaGUgY2hhbmdlIGZyb20gInVuc2lnbmVkIGxv
bmciIHRvICJ1bnNpZ25lZA0KPiBpbnQiIGZvciB0aGUgbmF0aXZlIGhhbmRsZXIgZnVuY3Rpb24g
bWVhbnQgdGhhdCBwcmV2aW91c2x5IGludmFsaWQNCj4gdmFsdWVzIGJlY2FtZSB2YWxpZC4gV2hp
bGUgcGVyaGFwcyBub3QgYSBzaWduaWZpY2FudCBpc3N1ZSwgc3RyaWN0bHkNCj4gc3BlYWtpbmcg
dGhhdCdzIHN0aWxsIGEgY2hhbmdlIHRvIHRoZSBBQkkuIERvbid0IGdvIGFzIGZhciBhcyByZXN0
b3JpbmcNCj4gdGhlIGNvbXBhdCBlbnRyeSBwb2ludCdzIHR5cGUgdGhvdWdoOiBUaGF0IG9uZSBj
YW4ndCBoYXZlIHZhbHVlcyBwYXNzZWQNCj4gd2hpY2ggZG9uJ3QgZml0IGluIDMyIGJpdHMuDQo+
DQo+IE5vdGUgdGhhdCBhcyBhIHNpZGUgZWZmZWN0IHRoaXMgZml4ZXMgdGhlIGludm9jYXRpb24g
b2YNCj4gaHlwZXJjYWxsX2NyZWF0ZV9jb250aW51YXRpb24oKSwgd2hpY2ggYnkgbWlzdGFrZSB3
YXNuJ3QgYWRqdXN0ZWQgYnkgdGhlDQo+IGVhcmxpZXIgY2hhbmdlLg0KPg0KPiBBbHNvIHRha2Ug
dGhlIG9wcG9ydHVuaXR5IGFuZCBjb3JyZWN0IHRoZSByZXNwZWN0aXZlIGNvbW1lbnQgaW4gdGhl
DQo+IHB1YmxpYyBoZWFkZXIuIChUaGUgd2F5IGl0IHdhcyBpdCByZWFsbHkgc3VwcG9ydHMgdGhh
dCBpdCBwcm9iYWJseSB3YXMNCj4gcG9pbnRsZXNzIHRvIHVzZSAibG9uZyIsIGJ1dCB0aGF0J3Mg
dGhlIHdheSB0aGUgaHlwZXJjYWxsIHdhcw0KPiBpbnRyb2R1Y2VkLikNCj4NCj4gUmVxdWVzdGVk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoYW5reW91IGZvciBm
aXhpbmcgdGhpcy7CoA0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4NCg==

