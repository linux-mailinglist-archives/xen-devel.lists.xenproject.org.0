Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B6653679
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 19:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468020.727080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p843w-00006c-Ul; Wed, 21 Dec 2022 18:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468020.727080; Wed, 21 Dec 2022 18:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p843w-0008VT-RV; Wed, 21 Dec 2022 18:43:32 +0000
Received: by outflank-mailman (input) for mailman id 468020;
 Wed, 21 Dec 2022 18:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p843v-0008VN-Gy
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 18:43:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b567e4f-815f-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 19:43:29 +0100 (CET)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:43:25 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5922.namprd03.prod.outlook.com (2603:10b6:303:6d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 18:43:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 18:43:23 +0000
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
X-Inumbo-ID: 5b567e4f-815f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671648209;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Pt4Qh7ycfyy6popPYdVFobWy8wIB3+SVH1UA3UEJdsc=;
  b=DNrDb0NqCmXUy0+vLJt5kKFl9hITK0hcgyyF4Hp7K34nobuOYZW1XWzP
   yeOC2SDe+5DP3wmmyeV5zOHVZKyV4wLRYiApl74zz2esdmVgtaKNHjcBG
   7fIpjJJZOamaxKg4X/xay5hW483APkPIOvtcSN+RAyTQSYgoKnR9lGcmG
   g=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 89521222
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:j3Tq0aLYHqOzLh/aFE+R4JQlxSXFcZb7ZxGr2PjKsXjdYENS32ECm
 jMbUGyFOPrcMGLyctslPoqzoB9Tv8SEydUyG1BlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5AZnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c55UENL+
 6ciOAw0SUCKmey27o2bU8Rj05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzXKmAttITufQGvhCow2Y72VPGhwtV0qKjdWn1VO6QtNzE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAJLGoqdSICCwwf7LHeTJobixvOSpNpFvGzh9isQTXom
 WnS9245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 RDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:pHfgV64ZkQ4zJSltrgPXwPLXdLJyesId70hD6qkmc20zTiX+rb
 HMoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SODUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebvN5fQRt7eZ3OEYeexQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,263,1665460800"; 
   d="scan'208";a="89521222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAfuv1vaXn0WNE46zdQ6b8FE+NB5Om0ekxhwEMZ8hSccl6QO1P3SiSfI1CHTqv30Jn+zZk8avmwR37xDv9OdLizbeokcWl30dVWCBB1TJ++S9o9304wxmgJJnApkb+G7RsTGj62cI0XlXmXyqaTzHQP2F5C4eWVMG1pgooTVIZ4RvIdryrzzC4SRw3+rgKFOFmBiNFjhYzdZs219qvOGHEPMxMEEaDCKfos1kzL8eOLMGqkLMDZweakgxD1sCdY98u9KXpc/uRk3lTOv+Qslxr4PxUANgrfEVbXsLdDXYfCHlqeeiBm8PG03eTnsfqXmUHqB2lUMX/tr2kRirHHCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt4Qh7ycfyy6popPYdVFobWy8wIB3+SVH1UA3UEJdsc=;
 b=dWst3TXpG+SlWJZCDmkgffVw0+e344q2BM/E/EfsEmxoBph/sHM+pBnLNvVMSrhdZBtKnMUz/DvC+Q0yNHIpnisHFCAN+ccnmbdRJt6GTn6QdFLB1H1zO5a+pwRFEqRzQvIr613y/z+ThwSxh4CWlXT3ZbvxQluMyFPetP6VLzrJGlf+N+ql7x1qC+UfHc75flUMbZEzLxXyfoIwy4QDlS3USRlEYCAM4e6B+V2vuhc05k42tOaYan5nSVTNsE0vl73WCJGO3LlWrCr9oh+9SLWcm2fTD7CwGxFQOgIjtBU4asvHY7v9md+/KOkZPhAQC454xVT9zqAHCshPKW4JLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt4Qh7ycfyy6popPYdVFobWy8wIB3+SVH1UA3UEJdsc=;
 b=VamjjJFO0Ix+6JsK046aQYIDkKs52Qeh3wOxbOuP9osfRc4eknKGQEWsqXLnK4KQibpm/jNyfZ5AbD1VAc373iuUqNmnwE74OKTww8g4Lh09F3XfNypnp9czCnzkXwxGwUN/+CIx4tLgOlvA9kjlT6N1E3IMO/dfxy7jDVOLdMo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 4/8] x86/paging: move and conditionalize flush_tlb() hook
Thread-Topic: [PATCH 4/8] x86/paging: move and conditionalize flush_tlb() hook
Thread-Index: AQHZFT/p1A/PjgrQ60O6Dc5GjbqLqK54rbQA
Date: Wed, 21 Dec 2022 18:43:23 +0000
Message-ID: <400b4bb2-b265-b46d-6582-b8070deac508@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <584a986e-08ea-d064-9447-ed23c6e39721@suse.com>
In-Reply-To: <584a986e-08ea-d064-9447-ed23c6e39721@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5922:EE_
x-ms-office365-filtering-correlation-id: 650776d7-4225-471d-dcca-08dae3833d2e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IvMSo8nwHY2dwBBUzFrEzKIhELUFoh0ei+/V4zVuY11Wcttc1DLWiLQxnOs2L/+GV3GAaYGfDLcq0csTAxMikljliL5hqqJPQBJQ1DXXHMgNVphTErhTpv5CWpZxO6P3NUyAWHBXRwZ+pe0VtjsIAf0QP9QWOemKxeJ9IG8GKByV0iw1A5o8FYdWvwUqUs9YT6VXqkG9PqU7M7fi+idep/9VcKPyZCq/foexRk5lghBZzI64XgFS/Qc8X17fPrCrp3dOjjDH9v0E8rXZVil3P3OQ9m1y3Jowvo2KTG8YSV+oXZBidxQ823jB44uR5LEQBGq5Ti8hGKhfqyNGbxs/7fJwHBhNH76bpf7Fh6zqeWo4VQPsZJ8iG8RkutBlEfhsv5F2KELI6TN70qziYE7XjUt+3m8lqxAiXKAarCn00VyZ2EAKphyljiNp6q7XYjovTxa9ULHDTLSMUoSJrLY4lAaARhpgxGQLQ6rQWpoHRZ0fNMZsLMdZ9SfkxYf5Tuqzb7T0DdG+Wy4lMgrq1aPpyjX+GCqZC7KDvcX/jvSDBE3bahBpyRiw0OGEV7vvzDXfGHYHO7PD7E32HJN5ug0Cu9IJXJGdHwgPawp3uZJOrrcJ62Z6ntAPhBRkCGSgPtNo3RsZV/VHWxipN8AZ7Prtq+UHx2YBnjOteYVwFuiC1MNZwLEzIRmt5EYAR6RnleFPgkEGIdkFeNSuUO/d7gsx71mBdg9E+0R0FbAHuKZSM7guEy345U6spzrT9VY2W3ynetxyps8lV4gvSrkj1TU8iA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199015)(31696002)(31686004)(66899015)(186003)(122000001)(6506007)(6486002)(71200400001)(38100700002)(26005)(6512007)(82960400001)(478600001)(53546011)(4326008)(110136005)(41300700001)(54906003)(66446008)(91956017)(2616005)(316002)(66476007)(66556008)(8676002)(64756008)(76116006)(66946007)(2906002)(38070700005)(8936002)(83380400001)(36756003)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUNTZnFrVWhmY01XeXRlUUF6WlUvM2lXRENQeHZDVlhBdTJ6aERtUEoxRTY3?=
 =?utf-8?B?V3Iwd213K2RIYm5UeFRZeFJGSEZwZjdKbUhVTllsUUJiN3E1dG4rTDVQV1BT?=
 =?utf-8?B?Tjh4amFtcXhEUGhPRHZrL1dtTGpHNUlUa2NFeGlvNW5ZQ0tHNkNXWE44dVlk?=
 =?utf-8?B?aUJxWHh3dmphNFQ3RGprbDJxZlhhMnM2YVpwRU1DNVl5QTJLTytJNEtHL3ZM?=
 =?utf-8?B?WFIyY0cxNGVvVytYaHN4N2JQNTdGZHJJaEdyRm1wN1NCWitLWCswUjZSUDRa?=
 =?utf-8?B?alcyck1wMlBydXhSaFM5ZGphN2I0U0VibmluMmY2VkRtOExHV2oydW83ZUxR?=
 =?utf-8?B?L1ZiTVV3R1lXL25DdVVlL2JPQ212cE5QUU4vWCtZVEZNUUtXS1NOQ25DVWJW?=
 =?utf-8?B?Qmd5YUdtbEUvQ3kzRitxZVhNZUFBVVJzSXRmRU5rT2p6aHBDZWNRTXMzSU90?=
 =?utf-8?B?emdPT2I2bWhvZ1JDdGZRbExjd0N5b3l2TG90MXhST3AraEkyK0d0NjZUbUVj?=
 =?utf-8?B?ZTdDd1dXS21TanhhOWE2NnBSUE1zcFhXRE5iUWRJRnJCbEhZWnpZdk1mTW1u?=
 =?utf-8?B?RmdOK2RWR0gvcjVwY0hXRzBzdDBJbUpia3AvcUpyalBHZGJNOSttc1lLSlE0?=
 =?utf-8?B?a2NSYXJnR0VQM0N6Y3gvVUgwYUx0dFhkUHcwOVhjWFZtVE5TYzhTalB1aVgr?=
 =?utf-8?B?UEo0bCt3QkZJTGhFSEFCWlFUTmZkVGx4Zkg3d0l4ME5Ka1RjOVRRUG56SVpC?=
 =?utf-8?B?K2tDTVI0U1pHTCtVN01HdWNkWTlVaWZvOS93WnlYWjJ3eXI0VFBTT0ZUTXpr?=
 =?utf-8?B?WUg4a2FvUUtLWG9nS3ZKb3dMOTExUVVBVWsvSWxwZWU5LzJaSFR6ZFRWVEg5?=
 =?utf-8?B?SGdKL2xFcDBrV0ZsNEQ1Sy9kK1l3TUNBK1BKOTRRQlRmQWhFZmx3N0x3amVL?=
 =?utf-8?B?b09vUldKa0loUUJOaktDL21OcFVYYUpKeUxrT0RiQXVRNUxHdGM3TzRzNTg0?=
 =?utf-8?B?ek4xS1NQTk5sNnJHWGlUSnJzbEdVb1IvV29WaTNNcndWcWVoc0VqaUdoMlQ2?=
 =?utf-8?B?VlpLYlNNc3pXTGk5N0FCMGlpMk9PWU12RnlFRjg0UndyUUtlUjhpRjBxUXow?=
 =?utf-8?B?SWhRcmJjMVJJVkVsZ3F5QSsyTWhnbDg0QzRvWldDZW12T1F0YWRFTXpXK3NH?=
 =?utf-8?B?SHQrN212RVY2aVY0SmNUVFNqQ0N3alJBTVZUVHJhMjJSQ2JzSyszbGNtckFt?=
 =?utf-8?B?TUNrSktCV1FrSFU4TVFSaEtabDFQOWs1Q2hwN3lHZ3c5NnBMUzhkTnZGV3pP?=
 =?utf-8?B?ZDBTaU5RQ1lYTWtzQTQwTmxxY0lwM0VvZ3U0aTVic28wOGcySUlLK1ZjRmpX?=
 =?utf-8?B?dGhqQ0JhajFKZVdoa25VT0k5SXc3U1VPUFVUNWo5dHBvMThSWFY3RGhVejdO?=
 =?utf-8?B?Z1dlVUorVmg2UnRoVDRraWk1ZEYrV0M5Zm5UMzJQVWxzQjhldHpXRU9xT2pi?=
 =?utf-8?B?Q2hwZmt0ODlXV3B0ZmpheWxFMGFuc08vSS9QWlNVdXFaWTlWdFlKRU4zY1lV?=
 =?utf-8?B?S1JQQXlFTEhsTGdsT2JLNDlhR1c3QkJQdFo0blZUVmtySDNHRFp6WWV2QzA2?=
 =?utf-8?B?akpFajZsMXNqUmw4MnBMRk1Hd1cxazI2VEFsZFYrbWNaZk83a1loRlZlNlNs?=
 =?utf-8?B?d2R2OTFvL3lLU2JZOGtTbG5SNWhNemhvcDNUMGNCYnVTaU03c1huQjdSSEw5?=
 =?utf-8?B?NklzVTRnT2QxMnVYTnhqNlhMOXRjSlE4MjJHeWI4NkY5SzhFRmIxTnZiK1Qy?=
 =?utf-8?B?RHpud1UvbUZDdUJpZjRiekM0WHBaa0FvcFo4cHh4SUxFaWVqRW0wemN6QU9a?=
 =?utf-8?B?NWN5NTZ0emFGYlNvcGMwNTJWRFBVeXF0eDdnT2VJV045Y2ZjSFBjVHpOQ0x6?=
 =?utf-8?B?MzBVME5rbkZuWDd3YngwelFKUlJkWGVNWkdSN0VZbERLUkIxbHNEQUVBRXlU?=
 =?utf-8?B?dEkwRHRjMFQ3SHBIemgwSUlPby9rY3g1b0xpOERxbG5QOGprQ01SVUhmRzdG?=
 =?utf-8?B?aG9uVmNDOVo2UGFjdUg1SUZ3dU5jdzdEUWdLVVQrSkFNNkZTa214WEEvUUZq?=
 =?utf-8?Q?E044upaveUyqJMyObTy8M34q8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <654BD5D1AE78C84EB6B2296B8978C198@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650776d7-4225-471d-dcca-08dae3833d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 18:43:23.2892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Cww6uioQTTFNXT4j2Exc9GT7xT/BTNLwozA9oF6PkxF4Pc6rEUouDigEcpI/wEuMWTaNSvgDKutQH8V2QeHRgRkWEAf6hAbFF00LbzHsqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5922

T24gMjEvMTIvMjAyMiAxOjI2IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlIGhvb2sgaXNu
J3QgbW9kZSBkZXBlbmRlbnQsIGhlbmNlIGl0J3MgbWlzcGxhY2VkIGluIHN0cnVjdA0KPiBwYWdp
bmdfbW9kZS4gKE9yIGFsdGVybmF0aXZlbHkgSSBzZWUgbm8gcmVhc29uIHdoeSB0aGUgYWxsb2Nf
cGFnZSgpIGFuZA0KPiBmcmVlX3BhZ2UoKSBob29rcyBkb24ndCBhbHNvIGxpdmUgdGhlcmUuKSBN
b3ZlIGl0IHRvIHN0cnVjdA0KPiBwYWdpbmdfZG9tYWluLg0KDQpIb3cgeW91IGZsdXNoIHRoZSBU
TEJzIGhhcyBhYnNvbHV0ZWx5IG5vdGhpbmcgdG8gZG8gd2l0aCB3aGF0IG1vZGUgdGhlDQpndWVz
dCBpcyBpbi4NCg0KQnV0IHRoaXMgaG9vayB0b28gY29uZnVzZXMgcDJtIGZsdXNoZXMgd2l0aCB2
Y3B1IGZsdXNoZXMuDQoNCj4gVGhlIGhvb2sgYWxzbyBpcyB1c2VkIGZvciBIVk0gZ3Vlc3RzIG9u
bHksIHNvIG1ha2UgcmVzcGVjdGl2ZSBwaWVjZXMNCj4gY29uZGl0aW9uYWwgdXBvbiBDT05GSUdf
SFZNLg0KPg0KPiBXaGlsZSB0aGVyZSBhbHNvIGFkZCBfX211c3RfY2hlY2sgdG8gdGhlIGhvb2sg
ZGVjbGFyYXRpb24sIGFzIGl0J3MNCj4gaW1wZXJhdGl2ZSB0aGF0IGNhbGxlcnMgZGVhbCB3aXRo
IGdldHRpbmcgYmFjayAiZmFsc2UiLg0KPg0KPiBXaGlsZSBtb3ZpbmcgdGhlIHNoYWRvdyBpbXBs
ZW1lbnRhdGlvbiwgaW50cm9kdWNlIGEgImN1cnIiIGxvY2FsDQo+IHZhcmlhYmxlLg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwgd2l0aCB0d28N
Cm9ic2VydmF0aW9ucy4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnaW5n
LmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2luZy5oDQo+IEBAIC0zMDAs
NiArMjk5LDEyIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBwYWdpbmdfZ2FfdG8NCj4g
ICAgICAgICAgcGFnZV9vcmRlcik7DQo+ICB9DQo+ICANCj4gKy8qIEZsdXNoIHNlbGVjdGVkIHZD
UFVzIFRMQnMuICBOVUxMIGZvciBhbGwuICovDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcGFnaW5n
X2ZsdXNoX3RsYihjb25zdCB1bnNpZ25lZCBsb25nICp2Y3B1X2JpdG1hcCkNCj4gK3sNCj4gKyAg
ICByZXR1cm4gY3VycmVudC0+ZG9tYWluLT5hcmNoLnBhZ2luZy5mbHVzaF90bGIodmNwdV9iaXRt
YXApOw0KDQpOb3QgZm9yIHRoaXMgcGF0Y2gsIGJ1dCBmb3IgY2FzZXMgbGlrZSB0aGlzLCB3ZSBz
aG91bGQgcHJvYmFibHkgZHJvcCB0aGUNCmZ1bmN0aW9uIHBvaW50ZXIuDQoNClRoZXJlIGFyZSBv
bmx5IHR3byBvcHRpb25zLCBhbmQgdGhleSdyZSBpbnZhcmlhbnQgZm9yIHRoZSBjb250ZXh0LCBz
bw0KDQppZiAoIGhhcCApDQrCoMKgwqAgaGFwX2ZsdXNoX3RsYiguLi4pOw0KZWxzZQ0KwqDCoMKg
IHNoYWRvd19mbHVzaF90bGIoLi4uKTsNCg0Kd2lsbCBhbG1vc3QgY2VydGFpbmx5IGJlIGZhc3Rl
ciBvbiBhbnkgQ1BVIHRoYXQgWGVuIGlzIGxpYWJsZSB0byBydW4NCm9uLsKgIEVzcGVjaWFsbHkg
YXMgSEFQIGlzIHByb2JhYmx5IH4xMDAlIGNvbW1vbiBjYXNlLg0KDQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9zaGFkb3cvaHZtLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0u
Yw0KPiBAQCAtNjg4LDYgKzY4OCw2NiBAQCBzdGF0aWMgdm9pZCBzaF9lbXVsYXRlX3VubWFwX2Rl
c3Qoc3RydWN0DQo+ICAgICAgYXRvbWljX2luYygmdi0+ZG9tYWluLT5hcmNoLnBhZ2luZy5zaGFk
b3cuZ3RhYmxlX2RpcnR5X3ZlcnNpb24pOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgYm9vbCBmbHVz
aF92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCBjb25zdCB1bnNpZ25lZCBsb25nICp2Y3B1X2Jp
dG1hcCkNCj4gK3sNCj4gKyAgICByZXR1cm4gIXZjcHVfYml0bWFwIHx8IHRlc3RfYml0KHYtPnZj
cHVfaWQsIHZjcHVfYml0bWFwKTsNCj4gK30NCj4gKw0KPiArLyogRmx1c2ggVExCIG9mIHNlbGVj
dGVkIHZDUFVzLiAgTlVMTCBmb3IgYWxsLiAqLw0KPiArYm9vbCBjZl9jaGVjayBzaGFkb3dfZmx1
c2hfdGxiKGNvbnN0IHVuc2lnbmVkIGxvbmcgKnZjcHVfYml0bWFwKQ0KPiArew0KPiArICAgIHN0
YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3QsIGZsdXNoX2NwdW1hc2spOw0KDQpUaGUgaGFw
IGFuZCBzaGFkb3cgdmFyaWFudHMgYm90aCBoYXZlIGEgc3RhdGljIHBlcmNwdSBtYXNrIGxpa2Ug
dGhpcy4NCg0KSG93ZXZlciwgdGhpcyBpcyBhbiBpcnFzLW9uIHJlZ2lvbiB3aXRoIG5vIG5lc3Rl
ZCBsb2NraW5nLCBzbyBJIHN1c3BlY3QNCnRoaXMgcGF0aCBjYW4gc2hhcmUgb25lIG9mIHRoZSBz
Y2hlZHVsZXIgcGVyY3B1IHZhcmlhYmxlcyB0b28uDQoNCn5BbmRyZXcNCg==

