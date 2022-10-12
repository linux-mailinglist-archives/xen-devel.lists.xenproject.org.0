Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7E5FC1F8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 10:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420862.665932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiX58-0001on-Kf; Wed, 12 Oct 2022 08:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420862.665932; Wed, 12 Oct 2022 08:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiX58-0001mh-Hs; Wed, 12 Oct 2022 08:27:14 +0000
Received: by outflank-mailman (input) for mailman id 420862;
 Wed, 12 Oct 2022 08:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiX57-0001l6-GE
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 08:27:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb9da21-4a07-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 10:27:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7264.eurprd04.prod.outlook.com (2603:10a6:800:1b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 08:27:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 08:27:11 +0000
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
X-Inumbo-ID: abb9da21-4a07-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjqY8p+ebUI16dl7Opvx+jw0SrTru+sKl47bCAODOEIy4tEIZgRGGxbbjyUcERFoez/2q3+JNYdfBv9oEAbTQVLNnO5ytaEIllGrxtvINfUIqOpyX7L+am4IJtz6nF6nldO1WzS0s6spJ1hnIvv1LgnitXRRUfJyi+G5qx1QTrYb4LCKYL+eQGN4xYpUAIeOWHuN6GMt6MADb2aYCBcbRhHNeLmRfQ4Y6CKfPBN/baRv5qCJcKLN/GXhtZCSWInta4xDua6hxf7CM8ieb5rNpP8QwzQGpW3fg1DcqXA0bjwPHEhLdjVzRPW5Z9XWBRMRvvjyTN2SpazwLevsOdtprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwHZdTiehv9+RkMjfVK3C2msH7GAW7q9G54m1RepLv0=;
 b=Civna5LcyKcJskYWOgCq18VSs8g/e40g6w0sYjK3Ar3r7MXp3GFIBT8fgOtzRw9jGFkiG0S4zth7aFL3/hlBAjjZpIjsu0PQMwMmGq0MtTYzDzk4BMvQm9CNk5MQJ5anmYlqT2TVmApXDi83udGQn5C++Xvhv7+0P3hZ0xbVV7lipN0dzWQLPrrJIkqbM8u4bYJNkbLI1LIwMsqpOqjyVbP3SVimz37mVojzrzIltF7Y1YvpkNhOCt5dHQKgm9zRA9W8uM8TE7e1dy9Sagdu/spLTR3MJ13jDvUuIqO4KAjeUM2+XZlogjBh4HX2o9EzOadx72ZbxGoKXtz7sWDcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwHZdTiehv9+RkMjfVK3C2msH7GAW7q9G54m1RepLv0=;
 b=2KC0OagRZHz5O5fmAXL+5c01voEI6JkIfxTA7MIJ0yBiuWbgh11yKYFyoXGpEs1SBbITZlrxVWDNnbJYB44n8xOji5Ji0EMtSl+eAAf8irAXsdPYwhp/UfhcTnNms7p4l72n43JOMTY4XTB/pMakdGd43of48dlphhAgcE9vsYKI6vlcwSeFnr6q8s2GaxP7v2JpQqiOBGaTjV6UCrVyHoSyqOgXETr5OCIaHMRF1z+NoCJFsMBh+foLe2AP71VV7iC6Ta6RLrD4vFI76F7tPnHLAQwyvdvwvBOjgZ6VNb2ZYvIlGPI+JVF21KOMF4O8xcAPgq1Nj9XrwvlcUG50FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3510aeb0-6c91-89d0-d35c-ac2a0eea940f@suse.com>
Date: Wed, 12 Oct 2022 10:27:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH for-4.17 2/4] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221011160245.56735-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b3d9d7-c7c2-4f26-f1b9-08daac2b8f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5vauyi2QL7SVNSSccMaa566VY/pIlNn/AVgc845jUAJ+66AixPSwrSKcfcJcgdeX6G9HgXHTQFgsz1jy3yqtYgihIo4wBSGEYEhXvFfC8vFcxfh+3i7dHMdEYABDoAMREiVhWkwu4fZa3tjTme0XzpGfLy07LJ/MiBDgjfOgumr/b2hV1XujWPjfvEFilYvITYiJdJyr/6ElvDm5Bo2ZDi9FM9JwuBjOih//g75yNcfTbQR1wPTZ2L6rHTPZp9h3R5F1SZGPZC+4qIIoxWeK/l+S34afKsh/bYkErJKzQrlXseSoVaVI+iL8QtH6Li9ZiaCv7dEZVIyV+uAY/cVPOfFUqGO8ZCDtf1mt1pqPWUtwqFi1dDS84W4WdyxifAEiFmikt3bplqdizKvfyfmn1G6umKZgB93b+Xzg43cdUg6jXhFw4AdpYMnK84HAokAtRdoExyucUaLEu9AmVxwM/aq4zdv3iYTTp1DXSKTE9VM+6Hp+LY6NyquFYMOlyCdNjMRyReLPD5kCY309vk2RDQ6O5lOS9LKeOhcKHY6j0yPeFuGpNZcjRGMxw5C7WjcCzDM/psbXsDnRicRMc14WBo/8/JPAoAqiykKbgdt59XlA4cnVPC6zMGNcprk8N2gfHYlyAjwhn9d21AEYiUN+IlHwG4a9jAQjSaBtQkQWeZ4TeJKv5mRI4JlDQWhr2Ok9qQs0A5m6Kj2oCQ8kU7AUJTTwN2DZAaS0n1fa30FBH+uhZ+nHOvA8Fn9CGjwuJNp6q+blDX9trXutUjtmsJepyYb/bafdVzD92vP2wjYbdhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(376002)(39850400004)(136003)(451199015)(86362001)(6506007)(38100700002)(4744005)(6512007)(66476007)(8676002)(478600001)(66946007)(53546011)(2616005)(41300700001)(6486002)(66556008)(4326008)(316002)(2906002)(8936002)(31696002)(54906003)(5660300002)(186003)(6916009)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGJEYjZhd3oxeW93cGl4RFRmOVBZUFhOblk3b1NTRlZqOEhPNnBkSFZsT1Bw?=
 =?utf-8?B?akZpR2ZMMHJQZFlFTy9Qci9XS0x5RWY5YUw3OU1lMXJTNnhrUlZXWTlKMVh3?=
 =?utf-8?B?aE1HTmtlaE4rYXQ5RytnZGh6MGY0OWpVOWRFWWJvRXorYVEwWWExVjZvNXBB?=
 =?utf-8?B?TUpsWDJ1TmNyUmsvYlJkckZHRFRSYmZ1MkNKZVhSbVpSaWE4QlVaMzlPUGEw?=
 =?utf-8?B?Um9DMzBTc2ZhOU9SVU43S255RkZuRzZzN1dFRDBzbkdvaUVZaVoxckZETXZK?=
 =?utf-8?B?bHZaOXRON2RpTUlnMi9Bdzh3cklOSGhCYkJNVHZZM3hqTFVyVy91SThUTW5N?=
 =?utf-8?B?OVB0MGxmRWpQWW1RQk9FaUJoajY2V0R1MFEvaUxHajRjcGQ1ZWh6OWxhZ2Jq?=
 =?utf-8?B?MnhwbFJrKzgvNWZSQ0NOMjdwMFRTUFJLeUlTNjU1VnBhN3kwby9hdkFFcHdQ?=
 =?utf-8?B?SEpOcHV1dWJsb09UOXdFSnh3VElPS21vWWNDSFFqMEMzczZCekNLOFBsdVVW?=
 =?utf-8?B?S1hCanR6QklxUjVqQ2VUKzA4d2JKeHJETDM2MUdoL0Iyd1VtREoxQ1lnbWcz?=
 =?utf-8?B?SUJIbS9KUkVCYVY0YlJRVTVVMlp0c1JaNWxLYmllYmxxampOaG1EWWVGYWJI?=
 =?utf-8?B?L0VFRFZnelZUU1JsMkMzWmxON1RqSmxBTTl3aDN4dU1HTzV2cFJXUTAyQU1D?=
 =?utf-8?B?b0lrWXFmeS9wRkdHc1VGdUd1SXh1cE9oNk5mT01ZK3VRaHdQNUZ1eGVtRnFL?=
 =?utf-8?B?Tk9EWitBU3RoVFFBQ3dUM0t5bWFEc0UxYW1KNHA5R3B3M3hoQlFBamVjZ05x?=
 =?utf-8?B?b2JYWTJrNDZCM3ZUV2I2SGQ2cHNFdG1Wdi9hbVdMaHBMRHJlVjVud1NQK21o?=
 =?utf-8?B?dk5hQXB3SkQxN0hlWnlsU2xMY1R4MjZTbEdETjUwYitVMU9iVWoweXVVU1Bt?=
 =?utf-8?B?aURVbkJpNWFzWlFkSURKWDM4Rkkwb1Rpa3ZaMkY0QlRHK09GMzc3WjlKbFhO?=
 =?utf-8?B?Wi9iLzkzVnkwb29GY1l3MDZLQnFSVlg4dkpWMmtOSkVrUDJvb1dYcnNJTzdX?=
 =?utf-8?B?a1Q4R0l0R3RiZHkyUHZKRjVDSy9FSVhvWkVNb0xQcEozelBlZTZZNnBDRXor?=
 =?utf-8?B?ZkNCT3ErbkI1bk5wYkoxU3g3VzFzekk4ZU4zbzgwMTdEVVZzYWo3SUNOM0Jq?=
 =?utf-8?B?bmczcFVQVERrMDBGQVBTRkQ0NTRNbHplU2EzUkJuTnZOeXVRdE9sMlNrcEow?=
 =?utf-8?B?aHlnVzEwc0MxSHVkYklRUUpOMU1kdGZJb3k0RWtJUm8zWEExeU5FMWdocGdj?=
 =?utf-8?B?SkR5cGFZelRSR2xUYkgvMHEvWG1pdVlJNlVpZnB6aHlxT2tCcjBaUUh1SUV3?=
 =?utf-8?B?NE1ZL2xlUlF3Wi9LMHNJbEV0QzB6MzF1L1dmZ3poY1JZNlh4SDZ3TU0vMTEv?=
 =?utf-8?B?c0ZzaktLV2NDUS9HNFlIcEZpMDZMbkxyaGQwV2R4Z0x2MEVtV2oyL0d2U1Bl?=
 =?utf-8?B?S3ZXNVg1aGtHVDhRSUNERGxOSFQ4L2tuODlmWjhxOFp1STJFd2drNytlME5s?=
 =?utf-8?B?MTJtM3BsN25PK01MNDlhVVJic3lvZVFKQzRROVp4VjFhNlc2TkNtc0haVWto?=
 =?utf-8?B?eWNlVVAxZW82QWNEMUZKUEdqQW0wbEdKd0hJQzZPK3pSUm00aFpaV0VlWk00?=
 =?utf-8?B?dXp1VXpmOEs0Z2VlSkpnQ3o4Rk9xeDMraERjaGRYWTF2ZVJzRHR0cURQWURI?=
 =?utf-8?B?T25abkxiS2hMaWErSXppZ2xuNjVoM0Y5NjJXa1dGZjlNbG9SR28rNWs3Qnhr?=
 =?utf-8?B?WU1SbDVaUDZvTUxHTnF3MXEzWFUyUU1JSHNVU1pPb2J5bTdtQ1ZlYTE5RGpY?=
 =?utf-8?B?LzRMeFo5bk9ocmpuY1V3aUFlbjI3eFRnRVgxODQwbnZjYlZTMkIwYXZJUGQ2?=
 =?utf-8?B?ekk2NUE0UGRic2F2cXhSZ3dyRGlaVjNuWllRelp3dWswM2UyalUxNFpYK2VI?=
 =?utf-8?B?dGJ5cEdIZndsZ1BSVDQ3VXdTc1dVMCt0SjlpazNuc2lUYXByWTJtcFYvQThw?=
 =?utf-8?B?Tk03dlBaVDc1Y3gzbmx2QjZVeDE2QXJ2c1NpbVNPQzVsT0JieDJsS1FJbnVF?=
 =?utf-8?B?SXJpK0dITm5mWlNiMTVPYy8wQ2NsSFF1YnJHUHVMWnJuTFJlZVcra0cxWVEw?=
 =?utf-8?Q?j1N/qu//PPfTr2Gkrb5hyYc3RCkbuTgVVcDuev6O3vUx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b3d9d7-c7c2-4f26-f1b9-08daac2b8f21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 08:27:11.3002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG1xlyMNckSTgbnHMpmfNfB0uMQMbi9nh7r5lZRn2EOWYpEb95+ywOjLwqU6EYAuZHH6O/l9D/mMZBLYCsSeMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7264

On 11.10.2022 18:02, Roger Pau Monne wrote:
> Since the VIRT_SPEC_CTRL.SSBD selection is no longer context switched
> on vm{entry,exit} there's no need to use a synthetic feature bit for
> it anymore.
> 
> Remove the bit and instead use a global variable.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



