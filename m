Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0E6166AD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 16:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435991.689989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqG7i-0000oN-4y; Wed, 02 Nov 2022 15:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435991.689989; Wed, 02 Nov 2022 15:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqG7i-0000mE-0r; Wed, 02 Nov 2022 15:57:50 +0000
Received: by outflank-mailman (input) for mailman id 435991;
 Wed, 02 Nov 2022 15:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+cO=3C=citrix.com=prvs=2981f1107=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqG7g-0000m8-Kp
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 15:57:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 178c6138-5ac7-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 16:57:47 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 11:57:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5340.namprd03.prod.outlook.com (2603:10b6:5:24d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 2 Nov
 2022 15:57:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 15:57:41 +0000
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
X-Inumbo-ID: 178c6138-5ac7-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667404667;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7MKrfU+TfDZRRvp/RX8s8mz2mvqkzu6dKND9Aya/as0=;
  b=Kyne4kAzy3/+fsUWwmE7ss3JAOb4GeFpgaZpBMFjCEQCok8QABG4zJ6p
   1QRk+56aZXeMpwA5mJ8SJ/4yjqEpu5PPoLJqBiKkE8xQTUr88nsjZ1P0a
   AOjMsoNx1B4fmAQxO/JLxvtBjd4oiXJDhxr/EPc1hGMoMteLST5lf6F7f
   k=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 84042200
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vri6+6+wN1RKiY7SHrSlDrUDZn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mAXXT+Ha62Dazf9KdkiYIu1805VsZDQnNRnG1A++X88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPKgR5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklk5
 +RIDWwkYim6mrvm3Yz4dvh3oM8KeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN5KSOfirqYCbFu7z0UDESYIeFaBuKe8pmWQBctbJ
 hctw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBq19L2ZsDezMig9NnIZaGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXuAi35y
 T2OqCk4hp0QgNQN2qH9+krI6xqzorDZQwhz4R/YNl9J9St8bY+hIoauuV7S6K8aKJ7DFwbd+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5eEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:d8lHva4qfA1hgQVvowPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="84042200"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvXhTcGt8F77zDSaup5ED+vlUn/NT256DrLBBfu2uxtSh45FJf0juvlR/QNzmZ+rHTf0xJCli2jOZZfQORPn/JiYheXYW2Lhpkr3WwnVrgqjSdRreQtnk37XpBPlUnX2PO60MXR3j89YVNW+P3UnSS7k+WJY1KusObwFrwb+X04EmSeiyAqlT3i7+nOxhi9Mpptgo7hZyj/U6XDOARGcxfYAE3EtejvT4L+saXe4S62fDvVg4TZXoFPro+f7jmZApnu7jnykv3hlMx7Pv3Fc/K+5ezg/ZQXbjVXZMtyXwtZffJDdbVmmxXwa/U2oLpYnJdEUQo51u7oUUaTksMUSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MKrfU+TfDZRRvp/RX8s8mz2mvqkzu6dKND9Aya/as0=;
 b=FcAN/db4lpECOlA+U6NQ1J1hxZpXyUvVZUTPRoff3MLRZtoN+J0wqlOD2QdH9meQZogft8lNBM2uR5HHawbhcaVR9aHkO2XlCxd0rC0DoHFrGqTZ1MkGb/qy85VIJRqPZa/b28lrapTPW413+dQeyfwRJuF2XFp0P9wxrwCfBFysJIvo1CC4Z2jhBcZlxvoiKIAXCjnUPavSBwB55K0qaoTGjsBr38zKFkzzTbzF/xga+mZ7Q/JqOfYQnI3VZJ16jbplQTIr1BzpJ/Kjzqp3YPatF7Y9R2AFKOZo4x7VSw81QqDdRg5Nlx09ACQFqLOq/mApMvC3b89ubzcOoLTDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MKrfU+TfDZRRvp/RX8s8mz2mvqkzu6dKND9Aya/as0=;
 b=cWXvA28fcwnJ+6OhCWvC6ZO3AwOfpO9AotzywC2wbp5v70HToXfE/37VHs9h7FEYkwbRAdgsN/nEIEkhHE+aH3KI61g+vKJTFcP21MPnvqI8pymUNnBdPv/6PHDqtj7URBDggUHbXp22iTa2sSSBdJV63lszxYyxdxMHtjmwdmM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Henry
 Wang <Henry.Wang@arm.com>, George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 2/4] tools/include/xen-foreign: Capture
 licences from the input headers
Thread-Topic: [XEN PATCH for-4.17 2/4] tools/include/xen-foreign: Capture
 licences from the input headers
Thread-Index: AQHY7q5XVsL2+RG/AUCiEkMy4e8OGa4rjrQAgAAvhgCAAAwWgA==
Date: Wed, 2 Nov 2022 15:57:41 +0000
Message-ID: <dba0f4c5-eb28-ddeb-a898-2689eb34d69e@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-3-anthony.perard@citrix.com>
 <822f8cb3-6f13-d729-9779-0aeceda46272@citrix.com>
 <Y2KJUqRMancOmX4y@perard.uk.xensource.com>
In-Reply-To: <Y2KJUqRMancOmX4y@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5340:EE_
x-ms-office365-filtering-correlation-id: b8b93234-eee7-4cbb-9cfa-08dabceaf945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PsL8uDPmPMBcUhbdacSpyOtHNPN71F0HPv7ROKzbsIlNhBD3KqBys7Av42u58vdOl79PqSlS70oJ/d75NdXrVLWVPL6b6/5MC78PkmzrBuyEPZbbAuznElDKLlQg5PkifoRKb6uyXPGLtv6QNjKwVIKJwW8UsnHtCII9heDfQi5Dyhi9FwernzUlnTghxDzloVw9zI7KzqtdZtrAbai7rcnUgmy1QIB5qE7jdkh2oaWe0xprp+f9nSgOAF0bPaRfKxyfEUngM4tYFZ6FMj4iDi9aViG53Je9dF6pPXabvaOHDKL1Dfam27qSlJGkDXQKMEQquTzYmUxSUe5wbpPDy9XJK1/+argo2M+DuwRDOhxHCnH8LP8ak413EVc53i+kT31l5GXlQfhMjtxlTxXmye+28ovkN75E2v2g50HmLnNPAlPR+Eo0q0dRYOxHd6V1lVVGgbI9JHagBgrodQPoqALcqpkgw+N65oIZx103B53De1HeoeW2T8Hhdcr5ucY1ZnJPf2lUIS7rn52czNIqeGDcoqMdeSQoeh8AW/viov5KN6QnS3rcg8Rq11Lu6mYBwtDIwq26pITafUt8ARDphw6B7NKgH1dex8gM8pC/2T/govSSioEyfv3GsUmtw3YbLA76osvHitBvcbGsbCEww61LhlduinHlFAW4ANvADeOsfaHJRmmnzOST4CMR2omK6F0jqK7n9VeZmfGbveWeJEPm6+x7IvA74ibX7WZFnQezqzSJR/6eiYNg7odWwyc2tXFBbLlMcvY2yofsPkUTKQ49VPLOduGiVF6GsGIeFzPEyKzYptVLgPc6sGI3Uevc0wDSsukS6LEVXC4pQl7UoA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(2906002)(31686004)(83380400001)(5660300002)(478600001)(8936002)(6862004)(31696002)(86362001)(66446008)(41300700001)(186003)(6506007)(66556008)(66476007)(64756008)(4326008)(2616005)(8676002)(91956017)(76116006)(66946007)(36756003)(38070700005)(54906003)(38100700002)(316002)(6636002)(37006003)(26005)(6512007)(53546011)(71200400001)(122000001)(82960400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YldFL21sWCswMmxvbWp2SnVlblRQZGJpeGwwMnJxY2VUL0JUZVdwYVRud2JP?=
 =?utf-8?B?VDhFeCtEZ0VyNG54RWxSS2ZoUWRtWUJ6Z09MMjR2UGluNENSR2FzbEsxN3Ez?=
 =?utf-8?B?MmVtNzBCbE5BeXIxQWhlRVhEM2ovVzBlc2pYVCt5T1RuUmtGMmV3ejdvdG5W?=
 =?utf-8?B?NkxnU1hobmpjemNEenVvVnZCcmZ4YjVrZ1RXWVhSVTYxRitVWkdmRUQ2M2tY?=
 =?utf-8?B?NzRBc2JncHRBRThFdUVIeldKNWp2L3JSSW1XSG1ybUJ5Y1ZtczJUeXoxazBk?=
 =?utf-8?B?bVFQb3BiS0RrcXkxcCs0ek81MVJxSGUxTSs1d000NzRBZVIxWXc5VkhyWGxK?=
 =?utf-8?B?cXhteDZnd3dYUWh4SS9FVWdHSHVQaGdTVkZhU3hrMHVQY21UYmVVZXBqTGti?=
 =?utf-8?B?bS9xR2M0bUI1ZWdCVmpzYmdSZGRvT2xaMWpsdFFGeGZiM2RIWUJvb3lSRlZy?=
 =?utf-8?B?bDlzU0owUSt2SGw2UjhEb1U3d01OMjNyZXUvUFEwODZKQ2U0MEc1ZU51U0Nl?=
 =?utf-8?B?UXlFUzRKUktMMVBXSHArclBiUFQvQ3FRTXRqVWdZT3lpdFI0RHNiTVkrbWh2?=
 =?utf-8?B?MzBCNGgyQW55UnBwMFhKMVJ3eHYvNC95aVF0Zy9SMm1KWm5jVDNBRHhFWHNQ?=
 =?utf-8?B?N1FBQ0dKbjdJRnNzSG1od29nYUFvT2Q1bGcwM1Q2YURzL2lTa1hKQmQxMGlw?=
 =?utf-8?B?VUxXb0J3QmFFRE5lVnRnVTNRQkZhaG1sSW5YT1RzeklnRi8zUGI4Zk0yTThP?=
 =?utf-8?B?NnBrWnpBK05YMjViTjdpSG5JVDB1U044bWlmbFFlUG92QzQzaFpuR2VJVWpy?=
 =?utf-8?B?b3FYcTdZeGJNV201alY3U1JzTzZoVXRUcmlKbjRUaEpSck5FL1EzbWlWU3ZO?=
 =?utf-8?B?a1ROcFdoWU9wcHd5L0lVUDRaVG1qVXdJdXo0MVF1OUxrRDMwNmxyZWxQa01o?=
 =?utf-8?B?dkxiNk1PeGpDUy92MDNzSE0xK2h2bkNsU1dNZGdUbzJaaEs3Vm10ZXRTa3BW?=
 =?utf-8?B?Z0VpT1VSMnhPVDdzV0YwSSt6WE9RdHIwbHU1ejkvVFpjV0hOUEV4NUhmMm5U?=
 =?utf-8?B?Z0ZmOTZSaTNRci81NWxlWjJENVNSdDgyajFiY2dLZkg0NXRJYWNGWGs3M1J4?=
 =?utf-8?B?ckU5b1lYMm1VbWw2eU1EWlZIK0l5dzJ0WU9hVVFGYWlLQmhkOEI4UDRlUU1P?=
 =?utf-8?B?Z0NQZ1Y4Zk8zakdXYUxqWDNMTHQrdlIvL1JnWVhnRmszYzdjbVRVRUVVcE15?=
 =?utf-8?B?REczaHVjSlBNQmxsL0NhcTFKV3JNdkRnRmcvdlBzU3IvOEtVOG1jWDJlTUM4?=
 =?utf-8?B?UVU4ekZ5ZmdBbU9WYVdFNkw4aEoweTRxZVpzczkzMStSSHVldGFSV01DUHJD?=
 =?utf-8?B?YnhqZGdLbTBNb21DTno4SnVSQThBU3NIUUNSVytxSlpIM1c4VXJRNWlaaUxO?=
 =?utf-8?B?Q0Q0ek85SkFVWkFiOWhsdXZVWVJkbGJ6SDhCbk9rN0hEdnhLK2UySWdyUkw5?=
 =?utf-8?B?Mi9Gd2JkK3JKVGMwbU5nYlZiUEJKeVh4MFlPWE5sTmYrSlVZUjIycFRBRDV1?=
 =?utf-8?B?WFJGRlJ2LzRGZGlTYXNEMjhJc2F3UFg1RFJCL0xKOGQrdWtyMUtFZWQyK3RI?=
 =?utf-8?B?Q3RtQ3dkRm40dnF0N09zM0RKNGpRbzV1TVJCNDlQWlpzYlI0N3VoRmRJS1Bp?=
 =?utf-8?B?V01hSHordXVMQjQ5MHdjaEJaTHZPQ29MZWs2K2RldklaK2F4SkhrZk1kU2Jt?=
 =?utf-8?B?VnJvRHBtTGtCVU5BQjNWSU9HeHpEaVFXTzZNMlRwWmpsQlRXSC9pWWhyTUxL?=
 =?utf-8?B?dWtad2VWQ3Ayd3BBUjd5eW5BUURKWjlyNzJNbCt6Zk4va1J6WEZTTkNVTVY5?=
 =?utf-8?B?TlY3TnNrK01KejZHTXkyVlAyUDZnZTVqTmtmMGRpSWZMTXRCY2xyR3ovU3FB?=
 =?utf-8?B?YzhsUXpBaSt0VFNzR3VZYzFIUnZZY2FQOUdDajM2dmltbzVoUC9pd1Z3cXZx?=
 =?utf-8?B?SzRBekpOOTgrQUh3S0JteS8vNzdGZ0pIWkp5ZGlSdHorRjQ3bVpDOWFwSWxI?=
 =?utf-8?B?K3NhaldsOFQ2Sy92Q1BYUjBpZG9wMkN1Z05ieThSM2loNmZESlBZZ2NtWWl0?=
 =?utf-8?Q?gsNa+DjxYn5/xwTYwQFJ10uYa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E039E64D485D03418B86EE3636A458C0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b93234-eee7-4cbb-9cfa-08dabceaf945
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 15:57:41.6335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUV+35fL/aiFZiP1OnCM+GB3vc2+oETkuE6qRWsJm9eX+Se/G670mosRBgyRuPUWZdb6AY0qNWwDe0aRfjhPNi21HizMBEGXSzFPzXw1Fyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340

T24gMDIvMTEvMjAyMiAxNToxNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDAyLCAyMDIyIGF0IDEyOjI0OjIxUE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBP
biAwMi8xMS8yMDIyIDExOjI4LCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4+PiBOb3RlczoNCj4+
PiAgICAgTWF5YmUgaW5zdGVhZCBvZiB0aGlzLCB3ZSBzaG91bGQganVzdCBzdGFtcCB0aGlzIG9u
IHRoZSBnZW5lcmF0ZWQgaGVhZGVyDQo+Pj4gICAgICAgICAvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUICovDQo+Pj4gICAgIA0KPj4+ICAgICBidXQgd2Ugd291bGQgYmUgbWlzc2luZyB0
aGUgIkNvcHlyaWdodCIgaW5mb3JtYXRpb25zLiBJIGd1ZXNzIHdlIGNvdWxkDQo+Pj4gICAgIGxv
b2sgZm9yIHRob3NlIGxpbmUgd2l0aCBDb3B5cmlnaHQgYW5kIGNvcHkgdGhlbS4NCj4+PiAgICAg
DQo+Pj4gICAgIE9yLCB3ZSBjb3VsZCByZXBsYWNlIHRoZSBsaWNlbmNlIGluIHRoZSBpbnB1dCBo
ZWFkZXIgYnkgYSBTUERYIGFuZCBoYXZlDQo+Pj4gICAgIHRoZSBzY3JpcHQgcGFyc2UgdGhhdC4g
KFByb2JhYmx5IHN0aWxsIG5lZWQgdG8gZ3JhYiB0aGUgQ29weXJpZ2h0IGxpbmVzKQ0KPj4gQWxs
IHB1YmxpYyBoZWFkZXJzIChleGNlcHQgb25lIDotKCApIGFyZSBNSVQuDQo+Pg0KPj4gV2Ugc2hv
dWxkIFNQRFggdGhlIGxvdCwgbm90IGxlYXN0IGJlY2F1c2UgdGhhdCByZW1vdmVzIGFsbCB0aGUN
Cj4+IGd1ZXN0aW1hdGlvbiBmcm9tIHRoaXMgc2NyaXB0OyB3ZSBjYW4gcmVxdWlyZSB0aGF0IHRo
ZSBTUERYIGxpbmUgaXMgdGhlDQo+PiBmaXJzdCBsaW5lLCBhbmQgc2FuaXR5IGNoZWNrIGl0IGFz
IHdlIHByb2Nlc3MgaXQuDQo+IFllcywgYnV0IEknbSBub3Qgc3VyZSBJIHdhbnQgdG8gZG8gdGhl
IFNQRFggY2hhbmdlIHdoZW4gdGhlIHRyZWUgaXMNCj4gc3VwcG9zZWQgdG8gYmUgZnJvemVuLg0K
DQpUaGUgbGljZW5zaW5nIGNvcnJlY3Rpb25zIGFyZSBhIHJlbGVhc2UgYmxvY2tlci4NCg0KVGhl
IGZyb3plbm5lc3Mgb2YgdGhlIHRyZWUgaGFzIG5vIGJlYXJpbmcgb24gdGhlIGFjY2VwdGFibGVu
ZXNzIG9mIHRoZQ0KZml4LsKgIEVzcGVjaWFsbHkgd2hlbiBhbGwgd2UncmUgdGFsa2luZyBhYm91
dCBpcyBhZGp1c3RtZW50IG9mIHNvbWUNCihsZWdhbGx5LXJlbGV2YW50KSBjb21tZW50cy4NCg0K
SW4gdGhpcyBjYXNlLCBzd2l0Y2hpbmcgdG8gYSBtb3JlIG1hY2hpbmUtcGFyc2FibGUgZm9ybSwg
aW4gb3JkZXIgdG8gZ2V0DQp0aGUgYXV0b2dlbmVyYXRpb24gY29ycmVjdCwgaXMgSU1PIGZ1bGx5
IGFjY2VwdGFibGUgZXZlbiBhdCB0aGlzIHBvaW50DQppbiB0aGUgcmVsZWFzZS4NCg0KfkFuZHJl
dw0K

