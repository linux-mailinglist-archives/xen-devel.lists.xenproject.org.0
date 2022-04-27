Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C4E5114CC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314810.533046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeky-00047O-I2; Wed, 27 Apr 2022 10:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314810.533046; Wed, 27 Apr 2022 10:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeky-00044a-E4; Wed, 27 Apr 2022 10:18:48 +0000
Received: by outflank-mailman (input) for mailman id 314810;
 Wed, 27 Apr 2022 10:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njekw-0003vx-OT
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:18:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a690e7b-c613-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 12:18:45 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 06:18:42 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3125.namprd03.prod.outlook.com (2603:10b6:910:53::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 10:18:40 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 10:18:40 +0000
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
X-Inumbo-ID: 6a690e7b-c613-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651054725;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SoUA/36O8AChsf5IzVXqZgjp1qN8ewt+AVYDPB54nuA=;
  b=FSEVK7coARjbZUooANlWd1kP4GxsxWg3fyLM8oMJFRmeFt1eY+VxzOGQ
   EIt/gWb4YXuUurJ18U+56u2yKciFW/6IiYTe5gBRaF7fJDxLmDzDQ26lY
   E3HkfQuAXsFzKJlTcYwZlcCgHb+mJ1o53QXylIvn2i+gO0oW9j05PgsTp
   8=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 70048602
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EWxbOqpDieoFwz/7TZCuq7qWAaFeBmJmZBIvgKrLsJaIsI4StFCzt
 garIBmCbvaJZWfwLtB0YI+0phkH6JPXmoUxTFFs+XphH3tG8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 42q+KUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBGrDVgN1acB5jCGJHMa1B2eTsDyP8mJnGp6HGWyOEL/RGKmgTZNRd0cEuRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFgnFp2Zgm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK/fJrszaLlmSd1pCzPMCMR/7XRPwSxBvHr
 GiY4GrSXAAjYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUVWEW6p7+li0e4c9NZN
 0EQvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRZEYd0i8cQxHDoj0
 wbQm8uzXGM39rqIVXia67GY6yuoPjQYJnMDYilCShYZ597ko8c4iRenostfLZNZR+bdQVnYq
 w1mZgBk71nPpabnD5mGwG0=
IronPort-HdrOrdr: A9a23:UD9us62czgqiqFKQjtgD5gqjBTtyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMUj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu15Dq
 r/Q+BVfYp1P74rhJJGdZk8qPSMexzwqDL3QRSvyAfcZeg600ykke+E3JwFoMeXRbcv8Lwe3L
 z8bXIwjx9GR6upM7zC4KF2
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="70048602"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrgHbd2+ZqcvuxOVgcgUqMi7zaAW6wX2LXklgpkovc3NWkUhKqEO3DD7FtgMFAyL8hpQJvybeXur8lD9GWoC2y90d0OHv6fQ+l14thWC9tiKNTqkughAXJhOl/R9IscGGkCOchLfFqi4TK/wx3Xh/kIMn5WFeJ4+JItKdZouYsbZrQjbA4K+NzJAENij5O4UDJOHESxmMbjxrKWISGGJKLEohmK2SAdog7Crvgwz7+vQzoexTU5y5I6xYqkem8hct/tZaLb813McSPG+yQBE0/iu4e7Xhj/bIagNWBvSDTArt6JI92Pb52uv/1UNcEnIThnHFxHDzQDuV6uLX4MSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsC2Spo7snQqRCQysI7Uh60F8HhrNIZf0ocSbWN6/1Q=;
 b=WoOFDc+mIh4LuiwixKnCkwzlDU9uPnHLV/tl8jUVTXveSVdZNXzjzhgHEcQGonXD9FaiiNp7ijrEsOFQuPGIP+VNl2av7u9BM0bkVdYZV0oi7tG9T9AcIpiUMsRsVahd3Q+aGcFhLLBZ2qsTNSNAkLeFxg+kQINog4vdkR9qxsAqR+i5Q/MXtVwcZuRUB20sXXmVQj0OX0f5WqIZ01t7FFuYdk/3xXkUQMSrVsTnLihgylTLnz3OLMB4srgIRUy9iOaFbVoQ9wA815cEX9ZIF1EZRhKJyDOufNmga4Jole7j+5LS+/UPYKmNv84IQPrJlmegApz1pjYKNNLxTWGnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsC2Spo7snQqRCQysI7Uh60F8HhrNIZf0ocSbWN6/1Q=;
 b=PGZvnIUnZlKVBJBrS8RMNfubv7SMQNEulAROmSb6UX4bo264ojMbaCw3g/sI6ox7L9lCICRTvnrdY+uwy5EKuVAGhTfVhoxNCwhwwptfZUtZ4YehRcTEiFa4UD30pp3oi8E9V4GE7BBy45w/eCKQ/I9hFD4gT3PGk2dUcElq/yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 12:18:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>,
	Edwin Torok <edvin.torok@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: RMRRs and Phantom Functions
Message-ID: <YmkYe+prpf6qzMmJ@Air-de-Roger>
References: <5364e8de-9c45-41d1-abbf-8be70c524e72@citrix.com>
 <ec1efb6f-9d41-c018-582b-718254b55aa4@suse.com>
 <f77ed15f-3dfe-e4f4-2790-7eca18ca9dfe@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f77ed15f-3dfe-e4f4-2790-7eca18ca9dfe@citrix.com>
X-ClientProxiedBy: LO2P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53a806d4-3c5c-4b9d-ca31-08da28374c99
X-MS-TrafficTypeDiagnostic: CY4PR03MB3125:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB31254DE247893B9E0EACE9EF8FFA9@CY4PR03MB3125.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/zX6WDQtZgd40x4nmojyyqt5NSGsF89ZEsxKjF15z3vURSILjJ0IpJ05BRSpWcxAN7Yag5CPR8MHeRRILlxxQxhRXKKvMs95Jnp/TBp/F8/0zEcti4ww6HNs8hlIsXqgyQYFRopedum0C7KrLkfYxl/AYbouHUcYIhoW2w33Ivf/sxv4vkFpjiLI5QIl1P1YV0idjHG1XM3eG3XRyr1xdrvOrgEybQakAlqa9Fb1WI9NLaic3UdIT/xfuEYx41wEhhfrtdx4gVeoY4X0yQKWsWGZs0jbUQwXEBWw78MYMSOvtizSJk0AxVFwgT3azkDSFND5NolGTs/mGWPyc5fN+zh7GtFejnZ3oZsUSMQ0nZGqfBgs2V+06FcOhB+75Y8xQSfkXiqEcLc2KBx8JBJkxo1I5afFN3KdsD9V2pqL7anu+Qy8ArgsYW/orKpeU1wYsQuTPKkbBy1vP7PbR0IjHrkVp4gYJYxQFMEarVw+hSleZ6bUZ6apJOjX9GoWgWqe8tq1XfkSeKZcjc/WLbTdiO+qb3KnKuJfl+VvFMyyuOyIbUR/IlpT4Bnrk0H+2JEiXseUNYLxkSF18/7hjnXnHH/k9VGvAVAF8H4HkUZcaNMnX83H+FZlxqrp5l+W3Q09RwsEr/9NkrYlG67nFaPLZAnmnKR3h5vfGtHCDS+GYbw7gOaqCuM5NOQ8YRBtdrSd1cXc9GNwbCLEtvaHxHtNqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(83380400001)(186003)(6506007)(53546011)(86362001)(508600001)(85182001)(5660300002)(8936002)(2906002)(33716001)(26005)(4326008)(66476007)(82960400001)(54906003)(6636002)(9686003)(6512007)(8676002)(66946007)(6862004)(66556008)(3480700007)(316002)(6666004)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHc0cHJWUzQ2bmNoakNlQ2hUY0o1anVNK2plZXBVaWxIRVJqTlg5b292My9z?=
 =?utf-8?B?WjBzOFFCQzBOQkY1WXhSeFNNODAwM0x6R2VQeVprdVBHeFVQWjB2Mk9xR25C?=
 =?utf-8?B?bFVHUVZCLytrTVlVeFUzZG10QW5NaU9jNnd6TWdXQWo5a3hVOWN0YjhQeGJz?=
 =?utf-8?B?TVpSUWhDVzVKcHBVZGdBRmVzQ3RueU1RdThLYmYvK0ExdVVEYTM3M2txaE9r?=
 =?utf-8?B?ZkdhOHVnVlAxbXNjTFpFZkdURUNhU0JqTmFqWkJTOGlJYk9EOFVPb0JRcXVE?=
 =?utf-8?B?OVk3c0RmZVZFWndTdjBpWUoxbTlzRmZBb1NaV0ZhNlFhNHduUXBsQXkvWko5?=
 =?utf-8?B?Y3RqcHN1aWVGblpvVlB4bzYwTVZhWXllY1NMK08yU2lkbWs3SnRBb2R2K0FL?=
 =?utf-8?B?bzdFNjhyZjNYeTNESzNIOXpXblZyZ3ZuQXhQZEJRSzd0dytsYklRMmloTFIz?=
 =?utf-8?B?eUkvNlFsV3MzSWl3aUYvaHk2a2FnNFYyMWpDT1BuWm1uaEYrclJibkVwMFpI?=
 =?utf-8?B?VnZhTllSSEFhRzdhL3VxWmZ4UWlveVhQNm96RUpXU3ZaWXpvWmJVYWtaeGIx?=
 =?utf-8?B?bHlkem14ekp3L1huaGs3NytWVlpZbnNkYXA3anpRUS90ek16cXVtcThyaEdw?=
 =?utf-8?B?a3RieWZYV2NpRFZQZCtEZTFpKy9Cb1ZJV0FWVnp1cW1RbUhaU1U3RkJtenQ4?=
 =?utf-8?B?cXhjT3VoMGpraGNRK3JZWDFqbUtncGRhSWZjVjJCV0VPMTB0aTJta2tQeCtj?=
 =?utf-8?B?N1FpdVdWUllBSW9aUDU5VlBlVDUrTk1ob1UwNHR2THY1bm9DeUR6WXlIUmYv?=
 =?utf-8?B?WHVTQlg5WWplMyt2aExhT3pwRlJaWFVOTEQ3eDdWZitkanBOTk1tU2lVY2NE?=
 =?utf-8?B?NFpoVitBc2R5RllzM0J1TkcvOUlsaE1mTk13TGt5OUoxS25xTGxreHFnQlVt?=
 =?utf-8?B?dEZJS3VneEJaYWRQek5tS1lJNzU5aDlBalJqb04vcjdFZ21FVU96cWxLWUMr?=
 =?utf-8?B?bERUU2FJRUVVaFRMdHJvQm1wMi9xVkpBR2ZlS2ZzeXYxNmNNcmJRSk03RW8x?=
 =?utf-8?B?SGJjQytGODV0NUZkbFZBL3hjWkJrLzIyWHpjaitMeGpPbkc3UkgwMnNIN3BM?=
 =?utf-8?B?K2ZKcDlyWXh3R2JYODEwZUNMYlZzWEZLeUpZbVhTT0JLM3dVSTB1WXd4MWxB?=
 =?utf-8?B?Sjg3c0VxeTZaazNTNUZlVFJlamVSRUZKNUx3NjkyUFVTaURlWGJjQStKbk9Z?=
 =?utf-8?B?T3NZdzdUblpoZ29aZXlKWVgvY0xyS29YZ0pLWnUzMi9BTm5DUFBTaEdOTmJL?=
 =?utf-8?B?dkNZUUdRSTNUQWN5am44dEJBQ0tDWSs2OFJpQVcydHlHRjF1U0h4RHJRS0FM?=
 =?utf-8?B?TCtrcE9qSHQvR0FVTTVPWHBTS2ZXdGxxOFJQRmJ4NElQMTY4SW4zenJ2d1ho?=
 =?utf-8?B?VHNsR3Nia0cwUTZTQ3hzY2RXcmw0aVhhcE1yaExGRXR0MHQ1UmVIKytycURm?=
 =?utf-8?B?R0hKS1BsT3hzbXVQT01vaUljNHZkNytjWmpjU0tJT1JoZjZQdnMwKzJoSlRQ?=
 =?utf-8?B?MjRwdE5JMnkycnRnMnJqRmZrcDVnZTEyejVieCtCeEZPTjNLT1IwYUZHMldy?=
 =?utf-8?B?aE0wUUNwcVlocVZFTHVHUG1sRHBGd0hudEJ5VGxVdHlJRk1OVmd2cXNjUzcv?=
 =?utf-8?B?eXNUa2RqQWl2UWlwZUg0K2tCZWtmL1BxY2tHVWt0Q1c5S1dvVnBFdzlZSGdC?=
 =?utf-8?B?TFZHWkpBTU1KZy81aDlXc0NVOEphT25uRGlqVGJ5dVd1Z3Y3Mjh3WkRHbVBK?=
 =?utf-8?B?OVdqNTNlOCtLU3cwUjdRSWNrdFdRMWQxZDhsVTlPRVNjRC9MSzJ2VzdIRHIw?=
 =?utf-8?B?Tmd4Zm5IbTlGb1VSVm9xclRHUGQ4ZHZmK3A0NlNrSzk1dTFZU0pKZ21TZXk1?=
 =?utf-8?B?VmdqREFUYlAzRm9McDh4c0VFUGM2d3BnVnB2c1FGVWNweUtRSWNtMXk0S1ZB?=
 =?utf-8?B?S0E5UFJSMnBjaGVuak9QV2d4Q0EwTWt4TkxxRUVPWStJUGY0NVZZd1hGOU5z?=
 =?utf-8?B?cStVL3ZUM2lEY2ZNMlZ4VWdoa2FoK25RZUJtdVA3YzhnekE2Rk52Sk1COHNS?=
 =?utf-8?B?UTZGZng2RXVraFhTZnB0WjRmSTB6T0xaRSt6a0NmSFRhSDZETVI3UWF1WEh3?=
 =?utf-8?B?dVlVRHpicVloTHViam1CeWVhOVFJa1cwOGhoTy9xY3F1aEhZTHNEVzZxb3gv?=
 =?utf-8?B?dDF6ajhNcHBhWjY3Zlg5SjdBU3pLODNPZ0FaeEhwdVFKR1IvS24vdytabWJq?=
 =?utf-8?B?T2gyOGMxOWZyYU9FM1JzczdKTjF3dHZib2ZFaXo2OEl3YkN0VldITzBaMFlm?=
 =?utf-8?Q?4rvED2x+aGXQr5XM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a806d4-3c5c-4b9d-ca31-08da28374c99
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:18:40.1055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9T4wBi9g15l21iO8+f2CX3uC4R2YVdFBJ3hFMzB+QENioTUVzCMEkc/NVK643Pf7Ksq4R2522hSTS2y/3P2c+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3125

On Wed, Apr 27, 2022 at 10:05:54AM +0000, Andrew Cooper wrote:
> On 27/04/2022 07:59, Jan Beulich wrote:
> > On 26.04.2022 19:51, Andrew Cooper wrote:
> >> Hello,
> >>
> >> Edvin has found a machine with some very weird properties.  It is an HP
> >> ProLiant BL460c Gen8 with:
> >>
> >>  \-[0000:00]-+-00.0  Intel Corporation Xeon E5/Core i7 DMI2
> >>              +-01.0-[11]--
> >>              +-01.1-[02]--
> >>              +-02.0-[04]--+-00.0  Emulex Corporation OneConnect 10Gb NIC
> >> (be3)
> >>              |            +-00.1  Emulex Corporation OneConnect 10Gb NIC
> >> (be3)
> >>              |            +-00.2  Emulex Corporation OneConnect 10Gb
> >> iSCSI Initiator (be3)
> >>              |            \-00.3  Emulex Corporation OneConnect 10Gb
> >> iSCSI Initiator (be3)
> >>
> >> yet all 4 other functions on the device periodically hit IOMMU faults
> >> (~once every 5 mins, so definitely stats).
> >>
> >> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.4] fault addr
> >> bdf80000
> >> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.5] fault addr
> >> bdf80000
> >> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.6] fault addr
> >> bdf80000
> >> (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:04:00.7] fault addr
> >> bdf80000
> >>
> >> There are several RMRRs covering the these devices, with:
> >>
> >> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> >> (XEN) [VT-D] endpoint: 0000:03:00.0
> >> (XEN) [VT-D] endpoint: 0000:01:00.0
> >> (XEN) [VT-D] endpoint: 0000:01:00.2
> >> (XEN) [VT-D] endpoint: 0000:04:00.0
> >> (XEN) [VT-D] endpoint: 0000:04:00.1
> >> (XEN) [VT-D] endpoint: 0000:04:00.2
> >> (XEN) [VT-D] endpoint: 0000:04:00.3
> >> (XEN) [VT-D]dmar.c:608:   RMRR region: base_addr bdf8f000 end_addr bdf92fff
> >>
> >> being the one relevant to these faults.  I've not manually decoded the
> >> DMAR table because device paths are horrible to follow but there are at
> >> least the correct number of endpoints.  The functions all have SR-IOV
> >> (disabled) and ARI (enabled).  None have any Phantom functions described.
> >>
> >> Specifying pci-phantom=04:00,1 does appear to work around the faults,
> >> but it's not right, because functions 1 thru 3 aren't actually phantom.
> > Indeed, and I think you really mean "pci-phantom=04:00,4".
> 
> As a quick tangent, the cmdline docs for pci-phantom= are in desperate
> need of an example and a description of how stride works.  I've got some
> ideas and notes jotted down.
> 
> Do we really mean ,4 here?  What happens for function 1?
> 
> > I guess we
> > should actually refuse "pci-phantom=04:00,1" in a case like this one.
> > The problem is that at the point we set pdev->phantom_stride we may
> > not know of the other devices, yet. But I guess we could attempt a
> > config space read of the supposed phantom function's device/vendor
> > and do <whatever> if these aren't both 0xffff.
> 
> At a minimum, we ought to warn when it looks like something is wonky,
> but I wouldn't go as far as rejecting.
> 
> All of these options to work around firmware/system screwups are applied
> to an already-non-working system, and there is absolutely no guarantee
> that necessary fixes make any kind of logical sense.

AFAICT with stride = 1 Xen will treat functions 1-7 as phantom
functions depending from function 0, which means the pdev struct won't
get updated when those phantom functions are assigned to a domain as
part of assigning function 0.  That would imply that functions 1 to 3
will be considered phantom but would also have a matching pdev that
allows them to be independently assigned to a domain, nothing good
will came out of it.

I agree with Jan that we need to explicitly reject strides that cover
functions that would otherwise be considered devices (ie: have valid
config space entries).  Or alternatively we need to remove the pdevs
for those functions now considered phantom.

Thanks, Roger.

