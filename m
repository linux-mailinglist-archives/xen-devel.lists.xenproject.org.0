Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D4508EDC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 19:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309538.525854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhESC-0007le-T0; Wed, 20 Apr 2022 17:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309538.525854; Wed, 20 Apr 2022 17:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhESC-0007jW-PP; Wed, 20 Apr 2022 17:49:24 +0000
Received: by outflank-mailman (input) for mailman id 309538;
 Wed, 20 Apr 2022 17:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhESC-0007jQ-2z
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 17:49:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3418363c-c0d2-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 19:49:21 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 13:49:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BYAPR03MB4776.namprd03.prod.outlook.com (2603:10b6:a03:13a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 17:49:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 17:49:16 +0000
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
X-Inumbo-ID: 3418363c-c0d2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650476961;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=ASC6GTUqC2es2YZ0agjLi/AN8O1YPG+gzXCIywLXTZI=;
  b=cg34f1EjuHtH8lHUwoPTpuPeXb7JxNSIK7UGtvnDDaFqpdIZhxIRxtQB
   9CBaNN3xizngcxsuYHZnhZIMZHWAXlPsiKQPhiuU1WWgpOZMvfDnS1qUr
   wE0R063ejmy/CjYNVKIK7T9gsmJZIfpX5aIKFGUNdTmqQykj3gFQwdNsr
   Y=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 68937094
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rc9B7qy9yhXDZqnQNZF6t+dYxyrEfRIJ4+MujC+fZmUNrF6WrkUEz
 DYeWWGBP/bcY2qme4ogaIu/9hhTvpTUmNA3HgJopSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024DhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplt7e/ZCExF4/2hMtGfTJ5A2ZyBZdZ5+qSSZS/mZT7I0zuVVLJmq0rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHuOTvYAwMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgAzF9PFouzmPpOB3+L7JGYvtd/+sfsELn3eqp
 0bH0EvVBzhPYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWFTGWsuxcdX59VDLc84QTUkq7MuV/BWS4DUyJLb8EguIkuXzs22
 1SVntTvQztyrLmSTnHb/bCRxd+vBRUowaY5TXdsZWM4DxPL+unfUjqnog5fLZOI
IronPort-HdrOrdr: A9a23:ljGtEa8pLJ99NC3zKvVuk+GQdr1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQwdcdDpAtjkfZquz+8I3WBxB8bpYOCCggGVxe5ZnPLfKlHbak7DH6tmpN
 1dmstFeZDN5DpB/L7HCWCDer5KrbjmzEnrv5ak854Hd3APV0gU1XYeNu/tKDwQeOApP+taKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/HyVwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5V+7Y23+4kowwfX+0WVjbdaKv+/VfcO0aSSAWMR4Z
 nxStEbToBOAj3qDyaISFDWqnbdOX4VmgHfIBmj8DfeiP28fSk9DcVZg4Jfb1/212oM1esMiZ
 5j7iahrJxQAgrHnCPho/7ydz8vuHaVjBMZ4KguZ1o2a/pHVJZB6YMY509bC5EGAWbz750mCv
 BnCIXG6O9Rak7yVQGRgoBD+q3aYp0IJGbxfqHCgL3m7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QL5pe7r9NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woOWnYoYBwpc+kI
 nIFFlYqWkxcUTzDtDm5uwCzjndBGGmGTj9wMBX4JZ0/rX6WbrwKCWGDEsjlsOxys9vdvEzm8
 zDTa6+L8WTXVcGQ7w5rjEWc6MiWkUjbA==
X-IronPort-AV: E=Sophos;i="5.90,276,1643691600"; 
   d="scan'208";a="68937094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dr2m2DeWpl29iTj2qoksRpuPAJi7VJbDm82zq38pUTa4Fq3/ff+0nmSvqfGeuCU9YiFnBBx7fdDsp1BhUQQhERvbTFvDg4HxKNPACRvyOPOCSUuwT9WvpmxDVOcnKKGs+uWZRM9U9E+XxMA7ePgBepOFFdZS6xIowMT0+sPWmk8duAgPqlfA3hk5IU/hkqXOFxtgCW4R1xr2Rt7Bv1W04T5wkCQpyWGG7KExncYpRQK6fTSTiUfGCTLqmTHy/cvFMlpE6Yq8TgEt8uCih/swM6JjynEuBXrOW0cYaMa+GZMnljN+sw1f+Lc8oxG9/MT1nZWRFQtzJWgSOlQxrc0bLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASC6GTUqC2es2YZ0agjLi/AN8O1YPG+gzXCIywLXTZI=;
 b=DVdK5OL8tmehab2y2LVuzg3d/rYfxs3xHU3GmXxDpZRWTt2mRjnzNmXhLm6nkIdbCsocG+dpI//paTO1XhD8Tk1kEI4ST966fb6v7lAEHs5gx6oKi016475z/tlSPD4aJtPUnvaAbgpsP9qY7T7MYO+W93olmjLUKXG0/B1zPU/VzyQfC5+bGRyvX59mjO2NYJnrmQf4cpLwK/Z0Dh3ScMuLRwvPxBE1o5fYDaHEHTQ3pzl4x4nx3V+PnKaIPpuMFLWe/e4CDt1ow93b1ixfGk9Za66MfPqENZmDyn8yt+8ZZIvyl6JYBL9EaKSeohJejB2ZWZ05e63Y3CRuannuoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASC6GTUqC2es2YZ0agjLi/AN8O1YPG+gzXCIywLXTZI=;
 b=QiliFDAUC5KM/RIic9Cp70H8XFx/xM2AiNBZ6vWW1B7nUt9O6nMtwjhsblUmA2Mt7pjkGg7X/RRlETyCqpjB9DpHKVMEQ5GIsq9hoEAiHILMM8pBr8rE+ijpwmN0Tb5za6BFqQ9Zz2dTV8nABNbbC4FRNw6cc0QQ9EEy0qr/Hcg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Ranconfig failure between VT-d and HVM
Thread-Topic: Ranconfig failure between VT-d and HVM
Thread-Index: AQHYVN7zVpKNKLs79U2pM+0BQOt1bg==
Date: Wed, 20 Apr 2022 17:49:15 +0000
Message-ID: <9537f2bf-981c-d4ac-d41d-ab59f7d7ab2c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66797de5-4a03-4fe1-1a60-08da22f61678
x-ms-traffictypediagnostic: BYAPR03MB4776:EE_
x-microsoft-antispam-prvs:
 <BYAPR03MB4776CF64AA9F3898D80919F8BAF59@BYAPR03MB4776.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 O6NMLeklm7agOJGfkz7Vm5DTE5LtG1Wz6kTZAEE7C9NYNThtDc1mUz2M/D4q1igvYWiHfCOY6GAcSWecqTruvVoyQuFWAKPz+248yZAzy0mY2FrqZ49EM4+EBDNfKC/gHkBhe/dKsyAtpRtHYZ5oCuHDLAx75a9K9VilORqfyf7nix0AT8mfm7PIKkWOhMyyDISyNkKIq2E3zReLesA5Fg4YGn3WRr/j5GJFu0MB9L/ZScAAbVJqFlCBYQNFBC6hqkQ7M98H/eI2yHRSOGFoIxy2DrGHviXlUKXtlvrV9IyWEc4DQSLMD/sUz1OIvMgKiXo5TlunlN1/dU8bsk8SDTJvesjLXRO4EUr4DQDGXwumjAGKwTxhqdm6Oo/m00OdmNTa0oZ2dONvIGJ30x+rR9STGSaqNJ82qEVkcKshtjYMIwNSX27JgWmwGkBlLG8i89v3ouhrrDWsDJPiXTf4uJd3gLYzTK7uqTw/5ooVh7kh6BSyY5D2QoGn1on6fZwcCkbNDAnt2vM2cTan/GOJwwvQh7giBhTcMwSRO9Wv83PoNAN5pTyQSEtY/p2Kd8Bh82/3llXIIKCSCLyRuyvKjpFcqxSByagD2djA6HP4um9V9e9nNqB8OyjrZHLpityu+fkykU4l5dxKhGOVKrw3Uqchgyne5e15pLc6cIaJSPeF37k2/CF0SijxfZKGsx8qBxVPqRkMUut7uWSTCYdxidCYD4uyuuIJ7CJkePCgwkwFonrLOVKxqnNuOlGhuthKa/rx7zv71UbPhobcUJcvwYmrRzMxW80xVVJi5PGPK/oQQy6cMESzXHaChGvdgvwKRyFq+G2e0hLAuN3tnWySP/BP9s3rXsRnPc70t0UlyMw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(82960400001)(6916009)(122000001)(76116006)(508600001)(66946007)(186003)(64756008)(71200400001)(86362001)(2616005)(31696002)(66446008)(66476007)(36756003)(6486002)(66556008)(38070700005)(6506007)(966005)(6512007)(4326008)(2906002)(38100700002)(26005)(31686004)(5660300002)(316002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEhqQ0RKVWVGSlQ3T1pBc0JWVFJ1RlRFMVJqc3lNOFozbm4wN3NJOFFjUnFN?=
 =?utf-8?B?SWlaRzJ0cm0ybDZaSEhLck1TcWdIWURLcG90TmdjNGUzUzYwbWQ2OElGdDhP?=
 =?utf-8?B?REtmWUJhMklCcWZ5Ymg1OFRYNU0yRlkreGZZMFdWbXU2aTdLVmdWYzQvRy9M?=
 =?utf-8?B?S2VqWG1rVHRiQXVTTW03ZnVPeisyZ0l3R0VDMWlyREk2T3d3L3k3TU5MbnE5?=
 =?utf-8?B?d2UwQkR4R2ZMMGlhRndKSzhSazlicUxnV0pJWDF2cDJsZkJjV0lKc2dKaGJa?=
 =?utf-8?B?RnJmcFZROXl2V2ViN0hKYUMxSWt3ayt4M0JTdVhBbk52cVpscUZkQ3NyaUdj?=
 =?utf-8?B?VUVxQ0d2enZtNzJ5aEt4SlV0SVVxRnllZnhKODdXTGNGRjk4UWFjVVMraDdH?=
 =?utf-8?B?RnBhWXNzYWJuMW8xWDBxQlNDRHkwcUJuNWZrU24zNE1xcjllT1U3QlFKbk01?=
 =?utf-8?B?MUJhVlRKOW1BVGxlZGdCZnorQTR5bFMvOTE3YUtaMklKT0FRRGR4bHpyQjVt?=
 =?utf-8?B?NjR6aVNVOFdVbGljdTZHa2xFTFRneHl5c0JRQzBCc2FMWmhGYjk3ZmZEUDJz?=
 =?utf-8?B?MnAxL1IvY1N4MjhWbGhyWXV6dmUrWElyVmVXNGo3akFLcVlhamd5TndON1p4?=
 =?utf-8?B?Q3h0M09NcFQ2WEdNZ04vQ0EvWi9uNGpnc1FsVjd0V2JxbXR0MVlCaG1xcnRL?=
 =?utf-8?B?djJjWXpRTXdmTm9FVXRJMUN5OW05NFBLSEhySzVPVDlucmJQaFh6Vmg4bFpr?=
 =?utf-8?B?cGloNzFyYUR3RDVlaC9rWGh4NkFyZmJzamFLbXRIYlVRZ1FFbGZqY0JNRXJs?=
 =?utf-8?B?NEJ5RTMwc1lmTDlrcUN3Y3M3SlA2ZDFyUURBcFppVFlGV09CNks3bTdCdUFs?=
 =?utf-8?B?UHBlcnBXMDF4dWc3VFMxcGZub1ZUdzhFOXJXaXZVdmx4NWg1cVdOZVBJeGFK?=
 =?utf-8?B?dW9ubnFQeWZ6VDZ2MkdvYjJpWVFrQTdXVzJQSWJrdGtzcE9zakpMcCtpNkRo?=
 =?utf-8?B?b0dBME9DQVN2eEFYUW92ME8vaEUxUkdrVWE5TVRTbzJ6ZitXaG5TMWsxQk1F?=
 =?utf-8?B?M3M4TkFzUEdYWVdsNHNYVFJkb1FDZGptOFVnUmdkNDlNOFlXMUxpdU1wUG1h?=
 =?utf-8?B?Qml6N3E2SDY0Q3BNWjY2WEtjbW9GTUN4VE5PN3k2V3lxcTNwRVZHSzNTY1JV?=
 =?utf-8?B?NDcvdGdGUVU3eGRJaDFvNTVGYUZ4SGduZy8za2NIYm9PdDJjaHIvMHRVTFFk?=
 =?utf-8?B?QlBlYjJrdzdKcDRMV2JqaDdRN280QnF0L2sraXBRdzhRVDdaZkFGVmRETCsv?=
 =?utf-8?B?YytET0NwdXNpbGVPSzgrRHYvejdEMVBjRlZ1SWNLRDRLYSt6bWZ0RzdheTYw?=
 =?utf-8?B?MDZBeWdkd3h1YU1pdmNpQk41TFRmZFV6NW5Ea3hWVzBsREFjV1N4c1lGN1Zo?=
 =?utf-8?B?Z2N0UnJkNG5LWS8yRmZZV1pmTy9ENk9pY1NXUlVLTmp4VVhWNmZ1T2tReVBR?=
 =?utf-8?B?Y2RXZmV6OHFhRzFMZk4xNGhVS0t5UDl3Zm4xME1xcTdoeVlSV2RuTCtoU1JL?=
 =?utf-8?B?L3h6eS9qNVFsaGRKUFd5bXBUM0Y3UVJUVS85NXFHUXVRUnd1bzdGYk04Uk85?=
 =?utf-8?B?bWVhYThlN1UwSER6dDFOTUl0NkNrR2c4Q2hjeWdEYXpRSU1HN1FDTlpZTHBl?=
 =?utf-8?B?SFZZVFJDZERHSnVDSzErWm10UjZWUFNtaXZxKzV5S1FsTXZQdHdpVDBHU01x?=
 =?utf-8?B?Vzg5bDNZcEpUZERiS0ZmMk1wSm1pUG1mdzU1L2lRTWFNWFZqSHJHdllaeWVK?=
 =?utf-8?B?Nnd2TGdQNUdaSFhHOFU4cEN1S2lhS1RpOTF2RVVLVkh0ZTF1clBNTFJ3WlUv?=
 =?utf-8?B?OUFhdGcxckUwWldMM2JhODlabTc0WFp0Q0F3VE5KSko3M0FaVEJuUGlqczMw?=
 =?utf-8?B?NW5rVDVTUXJUSzdiNTArb2QwWEdLWHd5Y3JwQ0kvaUJMRWRadXVnYm95czFY?=
 =?utf-8?B?MkxMUTJUNXNtYmJmbTJWWnh0MUlLbUFDbzBibElob0xIWjQrMTNvYUJIYWkv?=
 =?utf-8?B?NVREUDFUUHVDbjE5RFJEWk8vOFFEM0NjZFNKdkFGdlZQUS8rTXU3QWJwMjVC?=
 =?utf-8?B?Q3ZyZURvcFdFeFl6cDVkcGZib0VLUTViZWhxYjdkTUtmeElDbWF1TWZNV0tM?=
 =?utf-8?B?SklIUCtIREx6RGEyOVhMb0dYaTA0WWJBazd3TTJpNTlyMVZFTGp6cksxbFpT?=
 =?utf-8?B?VFBuQXEyc1M1SWxYTDZWRnlpN3VKa05hQm5PemxiblpzRkpoM2hZU3lNbWFY?=
 =?utf-8?B?ZnAwNUgydWF1UVJmS0Q2alBiRlE2ZDlJMHVJL3RwVGlwQXlVczI0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <141EB287C096C044A7E8A8A03089B9FE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66797de5-4a03-4fe1-1a60-08da22f61678
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 17:49:16.0459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvBIHPnMVKOtCMmz3c55BIwLMBUCMfptX/fYpbcrrCNfHS9rqJrO7SMh88iQNOljPtNEx8g8NwcJF4sEZY/T5S7ocVlq70EUuxM1kNtCcIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4776

aHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL2pvYnMv
MjM1NTU2MjExOQ0KDQpsZDogcHJlbGluay5vOiBpbiBmdW5jdGlvbiBgdnRkX3NldHVwJzoNCmRy
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmM6KC5pbml0LnRleHQrMHgyMTlmNik6IHVuZGVm
aW5lZA0KcmVmZXJlbmNlIHRvIGBvcHRfaGFwXzJtYicNCmRyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmM6KC5pbml0LnRleHQrMHgyMTlmNik6IHJlbG9jYXRpb24NCnRydW5jYXRlZCB0byBm
aXQ6IFJfWDg2XzY0X1BDMzIgYWdhaW5zdCB1bmRlZmluZWQgc3ltYm9sIGBvcHRfaGFwXzJtYicN
CmxkOiBkcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jOiguaW5pdC50ZXh0KzB4MjFhMjMp
OiB1bmRlZmluZWQNCnJlZmVyZW5jZSB0byBgb3B0X2hhcF8xZ2InDQpkcml2ZXJzL3Bhc3N0aHJv
dWdoL3Z0ZC9pb21tdS5jOiguaW5pdC50ZXh0KzB4MjFhMjMpOiByZWxvY2F0aW9uDQp0cnVuY2F0
ZWQgdG8gZml0OiBSX1g4Nl82NF9QQzMyIGFnYWluc3QgdW5kZWZpbmVkIHN5bWJvbCBgb3B0X2hh
cF8xZ2InDQpsZDogLi8ueGVuLXN5bXMuMDogaGlkZGVuIHN5bWJvbCBgb3B0X2hhcF8ybWInIGlz
bid0IGRlZmluZWQNCmxkOiBmaW5hbCBsaW5rIGZhaWxlZDogYmFkIHZhbHVlDQptYWtlWzNdOiAq
KiogW2FyY2gveDg2L01ha2VmaWxlOjEzNzogeGVuLXN5bXNdIEVycm9yIDENCg0KSXQncyByZWFs
bHkgbm90IGNsZWFyIHdoeSB0aGlzIGhhcyBmaXJzdCBzaG93IHVwIG5vdy7CoCBUaGVyZSBoYXMg
YmVlbiBhDQpodWdlIHF1YW50aXR5IG9mIG5vaXNlIGluIEdpdGxhYiBDSSBmb3IgdGhlIHBhc3Qg
MyB3ZWVrcyB3aXRoIEFSTSBiZWluZw0Kb2ZmbGluZSwgYnV0IEkgY2FuJ3Qgc2VlIGFueXRoaW5n
IHJlbGV2YW50IGluIHRoZSBsYXJnZSBudW1iZXIgb2YgSU9NTVUNCmNoYW5nZXMgaW4gdGhhdCBw
ZXJpb2QuDQoNCkFueXdheSwgdGhlIGlzc3VlIGlzIHNpbXBsZS7CoCBJdCdzIHZ0ZF9lcHRfcGFn
ZV9jb21wYXRpYmxlKCkgaW4gYQ0KIUNPTkZJR19IVk0gYnVpbGQuDQoNCn5BbmRyZXcNCg==

