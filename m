Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A95F7D6C69
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 14:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622862.970076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdNs-0000dI-0F; Wed, 25 Oct 2023 12:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622862.970076; Wed, 25 Oct 2023 12:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdNr-0000bb-Tg; Wed, 25 Oct 2023 12:53:15 +0000
Received: by outflank-mailman (input) for mailman id 622862;
 Wed, 25 Oct 2023 12:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ/a=GH=citrix.com=prvs=655ba0516=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvdNq-0000bR-N9
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 12:53:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74857c03-7335-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 14:53:13 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2023 08:53:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Wed, 25 Oct
 2023 12:53:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 12:53:07 +0000
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
X-Inumbo-ID: 74857c03-7335-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698238393;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0lXswFmSxr4dIxXf+L2Nhcjf1W38tkfPrM943KUtfL8=;
  b=O0OZr3S4o2E/R1vjQdNjFED97JhfhMTuGHJ8aZomy+CB2zTWJ7euH557
   Bq7I2kmyR+lWnxuG+JMrUUrNbs5P1WIcSsqLZeeHZdkHq9ZLAAt2m0wt9
   FNs5jfV1gboW1doo8AfMIMarKB3g/RIueCE0oLwz6mbxKpFcHn5Sspj7y
   E=;
X-CSE-ConnectionGUID: omi6nT4cQy6n3d+IfSx6mg==
X-CSE-MsgGUID: 2iE6qDcIQvWdSaTUoD269w==
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 126469079
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:4i2QxahoJM7EgoUyiL6BxAXcX161RxEKZh0ujC45NGQN5FlHY01je
 htvW2iAMqmPYTemeo8iOtmyoEIP7ZCDz4BiGgdqpCwwQygb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyp0N8klgZmP6sS5AWDzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQfLTFTaCzfjNunnrTgRqpNiP8zcszkadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS0WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmlBNxDTOLpnhJsqAeS6zIKJBY3bEWErcKwtnO5d4gBe
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/Seiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:dqb6V6G4/tGZbu+VpLqEzseALOsnbusQ8zAXPhZKOGZom+ij5r
 mTdZMgpHnJYVcqKRYdcLW7UpVoLkmslqKdjbNwAV7AZniDhILLFvAB0WK4+UyZJ8SWzIc0vp
 uIGJIObeEYY2Iase/KpCGlDtA6zMCD4MmT9JzjJrRWIT2CqZsM0+60MGmm+4RNKjV7OQ==
X-Talos-CUID: 9a23:EWe6r2ERotXDeQsQqmJg8U9KHPx5eUTMknGLLwyZB115FriaHAo=
X-Talos-MUID: 9a23:vhA03QmNH3cb294PBNyIdno4Neo2+oilKXkTrpk9svW5MgAqZWaC2WE=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="126469079"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAXOeIRC24LgV0fNK7/iA/8lclM8ZpbujWCNLY0L08zXWv90JOLo6keDtxY4vvIlESoo3dWL1qCPKbZJPdILJvyGqVTyEeO3VvuQeincxW/zvbpwATOjl+C0l+gQ84qKGulAgoHjoggleQh7MK46bASdmsIegrqILqWO/l6V4g1gSpaoqS/Nf8Ad+1Deq47dfrLcxZsauHAnRDc+elihmYvuoZOl5vM7ba1qGXiTYquLX2LMH5M8jddrKJkw74Po0Rfc91B/359awxLJGJHUWovHB/EHkspTORB0QyZcTn4fCedfXPeuvNyuyP1Z3+Z/5ssTgwJTugcQRjcCbC5hIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnbtn8USSL7+GRlqiH2XcA4xrz0jqmq+/ZvYey1vv6c=;
 b=czbATwH7ELqDWrtKTOaB1HuE2f8tdR3WqlFpLYYTxi/EvkqeG8WqV42nI/Pp6NfV9ulqjMxo0Oot4cWb6VINdxjzyRZY5oq4ahYZ4pAZfdChfgNL9mIGkoBY6Czl6wsRSiPDVj+6lGzRUcKuUUNfebcD/U68m4cZIfdvzxXXNSz8Vn1DLacKgYdjZDySPOwmNUHN9VMK6Qvf5DaCsTPLIva5n2pm5IS7NecNa6OFzCzKTsgDeKSaEslhtYhBRjCUWVptjRtSpnw4m46/oKZAjsdvD1TqyjTqx+p/zYyH4yjb46ibvT+6XEh/Bx2Ton6PWmNPRa30OhEcgRytvpxt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnbtn8USSL7+GRlqiH2XcA4xrz0jqmq+/ZvYey1vv6c=;
 b=CGaNBHkwMc3jXib6FoHZ+bdtla4kBZQte+98oYdBwF9UGxgcn43Mlh5NFuNHJEL4NfjPDvtTgkbQu65Pvc1KEnyc99+xI/eqWvcSInKU2OqfuYlbN+psmbMHLtwG+xWJf3WxTQ8+FqFMmYVn37dN8NEtzlpZjbIaLQhSkpQtM8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Oct 2023 14:53:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vPIC: check values loaded from state save record
Message-ID: <ZTkPr3RHYXlRrl2f@macbook>
References: <060ae425-2daf-9ce4-d291-215d483d592d@suse.com>
 <ZTjp_LYGwvKKumYg@macbook>
 <3de3481d-5884-02f8-6f32-faa53d16ab24@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3de3481d-5884-02f8-6f32-faa53d16ab24@suse.com>
X-ClientProxiedBy: MR1P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb953d5-019f-4435-046d-08dbd5595618
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	no95YifLYKFFw7YHx32pGD9xvIpKwZr/RJlOUuIZjXbz06H22JTgwkSJ4n8ZJGxy9jeOqA8Ti1ScvaZhEkgFaeBM2aBdljAS+HzYBqNTcO+THrh3MtgcudXunu/Oav9XQUFyto8QHqKMjqBhf7MGXbGV3jtLET3E0Oz9GqNTXEwVekSZdgKLDwbppYGRoTNDB5u0snTncWgnieK4UTL/zEX9Ags6JA2ZyU2MKzPaStDyexvMXnYjqqeJ6e7N50coAsffEaTs13BPBXZQdrrYnE4Vz+Rm4DYE6EVgu59mj/lL2TCEFyyPwmx+/V7yHr0Qv9tlEJVFWgVquR+Y0AkJNXVrMX0Nkj0UvPGM5xslP5YplK1FOly72Qdkv7UljC0KyJGqd2Eb87fZwCIZg+D1oqrVlwbMVChmxfHGvl8AV6+YghOERvbCcwxq0M7/6fqnHH3sI7GoWOabTn4QRObP6NHPq0PAEBGRfv+06yT0wDSDbwDuK0ZlAREH5mk0oIFfvHWHJWIVcSwBLnufR33JUBCYLx010sCKypSib3U5Ya1p4ZticTjZ1us06CbprPHELab0LAdDWlyPGuwF6mKL25VDaP39QJ+fVESv3/OCqPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(33716001)(38100700002)(2906002)(41300700001)(86362001)(5660300002)(85182001)(8936002)(8676002)(4326008)(6916009)(54906003)(6506007)(478600001)(82960400001)(66946007)(66556008)(316002)(66476007)(6486002)(83380400001)(6512007)(53546011)(9686003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmRyQy96WlZZMDljamlJeStNODhlUFo4cG9abDlJSzg4bksvd1JVSlpQaDRh?=
 =?utf-8?B?dGo2KzRtQVJUOXhqRGpRckQ3Yi93czVnQ0pFbDBLc0wyL2JjUWE1UDNyU0RV?=
 =?utf-8?B?WG5HYTRNRmkrQ0d0SU4rNjdqWTZYOXBhN1lBNWt1YVVSYWk1eTZSK04zdmts?=
 =?utf-8?B?S2xGaG04OWdsYWlObG9tV0ZPSlE4YVpnVXVRWGtOMWRuS0hjRXVudkgvWXRS?=
 =?utf-8?B?ZHUxQlJpcG5CREhVVXVhTUd2MnVEenV6VTVHRXZna3o0QzQra1AyTlRZczRp?=
 =?utf-8?B?TldiNC9wT2g5ZjdocDdneFF1MEE5R3VqdFVRSGdhUFZVWkh1T0xQVUxSQmcy?=
 =?utf-8?B?U1F4UDc1RFdzbTdSM2FNY3NrSEVTTG9CR1JjQ1JiTFF5MGNHWDRXdE9weUl1?=
 =?utf-8?B?c29wMkQ5WU9pTlRhWDdNZUtFMytDZWJudG1mNmNOQ2xVNURBejZTazQ3WXRW?=
 =?utf-8?B?Z1J4RUNEb3ZOY1duV3hOQ0NFVHJVNkZCdXBIaUNRQmJsOVdGK1F0akNPb0RL?=
 =?utf-8?B?dk53emRBaVRQdVMyWkdvbWJmVXpuOTEvckZXQkRCc01sdU42bEttWjNqQmJU?=
 =?utf-8?B?UkNnZkZzVktmVzVKZHdQV01FRmNLZGRiTnk5RGNaSzIrYzczVUdHaWF0UzVa?=
 =?utf-8?B?d3dubjg0S2pKWEoyV0tRNXpicjRRaHVZR3l3Ums2aGY1WWsvU0ZmTTRvdExK?=
 =?utf-8?B?TzdVVERmdEdCRDhrSldyZUN1WmNveWRYc05NdWYvVlpIZ0pOSjFKL29iWHNR?=
 =?utf-8?B?YWd0Mk5PRlIyQTJ6RXJ4RXFjN2xhYXBtRFgzcXN1Qk50Ylpwc1RjR2pDd2I0?=
 =?utf-8?B?SzlFYVVpSllqUW9LdnBmb3k0enlLYy80eEZ5ZThWU3YzekRzSEtwLzZhL01w?=
 =?utf-8?B?Vm84SlpldW5ST3QzMGdLQjNXbGtKMFhVWWxEb2JxSUNNd21HOXRsZ0NIS1FY?=
 =?utf-8?B?enlUL3FBQ1pVdDAxSS9aTnNva2JhSnhWbjFMNjNzSk1ubWdKdzJORUpOZDcy?=
 =?utf-8?B?bVIzTm54RjV4T3FWaHV6R3BjdE91RW5WYThTcUVrVWora0hrSGMxT0FXMFVE?=
 =?utf-8?B?TXlLY29BeUErMU0yL0hQMjZZb3hWZ0hFUWVSbXRRdmNPdk5naXA0Q2FZZUpZ?=
 =?utf-8?B?WVJOWE5hWTIzNjU5YnBWVWhyWUE4TUlHVTY5ZUorYStRdElCcURXM1VnQ2RB?=
 =?utf-8?B?TjhLWitncVdwZHBxZjZSbEtCWlZOcHpPeE9xZHA4U05JM1VGV0dFd0FnUVZD?=
 =?utf-8?B?YUNPakhIcElkVERPTzhMZkJGZnJVSEdXNmU5KzhVUGtjcGgxbnpnazBpY1Fl?=
 =?utf-8?B?aFdKV3lEeWwwQjNnQjFRMkhRL3kzczhOaEdrczU2Q1Frckl6MjUxUnlNamQr?=
 =?utf-8?B?WnpCeGFWQWdQUnZtbDBFWWZTS3JFVnNXd0gxTGpwWjFKWlArTmRjeEQzWXdm?=
 =?utf-8?B?Rkt3MDRYaXZlMFVycXRRb0Zibkd4U05GR0JrZ3RiUVFJMENBSUFkYzIrWEs3?=
 =?utf-8?B?TFEzU2lLUGxJd25MQlBFTzEvdjBPL2huczVBQjdQNG5vS2lJYkZTOHFLTWpQ?=
 =?utf-8?B?NFZ2S2Z5eFB6cTZzVWZtNFNKTkd5Zmh0S3BWeXduQlU5WWxyNE81MlE4VnZS?=
 =?utf-8?B?WGx5QXNzNzBEREczSCtWVzkwMkJlYWcrM1RRakFxajlQYUNzQm5rZnRaL29T?=
 =?utf-8?B?emNFVk5VU0VkVWVqUWVoNk9NYWlCdk9IWEdXZWVVbU13eXhYblRxOWxhdy80?=
 =?utf-8?B?Um12MmRSWXcxeUYrZ1BqRXJzWThqaCtmM3FTMEhpT250WkdBNWh2V0FoQWtz?=
 =?utf-8?B?VXFURXFBdng3amw0NGJ1b0s0c1Q5VmtjbW56MUtKYjVkNnZaV3dJN1NkZitH?=
 =?utf-8?B?ek5aZTJ3cDh2WXlORzJqUENiL3M0WXFNN2pIc1poMDZNV3IvR3UzeGg4azFa?=
 =?utf-8?B?c3UvOGhJTkZlT0lscHNvL3krME5yNnVsMVBFRCt5Z3BzTWJVZzU2OFhEY0xD?=
 =?utf-8?B?Vml1a1d0c1hUcUQ4NytsOTJrSkpYb3RHV2EzSEh4YlBqam40OE8zakR0eTB1?=
 =?utf-8?B?M0ZuOFdDSlNERy9oa1JaODAweUVaSFpjSGMyZ01yZ1BXT05hZ3pYMHZwZ1Ft?=
 =?utf-8?B?Vis4YXVzQ2RvZkgyTlNleitocjJ5MkswdUZzMndrT3I2NWJkK1RjRzE1UU1N?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mmiMh53TqqZtg1X81/k45YAz+7NXpC8Ed93RzQkz8W6PiLmToDIImNCenzAf9onPmGYRBvoMGu07xhN+wf4nEKBGNyenWBb3HwNdZK1VjHSIkjpjgDpQlVupOX2c/NpQgbLbbGqDsVZkg4hd+CcJx8qr6u95tuxvgi4dhxSYYm1n5nBOHntnYj993EhUmGL4gWJs2Gi+uNik4LITkeIhK+DHVwwBl0gU2VdrKM1d4zCwhBn1DOweKB4nqW2VuWfTkZKs68obSNL26f+9z8L0dlB1lIw/BYZnKHYoTOeXb92n5km5VYVlE4Mw4/DjzS/+ig8BtpGd5zV4XPyRkwsBmpgOKn5mdkCfYak0QMWlo/IOgKrwF4/CTS+nON/RdaeaRcnwSsEgb5FMWNk7nUtv0a28Xl7HGtXu4sK223qFuU13Aqi+7hrhAMAK1q3+ucuy7Ph8atPc6I/NgFa50UhjMlpJAUrdFiyv6X58I71d6bkQ1iJPigUQHar3D1UusaIrdQiQZyr+OIsLg6IoSNvwYkdWM92mVBAycd3iPEnOVPZFDortP2EVXptJjBJ0/JFbZpaP3RzB+Nj8+NfylcyVedIj91etiDQufd1FXEzNz3Omo2AaqExMV3HPNkedTRjF3pEtJvDrh5XNIfOFl50CQ/rfjLu3UTQ+hWQtEkBPXg0IX7sGn68i5jplyrDufcpvpWZsY9ERW9cokuXav5iPRr28H6K1rOG1gj9JqdpULrEKoHJKr77RMOoV/oIGmSTJaP/Fhb0nPs40fSo+ebyZ9/y5f5cNe604oNOUY1BCqHTAdakKq2TTuXtgWXQsdddcsXAKmNuIVkd3N+UK6B4k0Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb953d5-019f-4435-046d-08dbd5595618
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 12:53:07.8933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxWAbOms9Y4n8N/dHXKT8mi1Ym4ySAPBJUFM/BssVX5xpvo4PC3ifDzUqehBa1GkMnc3ztMlKg9Ls44lwPIm4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944

On Wed, Oct 25, 2023 at 01:51:05PM +0200, Jan Beulich wrote:
> On 25.10.2023 12:12, Roger Pau Monné wrote:
> > On Thu, May 11, 2023 at 01:50:33PM +0200, Jan Beulich wrote:
> >> Loading is_master from the state save record can lead to out-of-bounds
> >> accesses via at least the two container_of() uses by vpic_domain() and
> >> __vpic_lock(). Calculate the field from the supplied instance number
> >> instead. Adjust the public header comment accordingly.
> >>
> >> For ELCR follow what vpic_intercept_elcr_io()'s write path and
> >> vpic_reset() do.
> >>
> >> Convert ->int_output (which for whatever reason isn't a 1-bit bitfield)
> >> to boolean, also taking ->init_state into account.
> >>
> >> While there also correct vpic_domain() itself, to use its parameter in
> >> both places.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Of course an alternative would be to simply reject state save records
> >> with bogus values.
> > 
> > Likewise on the vPIC one, I feel it might be better to just reject
> > such bogus entries, instead of attempting to amend them.
> 
> Perhaps we should discuss which route to take on the next x86 meeting?
> Then also Andrew would have a chance to voice concerns; not sure if
> he's following the thread.

I don't have a strong opinion.  It seems more prone to errors to try
to adjust state that we know it's wrong.  The adjustments could have
bad interactions, or we might miss other fields that also need
adjusting.  Plus any such 'bogus' state is a sign of something going
wrong.

Thanks, Roger.

