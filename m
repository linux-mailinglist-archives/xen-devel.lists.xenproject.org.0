Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA69607193
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 10:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427404.676419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmys-00029y-Es; Fri, 21 Oct 2022 08:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427404.676419; Fri, 21 Oct 2022 08:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olmys-00027Q-BN; Fri, 21 Oct 2022 08:02:14 +0000
Received: by outflank-mailman (input) for mailman id 427404;
 Fri, 21 Oct 2022 08:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRpv=2W=citrix.com=prvs=286e1060a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1olmyr-00027K-8Z
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 08:02:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e3b188-5116-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 10:02:11 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 04:01:33 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 21 Oct
 2022 08:01:29 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa%6]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 08:01:29 +0000
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
X-Inumbo-ID: a9e3b188-5116-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666339331;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gA0NvLnL3Fdi9ealQa+fLB0ppRWib8sd7dPdiRQcZ6A=;
  b=VfFnGi7Beip/HhKLzyI+g89T0gkbzMg8bCbPqKXaCAUjZxb6lbEjoNXU
   +2AYLkmcwO408HkpzdF0FOLsDk8yUXfdzGj5kLJWr3MY/GCX9kgnUQtvF
   9nQInjwvJ9kwZc6Z2hbvym7u25mg+zNLL7j9eOmIWIxr1w7hrrIF3B3zf
   Q=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 82330148
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4GSqVKx7N2Oc1lVfNad6t+cBxyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 GFJDz3Ub6zbYGD9Ltl3bti18hwFvsfcyYNkSldvpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtC5wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5L9rGT5tr
 ccjdnMzbRKypL21mb7lY7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDe7IA9ZidABNPLYdsKLQ4NJmVyfp
 UrN/njjAwFcP9uaodaA2iL23bSXxH+rMG4UPOCm6P0zjFq1/WNJT0YMDneZqMCCuFHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAIRyBMQMYrv8g3QXotz
 FDht8ztLSxitvuSU3313peZqymjfxccK2AqbDUBCwAC5rHeTJobixvOSpNpFv6zh9isQzXom
 WnV8245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 SRsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:IEppLqAKFnwyxF3lHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wOJSepLq59ts5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gSwlGl/NLAgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.95,200,1661832000"; 
   d="scan'208";a="82330148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8H0snc/oBXPu2kwd9UsA7bGOmIRLrPhfsLDeBdfar8hpc2Wk3g8tZQBxNg3B1WptNcVVtYUJ2M4vte/gXEtObXaKvA54woUajWR+FXvxz+aIGzsAuWfMkI1CLmzvTWv4hBznKPfX+MBZQoKgdU7JIyoex2E969ujut6pw4LWo7+DLn6HSueS+h0I8CPDzUyckeTzDYGmVS0hdTtuqWdf75iqOClXelAggLg3IvdVNtevF2h4oJczR1xvs5zVydqmt/f23yEzO4zsy/oWj4edgsA3lFE4kppi4DVfJI+GcSQA9vOODehXY1wmgeKLmT0xSVl1oCRwaVRK0jW74pEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA0NvLnL3Fdi9ealQa+fLB0ppRWib8sd7dPdiRQcZ6A=;
 b=FwimdSidqSLnoKe7uYRHuyJ+V4kKwVp1XGzaMbkpa1KvNS/g0/aj5pFHj9tssZcrwYVVUv7ue9ikgNSA79OAhPGsPgHhy+vE/m3eiR/9yRQz+GVHkrz+cea1rzuA9gEB7XlLfLBlBPt1RCeijxbn3Mfc7sRZJMiZsZbYaR87ukmhmUKft11YEhlo0nrGmQCPt5mw5WS8YAtheLSCslBdI7oUwfPipQxP/VN7kBIkH57mIPFCSmWXpn2F3RJzeIIUyFvtK/t3h3lpCW5yVbP3JfPM6EWJJig0RK1+GgToJeiidGV5IHwSUtk4F94ys/z1D1CwbWyH+hxm6Df+j1JctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA0NvLnL3Fdi9ealQa+fLB0ppRWib8sd7dPdiRQcZ6A=;
 b=NofoeGeSyoLqi4kAQ6BEGx3gkMiOreFJ4ei98Sss6O+YKtGzv2YxTTkKSGHNUlM4EO2DFwx4QCkroyltELz2sw36Etv1Djhqhb27eRI5URwSWmn6RVjqJPduSItYiEkRwkhUsRe+pc2dBSI0eEY9iry9+O07KXSCQr3Jy/ZJk8Q=
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH for-4.17] tools/ocaml/xenstored: fix live update exception
Thread-Topic: [PATCH for-4.17] tools/ocaml/xenstored: fix live update
 exception
Thread-Index: AQHY5KTJuDEKM//4x0G7vfjVpiIJ8K4YejoAgAADIQA=
Date: Fri, 21 Oct 2022 08:01:28 +0000
Message-ID: <D6E18B43-7A98-4E89-84E0-17D3F5ACB2B4@citrix.com>
References:
 <12d90632bf881e96e0b6c256df193f00df187dc1.1666284745.git.edvin.torok@citrix.com>
 <B49FE4B3-77B1-4525-A6B8-C7CCA83CBC48@citrix.com>
In-Reply-To: <B49FE4B3-77B1-4525-A6B8-C7CCA83CBC48@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|DS7PR03MB5608:EE_
x-ms-office365-filtering-correlation-id: 45e2d284-2cf7-44c9-6e7f-08dab33a759d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BCPwgUPkt0SFdUyNPNFjEccNP7+HaeaDNWF++mUn6oOL9t64623A4nzoeanV+Z39Zm3xsSIIBUxncvgON65qn5YXZ344z0LBdxDSoeh74eXXoZ+LfaLNmlAgk0Iasp9aVHLMAyBYS7C5464RSsJ9RYEAHInCZ3orC6meyc5m+A6ghfzLMnchMVzCpoIc7Ynap9eQOy3m9u1xVUafdM6ny07TCbpsunCtmhFSEja0x6J23lrTSHSCE3W7LvskNt+pO94G1VKHmTiyntwUELoR26GAWg/TS8lRsNl77xb/8+iQT6oDtUgwZbZ+skissE0+VH8Pdzp+6YBmZt5Bzbed7dofwBD0j9kuF0jFWxg8fyd9gtltjUkizSbnkH0RRIfxFMysOaDQtOlIXopY2BG2c4cf0r6IpohnEOumF5H/tAVbUROlRa7wmgV125nGuuqWnQ9WhN2aoZHtDlXryduYYYyd29DROTQnFz4V8LycJyyis9n+7Ji53db3qMoHcY3gcyoJH3g8qN3THPQocSO7BVi3QqQ04KyaN/Q/5PYxx6A7zuZrQu26f0WZS3GmShD1F/qog61KPINOhMladTsXDM0Dl0GFF64t5aozn1tArO7mNvIib5f4N9+LdhWPcxpx2nCWppYJo7v2xM1tVR4j4UgK0jSlfSex8DAZiyUpfjhUdaLdJjtqMJ13a4PbskVYnSRrgvbWFWa8s/VK1A05MCvHPTCaWJSSQFmwFXNYIfXfqCDAHk15bWSuX9LP7shtO6udPBd7eu7gd3doJVFFxqiBv/hWywSiYTaVgke3dyEIQ9YV+znriM/ucnRUHzUyzFF7xnoGSC7ORbwWmI58ew==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(66574015)(82960400001)(38070700005)(83380400001)(36756003)(33656002)(86362001)(107886003)(38100700002)(122000001)(91956017)(66556008)(66946007)(76116006)(6636002)(54906003)(316002)(71200400001)(15650500001)(6862004)(37006003)(5660300002)(66476007)(53546011)(2616005)(186003)(2906002)(966005)(6506007)(6486002)(8936002)(4326008)(64756008)(6512007)(66446008)(478600001)(26005)(41300700001)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enluUFMwKzlCdFpKQjdDN051SWFrb3llVlh6QXRtaGRhSEppdHlwTmRaMEgz?=
 =?utf-8?B?Q2RSbkRBc3gzcHhnSUlMTU85a3J3TU8rUjd5YjZ6Z24wUmdkZ3FHYnd3TE95?=
 =?utf-8?B?QktTU2lzMTJGVHNtN1NlVWZCeUJkbDY0SzdnemVkODYyT0VGL3EzVTE0WXpn?=
 =?utf-8?B?VHZsSUt1U0VwRlpTazZRVmRxSzNOblZMT2dLTVRIM2lBTXp1SVY2bjY4SnJI?=
 =?utf-8?B?am5OaGV4TGFXWWRNZEI5ZFhQUlIvMFpCNGhUWjMvcXJMRzRWRXYxdmNPYWRM?=
 =?utf-8?B?QjJsd1AzM0FITVVVejNoc1ZKR0laVzFEUlk1RHBIOWhqckpRQ1ByZy9uS05L?=
 =?utf-8?B?SFVwMlBWV2dXemZsdEZOelBoNDJnME1VWjlrdTJqaUVOelJ6OEw5OURnSXdD?=
 =?utf-8?B?eHA3bmhSdjJ5bVJyd1dlaXhYYm1CY1o4aHlxanlRZlBiNXFmUnZkMVRPZFdm?=
 =?utf-8?B?SWhwNDNWWHFYb25YY3RpK2pNYkdpbkd5QWsxcExiOFRXcDVSTjlBRTNMWERN?=
 =?utf-8?B?MEpOMEl5NW9sbGdDd25iSEVHR1Y5WHd1ZElTS2RPUDVSV2N5ZkZSMmNnUm1V?=
 =?utf-8?B?SkdkQmlkNVBSQ0ZEeXBFR1I4bHRsRXNaYUtLZ2RLK2o5UVJrcTEzL3ZIVzJI?=
 =?utf-8?B?eGlqb2ZHSGMxd1RhdWJGdFI1U0xCZEtqb0llbmozR2x3Y1gyTUtueS9EemVr?=
 =?utf-8?B?eGdVeDFwR25PQjF4NWJ2aFREWUZuSUFUOE1jNEhjeVNqTWg4ek5pWDdwdDhv?=
 =?utf-8?B?ZC9POXgvamdIL3d5UGxHWERvK1ljSEgxK3NQV1BvNlJWeXFzallteFoxNFZ0?=
 =?utf-8?B?ajl6Mk9KYlNZYlRXeVQ1bGNuM1hoaDR0NWE2NzVMcTNncXlkYldkVEFKOGlN?=
 =?utf-8?B?aEU4aHN5RGoxWG91M2tTS2xOa1QxTENYOUN4aTFnMmJucVlpcjN3TUx5L3g4?=
 =?utf-8?B?d015Qi9ONzVpVS85Yk5hSEpBakU2ZllxOFVSQ3BIT0cvb0U2aXJrYjFWZ3dj?=
 =?utf-8?B?RUFDTmh2QStCSXJNak9qVFBpVERNTUZ1cTRQNk1pL09lK09wTUVHUmxYSjlv?=
 =?utf-8?B?a0pPUkk5TDltT1E4VjdkbEd6L0xVUEFCQis4ZUI3WVdyWm5teDFwQ2JYZURH?=
 =?utf-8?B?a0xBUzB0cklCeXBjek1CL1FtcWttWitSUUJMVXRka1pKTXRyejdHMzd5RlA5?=
 =?utf-8?B?Vk9YaE05YzUyaGVKZFRHL2p6eTBDS2QwSjBub2VaV0thS0ZjTDZmME5SaXFU?=
 =?utf-8?B?ejZRRXg2VzVsTWpqOVJVczVyU2pTU1dBNkc4dGpQWlcwNG1qWXdmR3RPT0or?=
 =?utf-8?B?WkdCcGJmQjZQcUo3MzNrVjZKVkZnenFuZFFtTDNsdm1VODJNVVV1WFpmeDhs?=
 =?utf-8?B?Q0c4UEtwbGNwT2lqYlNNSzhiODBvOTJWUFdFaHRXK3JEc3VyaklaUkkzOVgz?=
 =?utf-8?B?VVRpbXdQb0VjU2hYYzJUNFRIUndMUWMxNlY1Y01XbWQ3NU5LNy9ma2ZBUmZy?=
 =?utf-8?B?eUZ2Q0tMTFlhZUw2V2krVThJZ2d2bkk3NjFoMWxkOXYvQldNOVMvMzJrc2JB?=
 =?utf-8?B?RDRzOXdRU1JVaTlzVDhvRFpINHEyQ2V4UEJQYUN4Qnh6clJIZkJoc29CRjNo?=
 =?utf-8?B?L0tJNmF6andlRXpySnE4WmVJeTZMVDVxbTZBZnBRU1libzV4UGZuU3lNUHRm?=
 =?utf-8?B?MHhnUWhNQTBzOXVGLzhXTDZZZ0RsNXRreGFocU95Y2FXWDVvNmhySW5yVzNk?=
 =?utf-8?B?TjZQYXZFQkZCRTh4Lzc0RnQ2Qk1iUG1NYXNjT3ZrT2tsQWF2bjhVR0ZDMThT?=
 =?utf-8?B?RDd3eWUrdmVNbno0NXZNalltU0luL2MzS2krMzVVWU5nZ2F6bDcrSDRlTVQ5?=
 =?utf-8?B?eXg2cHorczQzVFJRcmJZMUJ0UklndkVpQmYwOEdDQzF2dnJKSGQvNnZ0RjZ1?=
 =?utf-8?B?eHNpd29tbENJelZKd01rMkdmbUJjVVA4K2JrME95VVM5eWpqY3h0aThnSjNK?=
 =?utf-8?B?UWJFdG9FOXAxcjdoMnRMMUZjVHBqS21JMXJCUDNNNXZrbHQwaFBYMW5Ud2ZX?=
 =?utf-8?B?Nzd4Z01YYlMzUGJ5dllYUVhFUUlGaFppY1lzWFVQNUF2b1p4ejFoeFhuNS9O?=
 =?utf-8?B?bk5ZbXhuK0dZeUJjWGdoSVYxaHM5NUhPOTRnMmhxM0tZcGZMb0pwNXFuT2hT?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B65CB6F6081204185C4C6005171E3B9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e2d284-2cf7-44c9-6e7f-08dab33a759d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 08:01:28.8760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TQD4Q3tVhaNPWlLM9sLtAEwyrwllBzsm2kwav2RW6/fxmHNKBUFLF+edz78hlLi6DzAR/uU2r7mdtbxRhfDLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608

DQoNCj4gT24gMjEgT2N0IDIwMjIsIGF0IDA4OjUwLCBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMjAgT2N0IDIw
MjIsIGF0IDE3OjU0LCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPiB3cm90
ZToNCj4+IA0KPj4gRHVyaW5nIGxpdmUgdXBkYXRlIHdlIHdpbGwgbG9hZCB0aGUgL3Rvb2wveGVu
c3RvcmVkIHBhdGggZnJvbSB0aGUgcHJldmlvdXMgYmluYXJ5LA0KPj4gYW5kIHRoZW4gdHJ5IHRv
IG1rZGlyIC90b29sIGFnYWluIHdoaWNoIHdpbGwgZmFpbCB3aXRoIEVFWElTVC4NCj4+IENoZWNr
IGZvciBleGlzdGVuY2Ugb2YgdGhlIHBhdGggYmVmb3JlIGNyZWF0aW5nIGl0Lg0KPj4gDQo+PiBU
aGUgd3JpdGUgY2FsbCB0byAvdG9vbC94ZW5zdG9yZWQgc2hvdWxkIG5vdCBuZWVkIGFueSBjaGFu
Z2VzDQo+PiAoYW5kIHdlIGRvIHdhbnQgdG8gb3ZlcndyaXRlIGFueSBwcmV2aW91cyBwYXRoLCBp
biBjYXNlIGl0IGNoYW5nZWQpLg0KPj4gDQo+PiBQcmlvciB0byA3MTEwMTkyYjFkZjYgbGl2ZSB1
cGRhdGUgd291bGQgd29yayBvbmx5IGlmIHRoZSBiaW5hcnkgcGF0aCB3YXMNCj4+IHNwZWNpZmll
ZCwgYW5kIHdpdGggNzExMDE5MmIxZGY2IGFuZCB0aGlzIGxpdmUgdXBkYXRlIGFsc28gd29ya3Mg
d2hlbg0KPj4gbm8gYmluYXJ5IHBhdGggaXMgc3BlY2lmaWVkIGluIGB4ZW5zdG9yZS1jb250cm9s
IGxpdmUtdXBkYXRlYC4NCj4+IA0KPj4gRml4ZXM6IDcxMTAxOTJiMWRmNiAoInRvb2xzL294ZW5z
dG9yZWQ6IEZpeCBPeGVuc3RvcmVkIExpdmUgVXBkYXRlIikNCj4+IFNpZ25lZC1vZmYtYnk6IEVk
d2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IHRvb2xzL29j
YW1sL3hlbnN0b3JlZC94ZW5zdG9yZWQubWwgfCA0ICsrKy0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L29jYW1sL3hlbnN0b3JlZC94ZW5zdG9yZWQubWwgYi90b29scy9vY2FtbC94ZW5zdG9yZWQveGVu
c3RvcmVkLm1sDQo+PiBpbmRleCBmYzkwZmNkZWI1Li4zMjk5ZmU3M2Y3IDEwMDY0NA0KPj4gLS0t
IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbA0KPj4gKysrIGIvdG9vbHMvb2Nh
bWwveGVuc3RvcmVkL3hlbnN0b3JlZC5tbA0KPj4gQEAgLTM1Myw3ICszNTMsOSBAQCBsZXQgXyA9
DQo+PiAJKSBpbg0KPj4gDQo+PiAJKCogcmVxdWlyZWQgZm9yIHhlbnN0b3JlLWNvbnRyb2wgdG8g
ZGV0ZWN0IGF2YWlsYWJpbGl0eSBvZiBsaXZlLXVwZGF0ZSAqKQ0KPj4gLQlTdG9yZS5ta2RpciBz
dG9yZSBQZXJtcy5Db25uZWN0aW9uLmZ1bGxfcmlnaHRzIChTdG9yZS5QYXRoLm9mX3N0cmluZyAi
L3Rvb2wiKTsNCj4+ICsJbGV0IHRvb2xfcGF0aCA9IFN0b3JlLlBhdGgub2Zfc3RyaW5nICIvdG9v
bCIgaW4NCj4+ICsJaWYgbm90IChTdG9yZS5wYXRoX2V4aXN0cyBzdG9yZSB0b29sX3BhdGgpIHRo
ZW4NCj4+ICsJCQkJCVN0b3JlLm1rZGlyIHN0b3JlIFBlcm1zLkNvbm5lY3Rpb24uZnVsbF9yaWdo
dHMgdG9vbF9wYXRoOw0KPj4gCVN0b3JlLndyaXRlIHN0b3JlIFBlcm1zLkNvbm5lY3Rpb24uZnVs
bF9yaWdodHMNCj4+IAkJKFN0b3JlLlBhdGgub2Zfc3RyaW5nICIvdG9vbC94ZW5zdG9yZWQiKSBT
eXMuZXhlY3V0YWJsZV9uYW1lOw0KPiANCj4gSSBub3RpY2UgaW5jb25zaXN0ZW50IGluZGVudGF0
aW9uIGJ1dCBsZXQncyBpZ25vcmUgdGhhdCBvciBmaXggaXQgYmVmb3JlIHRoZSBjb21taXR0aW5n
Lg0KPiANCj4gQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0
cml4LmNvbT4NCj4gDQoNCg0KVGhhbmtzLCBmaXhlZCBpbmRlbnRhdGlvbiBoZXJlOiBodHRwczov
L2dpdGh1Yi5jb20vZWR3aW50b3Jvay94ZW4vY29tbWl0LzRhODlmMWY0NGNiMTcxZTFmOTJkYWUy
NDAxYTU4MGExMGZkMGM1YTANCkFuZCB2MiBwYXRjaCBzaG91bGQgc2hvdyB1cCBvbiB0aGUgTUwg
d2l0aCB0aGUgMiBhY2tzIGluY2x1ZGVkIGFuZCBmaXhlZCBpbmRlbnRhdGlvbiBzb29uIHRvby4N
Cg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg==

