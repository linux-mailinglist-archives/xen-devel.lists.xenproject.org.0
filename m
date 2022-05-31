Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533E5394A3
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 18:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339849.564758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4JO-0006gN-IP; Tue, 31 May 2022 16:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339849.564758; Tue, 31 May 2022 16:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4JO-0006dB-FL; Tue, 31 May 2022 16:01:38 +0000
Received: by outflank-mailman (input) for mailman id 339849;
 Tue, 31 May 2022 16:01:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8THd=WH=citrix.com=prvs=14366b804=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nw4JM-0006d2-UF
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 16:01:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f06a67b5-e0fa-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 18:01:34 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 12:01:30 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6313.namprd03.prod.outlook.com (2603:10b6:510:e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 16:01:29 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 16:01:29 +0000
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
X-Inumbo-ID: f06a67b5-e0fa-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654012894;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IKq3yEw4IpgbqYVNdKvP5vhfnCDlPkyF+XT7F6+xzow=;
  b=S2Tm7g5E9pv1VcF3CvJi29TWXv0SQtVJjnxNCFhqWmfrRJLJD7jOdGmT
   WkKqrPYH2W509iA1jmgwVLCr6kobQ/TejkNHL6OxOL5QCex+/AKiwPKKF
   1vV8Yw6X2duWVZyKZhA+h19z3RkDKjvSRivEsIWO8l200ma2LAD0xlbl1
   w=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 72544678
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eh78yqyWpPSeiXA5mnl6t+dNxyrEfRIJ4+MujC+fZmUNrF6WrkUCz
 WUfW2CFbqrYYGLzLdF2PI2y9xsDvMDRzd82SwJtqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12oHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplk6eWEx0Vb6P3s/k4FBJRAQA9F50W5+qSSZS/mZT7I0zuVVLJmqwrIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHOOTu44wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKWAE9AzK9cLb5UDy4itI+r+uOeDyReOgfu9HxxqHm
 UX/qjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJ4DOkS+AyLjK3O7G6k6nMsSzdAbJkqsZEwTDlzj
 1uRxYq3VHporaGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi9UDSW517YRY36piG
IronPort-HdrOrdr: A9a23:pLd4rKF3D7bxnuWlpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="72544678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQUVqL0XSkyVTkhpExje4biuCULNzYakUwo/2YynJS0oYZxjlpduZw97XDyHlBAO3kcpjtE3jLEFRRUlCbSGz91sTTgzSaB3MOyLmBORnXo0AifHrYWm/Y+mjxmLAzXLH+e87d7lEygEW6jnO9dO0XRIA5lPrL+JvmRxbKm2RRwH3bpttDKGbwkeWBm19CEOUXztcSbYuQaagg5qtD5b2BDlU9D+sKRYXgWZT18u04dT4Uv3LTzG+Q3IM9vDkNn2LIL5yz1ilixJAKReJrlhCEz7JI2geGM4LonhgaddTftqkuAHcu2QcxSVWkykqQzENL35/ftCU8w2r3+VNdKWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYpT6ALAe8NCcFBFfjwCnKc+VRgSWanZdXJjpsA+WWc=;
 b=L6rWwzyvH0aEi8pLU0armT9dYGeyREbG2hYsBmFd46/UKeIIMECIsWdFtivCKxj8Nt8aK5OEFjrBpZZ/6dpYw0PVdKHFa3fVBVz4Bg/vjoLAV8Bbh8kSKTufTUp4WT97pZOSKpgcDkyMenICs+s9p1Z4P0cYlU4CZ+0Wrqe1Dg9ucTpMaBJUcaw8DfjXCaTbF0CjRK/lMBncA3+3Y/lPkEm0E1FP9TfJeHjOIJtlswsQuKEe39zcw6nLgsPolHtBTyNEqtnLChva2QgsaDmS4YZvhhuOH7rCY2wLXLKXFhlnWqja8pwgpC/olDtfRD83Ddgr8iTXP7pR3QAA5JN+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYpT6ALAe8NCcFBFfjwCnKc+VRgSWanZdXJjpsA+WWc=;
 b=PjBzlfSpItBTJOzHTX/nKbiLKtAO5oAptSbOeI54MP4EziMNxDWc7ZbseRilNKw+6lj2DAiTIAD3qrXL7BZ3GlG+cH5pWPySEjyfqTxwd+LpalSIpxjPbn7WJsjGc3/HqEskT7pbmQwL+cyDnpsS6YAO9deqlSlovBInNY16dj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 31 May 2022 18:01:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 02/15] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <YpY71HuPOP59Do+Y@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <67fd1ed1-4a62-c014-51c0-f547e33fb427@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67fd1ed1-4a62-c014-51c0-f547e33fb427@suse.com>
X-ClientProxiedBy: LO3P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 791824b2-b983-4b53-3cb6-08da431ed2aa
X-MS-TrafficTypeDiagnostic: PH0PR03MB6313:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB631336B90A96306E099DE1C08FDC9@PH0PR03MB6313.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kyf6c+RQxThYDKgvCl6V3QsDJZ+ySEOm5/7TURUpew2AdRfK/R0vDXQYTLmRggMqkeuNpTXbKJHbph3gWp1qPqYA0a3TCqBTV6V6EtG1L0RPUQyubmMueIb3UnzuXkQ3BfgIZrAdLAWtNpTJOyt9gRTamNi25MShLNoKziLibe2S8SFRRP+b3qS3LLXmCQl1qVCH0RS+OTJ1N2TmZ2OrSF8rWHSMZ1n/HeBHPkmLlpZ8vG5KapsTrJvl5UKpDIdUrJF8rSMEOJchU1lTtfrc+Q7yGSiVXu8V+4M+F2/KuQp+OUQEbY8bl4DG73BB+bR8frvhtH+9WwaV7iWzI/YY0rdtsvMvGvF2cJpnmVoWaRebLmfBvo5KTxPl6unSzr2pkntwV12P3gYCFxuq1iRv6Z7F8qdsIIldNdm05/spG8gsMTkwY46oxXx0+79/3dRx2A9q49FNIKyxlseJ9e2yqoLMLBuWEad0bWhYiwFHprSMeJj03ogG8zjEZxcgjzrSusJy4W1JFm9/oxZAnXMKiaXRdoVsfCRE20yilN/CGu6dmp7yISu6zp3lH2DD8dbe8yk0mpJDIk3IQBxjy7X+RdBqaS9skkwT5/sFm/cNHsl2GR9wOXmzYN/EdnrNZltckTwiyy8xfUbTkE0KSz/QIjr4vG4CBI1tseB7R0pzvrX9IRZivTMxdJFKFTLRMps4yT79vj8/T+vLEdysyIQcYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(86362001)(316002)(508600001)(186003)(2906002)(9686003)(33716001)(54906003)(6486002)(6916009)(26005)(6512007)(5660300002)(6506007)(83380400001)(82960400001)(8676002)(85182001)(66946007)(4326008)(8936002)(66476007)(38100700002)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1hsVmlhbE9NcXlaOXRQRlBEMDdhMWFJYTVySWJvQURjVnl1RnZkOThoNHBv?=
 =?utf-8?B?SFZrRDkvZ0FEdldySHl2VkJOVXlFMENNakhhQS9rR2FFcnpRVXNjTmk3d3hE?=
 =?utf-8?B?T0YxZHFlOHc0Q3lvZU9oN1U0VUxPd0xvM1hLMzJCNTZkVXNuYkg5RFppSzZo?=
 =?utf-8?B?d0NnaVVxM0gycExLRjNBN0FzcXQ1T2RMaUd4OWZ2K1ZFRFdXTXcyZlFubGxC?=
 =?utf-8?B?VTkwZXl6cWZPTnRhYkZVcXZGOTlDV005WStXTTdBTVg4VUZJMnNiVFFYd0pt?=
 =?utf-8?B?V1MwOXZTdGtNd1MxMVVWdHM3ZG5nTFllZlAxNWhHTVhyRGROU002bngybDA1?=
 =?utf-8?B?RGhKRXlKVldaL0x1RXVhL2R5WWFjTk8zanhIcE1XakIvSVNKd1dHUDBjVEpt?=
 =?utf-8?B?ZjBaVGNneWw4clN5WmtIcSsvUXNaRDJJYUZZclhMa3pMVThiQTFJdkdFMVlq?=
 =?utf-8?B?bmZJRGVDQXV6ZGpFZGE5bElkcVNtV3BTUUFjWWZFZWFDOXE0a2F0WDlDSkJ6?=
 =?utf-8?B?aWFWT3N2WDZycjJHRmtTTUR6czBRQnY2dlJSOStaYzNqeW15TnB6S3RHSDdU?=
 =?utf-8?B?RmlRaFMwR0FEcUM5d1RSYjdRSFJRdXg0TWpCZjhCcFBEcmVjOXhuYXZLQjQz?=
 =?utf-8?B?S0E1Y01PNkxQMjBvRTBscVJzaFRUZjIxZzFmK2tlcjV5NFMxcHplYmc4TVJh?=
 =?utf-8?B?Nk9Wd09JRDNHNmxHcXZBZkdVUlNwQ2xUUWZyME9QRjdPVEZTSEZvSzA5YzRl?=
 =?utf-8?B?MXNCODZHdjg0SE02WVA4QzUvYVMwRlpBRnBHNjFqYkRPNWV0OEx3bFkvTnps?=
 =?utf-8?B?Uk9OZDU0WWNibDBHa1NYMkxxT2JscGdkbGZMMVpxeDVTd1M0Z09MRGFrSnR1?=
 =?utf-8?B?UXlGbjA5TDZ4aUdYNGJ3c0drSVE4bElKbDAybmIxWG05UzZ0aUgzYlpaOVdu?=
 =?utf-8?B?ZUNzMHlRZE55TDE3VDZSNDBOT3VrV0xEZzNYQ1R2eFV2RTVFenFEOTNSSlBG?=
 =?utf-8?B?cXIzM1hMZlR4WG43V3cvRFVKSmx4bVhNdHFNQUdkZ1dUaGtYdlk4MnkxSUFY?=
 =?utf-8?B?OHkvQ2VUZzFKSk5COUQ5MURpNVdtRlRreXBBZ2dISVBoUjNwYlAwZjdvOHBV?=
 =?utf-8?B?UVJNYU9ZQzZMdGhZVktVYWp4bFFBT01FZlc4UzVXYklqRkpnU1lhclZ2YXZ4?=
 =?utf-8?B?RGdLYVRHQVV3M1lKVVZ1ZUIxYW01a3dDcVlDSUdmc2RnVnhndnUzL2VKYlZL?=
 =?utf-8?B?MENUTEN6dkNyN1VuUDJRQ0hVblNaNUZ3V2ZJdk9CMlNjeDUxMkFmb1FvaUEy?=
 =?utf-8?B?UVB2OXRDbkkvLzZEbWt6bW9pek9xRUFUZDNySGNhRWhxUDZHV0dnT2RXYlFv?=
 =?utf-8?B?cWxJTkQ1ek5jRmJINkh5bEpud3QrRXdpTlp2QkdYa09ncG4xRjlPendnUnhM?=
 =?utf-8?B?T1B5UmlwTnFib05zdEZRdDZKZ1JmQlN3S1hGUFRYZGtzYkNYdy9tQzNiU0NV?=
 =?utf-8?B?Yk56dHN4SGRzK09MVGh2ZUN6Ny9vSi9uNnR3RHh2bmhrZEhLZW92a3RTTDJD?=
 =?utf-8?B?NTFhczgvcDdJQnJTSUJZQ24rSWhUTWdUTnVRVU84dnpsbzVva3RxT3MwWXBu?=
 =?utf-8?B?eEVsOE9tbi94Nnp6RWlYNEhUSDlBT1N5Z05HWlk4WlRmWlZOd1BBMGE3RVAx?=
 =?utf-8?B?UVBwTmQrQjczQjdDc253TzhWMlpzZHMwRy8wTzZoQmRWLzhHOE1BaDRHNXhF?=
 =?utf-8?B?WG5nOUp1ZW9LVjI0eCsrTVhEeUlaNVQ4OHBabjhGalhsYUNyVC9zSjRqSEN2?=
 =?utf-8?B?S2JMOFphcEluTjNUd3FBZ2E5WjZuUURKSWFtYVFqTWZIT0dtaXcvZkRtV3pa?=
 =?utf-8?B?Q3dDTWdWd2hiZFpjSzJEQzlkVTNnYWh2dkg0aWdsR1JueTlqTVBsOFhpejlF?=
 =?utf-8?B?c3liYjBLdDFQVXNOZnNYL29xNUFJTTg0NXdkTHl3R2Y1OEZ3QXFVYWpBc2Q1?=
 =?utf-8?B?dWNRLzhjN1lqRkhGSUk4aUlFN21GREljT2hwdWd2d2pIK3ZWMWZ5SFdONUxi?=
 =?utf-8?B?b2RYUU5NVSsrc3lpMUJDYlZIZFEzVklwTUZ2UnI1UXltekpSTVlhamg5dHFS?=
 =?utf-8?B?ZnVGZ1ZKQ0Z0RWhvdE5rTW50ZDNzRWxqU0sxeldkSnQreDA0WGRZa2xnbDlV?=
 =?utf-8?B?c3M5MzFCVGRZWDFmdGhnU3dkbnZQLy8xdnhhaUkwN09FTFhLb3I1NUo4NGNp?=
 =?utf-8?B?MTY0ZTM1TmZrWXQwS1pKdHRPYVNzR2hLUkpJSTBRc1FkUEpJOHUvM2RxcG1C?=
 =?utf-8?B?akxRVkFOZVYrWkFkaEo0dWlFUzgyQ2FnOWQrWDVhWEI0L3VQNFYrTmJxRmk1?=
 =?utf-8?Q?FUaktGZCxZiLLaCQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791824b2-b983-4b53-3cb6-08da431ed2aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 16:01:29.0985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8hAMIjuqdrjSc7NKItg+zUn61/huoAplYeY72ursjZE9GwJIlJlzXysEm0ghup9+ub0c9o/TCO+eScflSYLFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6313

On Fri, May 27, 2022 at 01:12:48PM +0200, Jan Beulich wrote:
> For large page mappings to be easily usable (i.e. in particular without
> un-shattering of smaller page mappings) and for mapping operations to
> then also be more efficient, pass batches of Dom0 memory to iommu_map().
> In dom0_construct_pv() and its helpers (covering strict mode) this
> additionally requires establishing the type of those pages (albeit with
> zero type references).
> 
> The earlier establishing of PGT_writable_page | PGT_validated requires
> the existing places where this gets done (through get_page_and_type())
> to be updated: For pages which actually have a mapping, the type
> refcount needs to be 1.
> 
> There is actually a related bug that gets fixed here as a side effect:
> Typically the last L1 table would get marked as such only after
> get_page_and_type(..., PGT_writable_page). While this is fine as far as
> refcounting goes, the page did remain mapped in the IOMMU in this case
> (when "iommu=dom0-strict").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Subsequently p2m_add_identity_entry() may want to also gain an order
> parameter, for arch_iommu_hwdom_init() to use. While this only affects
> non-RAM regions, systems typically have 2-16Mb of reserved space
> immediately below 4Gb, which hence could be mapped more efficiently.
> 
> Eventually we may want to overhaul this logic to use a rangeset based
> approach instead, punching holes into originally uniformly large-page-
> mapped regions. Doing so right here would first and foremost be yet more
> of a change.
> 
> The installing of zero-ref writable types has in fact shown (observed
> while putting together the change) that despite the intention by the
> XSA-288 changes (affecting DomU-s only) for Dom0 a number of
> sufficiently ordinary pages (at the very least initrd and P2M ones as
> well as pages that are part of the initial allocation but not part of
> the initial mapping) still have been starting out as PGT_none, meaning
> that they would have gained IOMMU mappings only the first time these
> pages would get mapped writably. Consequently an open question is
> whether iommu_memory_setup() should set the pages to PGT_writable_page
> independent of need_iommu_pt_sync().

Hm, I see, non strict PV dom0s won't get the pages set to
PGT_writable_page even when accessible by devices by virtue of such
domain having all RAM mapped in the IOMMU page-tables.

I guess it does make sense to also have the pages set as
PGT_writable_page by default in that case, as tthe pages _are_
writable by the IOMMU.  Do pages added during runtime (ie: ballooned
in) also get PGT_writable_page set?

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -363,8 +363,8 @@ static unsigned int __hwdom_init hwdom_i
>  
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>  {
> -    unsigned long i, top, max_pfn;
> -    unsigned int flush_flags = 0;
> +    unsigned long i, top, max_pfn, start, count;
> +    unsigned int flush_flags = 0, start_perms = 0;
>  
>      BUG_ON(!is_hardware_domain(d));
>  
> @@ -395,9 +395,9 @@ void __hwdom_init arch_iommu_hwdom_init(
>       * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
>       * setting up potentially conflicting mappings here.
>       */
> -    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
> +    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
>  
> -    for ( ; i < top; i++ )
> +    for ( i = start, count = 0; i < top; )
>      {
>          unsigned long pfn = pdx_to_pfn(i);
>          unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> @@ -406,20 +406,41 @@ void __hwdom_init arch_iommu_hwdom_init(
>          if ( !perms )
>              rc = 0;
>          else if ( paging_mode_translate(d) )
> +        {
>              rc = p2m_add_identity_entry(d, pfn,
>                                          perms & IOMMUF_writable ? p2m_access_rw
>                                                                  : p2m_access_r,
>                                          0);
> +            if ( rc )
> +                printk(XENLOG_WARNING
> +                       "%pd: identity mapping of %lx failed: %d\n",
> +                       d, pfn, rc);
> +        }
> +        else if ( pfn != start + count || perms != start_perms )
> +        {
> +        commit:
> +            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
> +                           &flush_flags);
> +            if ( rc )
> +                printk(XENLOG_WARNING
> +                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
> +                       d, pfn, pfn + count, rc);
> +            SWAP(start, pfn);
> +            start_perms = perms;
> +            count = 1;
> +        }
>          else
> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> -                           perms, &flush_flags);
> +        {
> +            ++count;
> +            rc = 0;
> +        }
>  
> -        if ( rc )
> -            printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
> -                   d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
>  
> -        if (!(i & 0xfffff))
> +        if ( !(++i & 0xfffff) )
>              process_pending_softirqs();
> +
> +        if ( i == top && count )

Nit: do you really need to check for count != 0? AFAICT this is only
possible in the first iteration.

Thanks, Roger.

