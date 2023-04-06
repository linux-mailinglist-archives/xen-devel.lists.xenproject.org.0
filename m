Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9246D92E2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 11:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518798.805671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkM3A-000233-J9; Thu, 06 Apr 2023 09:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518798.805671; Thu, 06 Apr 2023 09:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkM3A-0001zt-Fx; Thu, 06 Apr 2023 09:37:00 +0000
Received: by outflank-mailman (input) for mailman id 518798;
 Thu, 06 Apr 2023 09:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkM39-0001zn-9i
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 09:36:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e3816d-d45e-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 11:36:57 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 05:36:45 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6746.namprd03.prod.outlook.com (2603:10b6:a03:409::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 09:36:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 09:36:43 +0000
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
X-Inumbo-ID: 91e3816d-d45e-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680773817;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t2dkUTvPu4iQJ9JC/sfi0IQMhAaSfTsB0BbB2aOUB28=;
  b=CuhwXZz4WMnkWtCo5qkT9hVSwszfRKaHJePzURmeCxqIySucWgK0PqM/
   7j3st3rzub/j/aZuuJmMuF07vCKZLP07BM9GwUcyuIm85/iaibm5ymijl
   JCbkSgcqBxrK81EUURveIQUuJznEc5/Pz/AXacAN1MJYuUbm2yUAH+8V3
   U=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 106966057
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:a3weoao8JLZ+ctnYh8Vq2QtiN7leBmI9ZBIvgKrLsJaIsI4StFCzt
 garIBmEbvuPMTDyc9wibNmx8U9U6sOGz95nHQQ+rn8zQS4TpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzydNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABsIYw6voc+u+4yQZe5DgvwHJfbkP7pK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIe9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqK803gXOmQT/DjUdflaWqvmoiXWZXoxOB
 RAs03AWsrIboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC1
 ViPhdrlQyNutL69TmiU/bOZ6zi1PEAowXQqYCYFSU4A/IPlqYRq1BbXFI4/Teiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:t723GKplRNVMq88FTAWyg9YaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="106966057"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsYT0v2X80oAAjqV4g7zDqizvfABnFPRX73JuHqfW3Ov+3zsqZ/j6kN8XMKzrdHB2pAdyLgxCZj1eXODSPX06csYq6nZfQQQz+z5fjRUUeWe7fum8NRwL6QMLD2HuF49TMLEXUDsSbQy1/phnoCJtFmZgQvgBpb9eyIMY3mu7WJif8OtG9mxfs8qT9APMyRlN/f2sQaw5IIU+pXYl8TDDgKFHOA4XDjZ2e/rpTrvuvdQKsU+Y8yqa/ljD6ge9cMLmwVqEwo3maNO71cNTyx/3bbqRxoLHbt9lJurDfWzUKBd0ucRinVR9bOfBxpM3vQ1y5dP6zdK7wjK6Evd8+PUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUMCD5S95GqMGMWGQq2L1ujqOJ5fEhqwkrZ8ijeAgxo=;
 b=UViZDI0R8Ha17jHq1c/T1+gXV66iacOq9W8upkgSRJWuEz7SgfZA5UNGZTsVnBbXqIuTMaqJUt6XVyVYm4MzCoqHdp8M+EMLqM/S8eN1ycfF1PIpKslB06nlF9G/Kcnmm+24pvR/EkQjOuP1Q0TEj0joKEFjtB7Dq+1DaxNBsNy5lGlP30CqWP8Pyxfj/fjzxtondXVXlCbd9vyINE4kfu8WdTD3HYlTP9MnL88xJparkkE5bIhJpj3Do761zKw3yvRqpAe2b/vNAMF9qdUgfSzU+GouNqJrAj3LAUHPkTn9Z8JaIlejlqshYp7+7msMABwq6Mdipn5hFTf23KAYtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUMCD5S95GqMGMWGQq2L1ujqOJ5fEhqwkrZ8ijeAgxo=;
 b=SI5eQs9S2u2nkY1YkizmTwuJNinX5HfJBhQvSOe7v0zqDmbw3WfJFUgDWxTKJr1QeI21KVPRMid5fNGUhGzAGDfdw9+Ynoz5XLmNoAZVBN5QZVlzmSA7yCRiTB7un84yLtQSux47DVF221/073HHjEsZm5mQzGbutUc8zoNJuYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4525547c-e309-c994-3dc7-5d1b398aabe1@citrix.com>
Date: Thu, 6 Apr 2023 10:36:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] livepatch-tools: remove usage of error.h
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20230406091807.49028-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230406091807.49028-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f54af3-d120-4e7e-9e17-08db36826e73
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xytTK0eHICpzCvw98rOmBHwGjIsEWgkycFYWS8PXkZLpIeUI8k8eCsu2TOAGl2sP2zLy69zJbeqmQ8XUMvubtn6rzXqOGCX/HAZGQgPaHqIf4Qy94fDede6cIIWuvxDMJiWUVFLLduVpV/EsQH4qoCqgXS+crkFtfBcoXHJ2COGczAEvFWBQS8JVYU4WgTe0VNU4m6qJBcNo8OdCTZrc//AFT5JslRspWhpdCKrrElq9f1fR1bSFBIeyQC/xIi581eC3+k2DVVii8Sbz5sSq3XGHtCZQofTGjjF0cbmbUxrWjdNMWYey/7XKLw0CYUa9iHCqBfHUwe8MPrY5Z9ZvpYuR7CZtqwABx26BE1A4+unV+KklaLYrEOD7+su5bjZuAWipBdf/oqAJS4KThkTC3qYpYuL7EmNymkXtoRURAivtDddYreEtMH+qum2EVT7SKoGYPzSqBsjXPmvqPVAVMeUnBosGDFSb2GlFrjDIx/APLy790baGRu4SeugnQ7Uklg+KbNOu6RnvFIo7hZTC+SoDWmAfCnDX3z/xM5KWrUgn8dAsxFgGbOQt/RdCAevv5FzmJtm2o11t9xY1IQ7m76czDyGfMFhLSPxtJZmlA5OXtyr3tYeL62nApf0wk7i4D9yvZjfYqAqnoqdsecp0ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(26005)(31696002)(54906003)(478600001)(86362001)(53546011)(107886003)(6506007)(6486002)(6512007)(6666004)(36756003)(186003)(316002)(82960400001)(66476007)(66556008)(66946007)(4326008)(8676002)(5660300002)(38100700002)(31686004)(83380400001)(41300700001)(2906002)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkxyRWdkY1Fpang1VGtETTN6V0cxVU9LMGxvNitiaUZsUFdNUWxFUENaWHFl?=
 =?utf-8?B?T2pyOVdlK3NESitGajJaTlZYdzhSMlhpelVLTlAvSjVTMzFRZzNrNzdidVlz?=
 =?utf-8?B?RDRsUzlzTnVuWHgrSUhRVHdCOUR6dkVLczluVWM1N0p5NXk2NCtVSUoyemht?=
 =?utf-8?B?YzFBM2p0bDRIeVgrVHNCRm4yd3ZySTMxTkVoUC9EaldvMnArL0tyVW94b0hy?=
 =?utf-8?B?WUVFZ0VBL0RwVWVJRHAzbllNb0pBOGZnMDlkZVhRSTFnVDZmR0xQbEJWRWJP?=
 =?utf-8?B?N0g3QkFkakNUZjZqWXpqMXlDWU9mZGh5S1V6WE9FNkRYREVWQzlJa0ZBc1N2?=
 =?utf-8?B?OGVtcHhMZTZZS29BWmdwdUNacnZRQkhCNDEzalY1NVhsSnIyNTBOR3ZZWVlv?=
 =?utf-8?B?RGJ1aGI5Uk9XRVFGd1VLSHV2T1U5aU5xOU5tOStlb0RtanBiM1hZUjk1OWJC?=
 =?utf-8?B?TlU0TFBVZ1BCSGMweStJSFFFL2NzUzB3NC9QenU5WldmalVndC9Eam9iandF?=
 =?utf-8?B?Y2dVK1Yzb2pCZFVQMEhXQ21IZGtKSElOdDZYVHEyVGZ0OXFWVkNMRWMrZm1w?=
 =?utf-8?B?dmtjLzdsRVRjNXhxOWpFQlZFUjdpemNpcWZpVzZad0E5MXA0QVljN2FhRThG?=
 =?utf-8?B?ZUpLK3M3bWllc2ZTNlFXQ0lZaTFZd0ZLdmtyS0VXbXNnL3Rrd2RZaUg5NjFx?=
 =?utf-8?B?UDRjWU9scktVS1FxTngyQ0ZoZktnTXhHS24waHNDOWZpVk11V1ZpUGNKMjIy?=
 =?utf-8?B?KzdzMzJBcFU4VlhwVUsxTTliN2lzKzJrd0grbFFYVndCRE93M2d4L01id0FC?=
 =?utf-8?B?TDlKYjRJUm0xNVlLdWlPYzJVaVRXZXovRUg1R2lTd1VwOUhzeE0wSFoxbksv?=
 =?utf-8?B?WEJpcUNxYXBlRERkZjJlUFhMR1BJaDRvbjJNY01WbzUvMGI4VFlWZjEvU0Ro?=
 =?utf-8?B?WDdJc2NFdFpqOFhsTlpuY2tNT0pPTFgvMUxFa1pSSDdMWjlnU2VOeVVuYUZm?=
 =?utf-8?B?RUozTEtDYjR4dkM2aFdwb0VWTFJPblpXUitmVWsrc0VHQlI1RUlwamtWL0py?=
 =?utf-8?B?clZKSmNhcXkwc0k3RHlVYkxMaDlLbDlQY0hWNzQzVGkyS0FJeEJLWkl6Ykpl?=
 =?utf-8?B?VXljMi9FamRJQnZRNXNNMHRwaXY4MEpuOERpek92aW5lN3o0eVhmWGdvQjRx?=
 =?utf-8?B?cExiVnBHbGVxbzRtMElhVTRwS2hpcHh5ZjB6NmtKV0lVZVFBZHNySjFyWUY1?=
 =?utf-8?B?V0FpYmIrZm9CMGxnTjVSQTlRK1VVREZsZ1IrSDU4dm81N3h5OWZXVG9aN0lk?=
 =?utf-8?B?Wi82aEJHVGx6cGxYd2JSZU5sWENUY3UrZVNPRmtzWVp6Rmc0OTdKU0FuUERU?=
 =?utf-8?B?Z21tdncxM3dxWDJ5dmw2SmIwU2RFd1ZteVlaeG9pV3hhTG1jcXlPR3NzcTRZ?=
 =?utf-8?B?ZXlGN0FncFlRWlZERzUwaE95ZmpEWW5jNUN1eG8rV1g0MXNFVm5LemVDNW1t?=
 =?utf-8?B?R3I5dEZ6N0M0b0tld2haenBvQ3d1TmtGSi9landNeUdzZS9XbldPTjBZbC9n?=
 =?utf-8?B?VjNDK2FsYVhsY3Jad3E4a1dUTWZCRGFTb0FJUGc3U2plYkdyb0J0YzBFN0xF?=
 =?utf-8?B?VXUrTVl5dGlyVkJjNkhWak9Oa3dMZEZqczVSazAvTXpCNytXaWNCVFIweXU4?=
 =?utf-8?B?TlZNSFFvR0FtUVFndlNsVGpkeTNsamNscExtZlpSRUJUVXF3SElQcUVRNERo?=
 =?utf-8?B?SjNSalh3Si9nVW05Q3YzSGg3dDVMMEJLZ3FtM3JHdFBiaExDWHJONlJUeXlv?=
 =?utf-8?B?VE10WmQzRnlQeXBKU2VDRXZFNzhhbzExVTlFanl4Mkl1RDExZjRxbkJkNDZL?=
 =?utf-8?B?MTRscTJ3eGZOeHU4Yk5aVjM3MloyOVB1WnMyTWhKYlphV2F4R3dzTDN1Yk1S?=
 =?utf-8?B?UkY4SXVpZmNHcXMvanB0cGMrcFBJc3BINGx4WHJROEJFWWUwTUlQVmN6N3d6?=
 =?utf-8?B?ZHU0SG1jVXZEaTd3T1QzVGx1SGV4M2tJWUhjWDJiQmVkcjFVY1p5a0Q0YnBo?=
 =?utf-8?B?aUkwZVZ0aVFSZ011K0V3WUVoRGNKS0FZRzJBTjNJTDJaY2lOc3krQmZHSGlX?=
 =?utf-8?B?SERTTitHSWtUYit4cE9rZjFqSkh2amV4VDB0ZnRjNmYwWGY1UmxkellOZHhD?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LhhrI/jqbfEPskn7w6jPDSHyaa62bJi5V1fE2eDGjY5pjo0ROcK7Hb+BELIAfKfULYDpzl5c7xlB1Kg58yC53lQzXLm2UJR+b/KbHgUpbh+ncmy1FlqWLmvzfPfk5HnCMWL9hlRU5M3/KjOi2yIC42n7D9tevZsjx0hZIPu+4nu7XRuIovkruVnaR/ttJHOuwyiAHc/sok/DoXDNJ+uebS1sGXV8YYRFc36YZCYO/9GvMBRiC5UbukmNaI8dPTFLzQ/SvPS5fh8JSkQ8vWQhycR9+BNrV2x1JahlhpHm7mMgJucmKTLyWgrXlfALc08A1wNjzS8H3B6O3JhEqHLZGWNUiLPBaovCwGYKGQ7CCXhOGgahoSWH19WYO1scKUAv+YaeGGkb76VviCX8Er3RvtfbF/HZz+r7gZAKzJezaW0oQGQsMJ3GLqR73Jb484v/hWjTTuvwI9ZM+b9F75mh2bkFfSUfeKvqUgeNqxo7ItQqP5gOjkhNGAdbBh4L9irFRHmXUslNWqGLg6SyEd7wiIwmDDXC7NN41a8jfj9La1+IvyZw5iyVs+AHbODM2zWBwDw4OmeAkDfieF7HL7kkBhvxuitvOXd8WOA/zujj6B74NR2RihiTns3uPxTP7r/07pK9cpt/rH4/m4vMSoJ3LbSXt9TxVaYDI5tnqXHs7tUuc8i/e2oyh8GEAJzO4qDgXgOEXQVzqAp6KMzHGYpRBywk1xfgXDEZBrYSKK8NzsiL7rp67xmsQQjwaxnt/5rILY9+DO5TXpG2fLbyi9VqZkn3WWBeeTeAi3jzykX+hx0kd3VM9g7CpBQWdTT0TEEC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f54af3-d120-4e7e-9e17-08db36826e73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:36:43.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mvy9NxCbeIM0kxk05t6FwnTQmAPzKGA6lxtD7Ar9Aj8ZI1JMk1vsI2TPz7upBmfrT3qdHTZqpHxYx+LL0wH4RhCalN5OXHo1+svlgID/ukk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6746

On 06/04/2023 10:18 am, Roger Pau Monne wrote:
> It's a GNU libc specific header which prevents building on musl for
> example.  Instead open code an equivalent replacement for the usage
> of ERROR() and DIFF_FATAL() macros.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  common.h             | 10 ++++++----
>  create-diff-object.c |  1 -
>  lookup.c             |  7 +++++--
>  prelink.c            |  1 -
>  4 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/common.h b/common.h
> index 9a9da79..ec2ea33 100644
> --- a/common.h
> +++ b/common.h
> @@ -1,18 +1,20 @@
>  #ifndef _COMMON_H_
>  #define _COMMON_H_
>  
> -#include <error.h>
> -
>  extern char *childobj;
>  
>  #define ERROR(format, ...) \
> -	error(1, 0, "ERROR: %s: %s: %d: " format, childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__)
> +({ \
> +	fflush(stdout); \
> +	fprintf(stderr, "ERROR: %s: %s: %d: " format "\n", childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
> +	exit(1); \
> +})
>  
>  #define DIFF_FATAL(format, ...) \
>  ({ \
>  	fflush(stdout); \
>  	fprintf(stderr, "ERROR: %s: " format "\n", childobj, ##__VA_ARGS__); \
> -	error(2, 0, "unreconcilable difference"); \
> +	exit(2); \
>  })

Looking at the usage, can't we just use err() instead?

Also, I suspect you don't intend to delete the error message in
DIFF_FATAL() ?

~Andrew

