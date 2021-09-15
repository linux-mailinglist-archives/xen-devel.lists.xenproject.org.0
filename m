Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031940C652
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187591.336516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUsq-0005aj-1E; Wed, 15 Sep 2021 13:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187591.336516; Wed, 15 Sep 2021 13:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUsp-0005XL-TM; Wed, 15 Sep 2021 13:23:27 +0000
Received: by outflank-mailman (input) for mailman id 187591;
 Wed, 15 Sep 2021 13:23:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUso-0005XF-F6
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:23:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19ee43bb-1628-11ec-b517-12813bfff9fa;
 Wed, 15 Sep 2021 13:23:25 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-OqPvAyUvOmOlduviU5dPyA-1; Wed, 15 Sep 2021 15:23:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 13:23:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:23:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 13:23:19 +0000
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
X-Inumbo-ID: 19ee43bb-1628-11ec-b517-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eF/F0iAs7jvag1La3RcSAjevpSwKJ/5NYKXkpAFvqX0=;
	b=M0bKyIBd0gEoT3Z41jeOR+cp+MMB4k/QCA/GoOre7D+AcxNc3LDqK2RLZRg8AoWCLfLw8y
	8p2jKBSMEK5i6vCy3j7QGtf5xCKFBhkt8UbT6S97XwF8OTWt46dqniatN2UWEjharLZPuI
	PLSVJ9p71+xy+s5ooAgbMEGc81N2HIY=
X-MC-Unique: OqPvAyUvOmOlduviU5dPyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXGsIy23xMAQ91uNmtHTTxnwQiMF3+T039jffcZ6z45hMtZa9r4p641/A00HnEHzn+Rhl+ohQ2XgFmnsj9JsXMSdhbwHcCoS2cQGqKsVzWfntDut7OzgkYaobpOVAa92SBJz/HGOsxRdOR7VwULp63erSKrCjqhzBVtEO06hGtSppAYTge42uzs4l0SnsHTUC+Y/NauWKr/451K7tOnAHw5bTUR3p+IGuHQ56Yl6Cs503MUDi4n71JyYlKCb3OE7uXAT3YbtZHkltkdAk09gEfIjvG5jEfQG4kkix7mIpcE5MKS5iG8AiCi94hL75k+Ctn1nFepd2m0TC9LWe5H4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eF/F0iAs7jvag1La3RcSAjevpSwKJ/5NYKXkpAFvqX0=;
 b=U+gmcNReOYWGevQg0peT/vRTPEBGRLkjvRj8/XqPxzI164DVWIeV5gFepSUaoJ5Vz797e6aYvYRoYZoSAdFd48qse43lLc1VGVyDo8To7mCnxgsZItX35fXvYDzAuUIh2QdU8asYOHxkDyzxKjq+doumDOwolBBtBoNUxGANy5gcZjoigco6WSpLuPXIvJ1nYcoUU+xd8HRhRRl/g+istph+1VJ3qRSjD8SdUQA5Sda9YrMtWhx0RGlhMCP4hAHI4PXGjRih0q3w/LhGqSJKekZvxhjbzX2WlWM21sS6UKETdMtwnQ0vMINZtNwmnnKfZFFL+tP25oQCL0kfxYVk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/7] x86/boot: (mostly) video mode handling adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Date: Wed, 15 Sep 2021 15:23:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0d788c5-aa2a-4402-fdee-08d9784bfc6c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742839EF87993615D0758B9B3DB9@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+fHAD63yd61/S4Z8we5p1EU7mEzWNLgeqBXfiNjrncyLKmHK/vwpx529iDt/dEPfWlNI55vs4hgyR1LEzHfocVhgoXK2SKEIcmWTmfUVWlC3Euz+gyLzXnrKaKsfGBncikvHD3bncy0pd6/RP3hTNhOfD8w6UREFXcZ6pA0FS61wYGipmkV4UrSc+EbfJdQLtPQlaHS4jGkXxZ9jggsajKoObipkL5hSEKrb0pJqVEuroHADcyxG0wjQUjpCQlTt2jO4uymvu1zcL3MOh+bHYMNbC1+4mGAH5fqv8Ckx2At1df+vrS9Axj1xryiV9CeJHsOQEUlkNmlIWxnRrtWY5+CV0iIU4fTftp3Cd/6GcwamRXRvE/LXglH7+SpEpDxAmVPG/6XUp/9pONaY8PsNscMf1GqILf7xQckS9uioU6irGJZiqEuDurEVKxDZjwfPantp6eqx96oLuLHYBvtN+6GZVSK5Ive6fP0sQbPszSqe0BfI3ezk/p4USUGtFhMeGuBG+0hZ9Okz6KxhEwm/UeoyD/q6E0kYbIKKgOolIA+72yftbatSpR1p9aIQDAqZI1O+BsI/xT3KNc69mLxfHbuULPEdZcdo0DvD9Q2oi4nAkNUuh3hkmDWb6a+WNgFGV1XGYYB/06PekRg/dlXmOhS9N3apePJfOxjomDwoEtWdYJlAzv+tcOXDaAQ/Zti6+3NGUbPNt5MwHHLDnygdxUyg6qR3LU256uoRC07S7YNdLLu0915nXjoP9M5Sk2cJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(396003)(346002)(136003)(366004)(316002)(66946007)(86362001)(478600001)(6916009)(186003)(16576012)(2616005)(36756003)(31696002)(66556008)(2906002)(66476007)(6486002)(558084003)(31686004)(4326008)(54906003)(5660300002)(26005)(38100700002)(8676002)(8936002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXpGTXZuYTA0ditFRTByd2Uyb0RrQ0dVOXl5UzU3aEI4SXdSd2RQQm1IT0hI?=
 =?utf-8?B?bXQveU9UdkFML2RkbURVcG5GOHkxTy94NlRqS0VTZmVRKzFIeDI1SFM3bC84?=
 =?utf-8?B?TGFOcmRiRmdoeDkvbFFUbVRyVGdoT1FQSzVUaGZiMDFmT091SEkrSkNMYndO?=
 =?utf-8?B?NFBoOGQ4b21aYjd6dXQxSlFlMTA3eTFyVzNHa1RiTHp1dFRDNm9BVVluSE1D?=
 =?utf-8?B?OG1rMDBOSHFIUytxMVEyeVVqd09DbENoQlFtYk1XaHpqZHdxdUozbDVWYmYx?=
 =?utf-8?B?MjlXc3VXdGFSN21PVVE0VG91Z2ZpNGZvbGhHTVYyV0hiSURjNlBzZ3hIaktn?=
 =?utf-8?B?bXBxdEZSbGpOa1c4bUgrTXowdXl6WERHM0JDVUtyZkt1MVFjNFpEZUFJT1Vx?=
 =?utf-8?B?SHpaWGdvVWpsajl6Z0FJMzZrQU0rZjNwM0tCZ0l4ZUovbFZnazl3SGF3aEdx?=
 =?utf-8?B?bnMyRXEvOExiOFF5eE9DMi83Wlp6Smw2UlIrYzZzRUNDTzByWHgwWXQ2T0I1?=
 =?utf-8?B?cU9ydnVIVUljY2kzYmg3N0QwZ2t2QVArTlBpTVBvZWxvcUFWZUd3WEtkZThP?=
 =?utf-8?B?c3hnRHd5SVdCVHpESWhmdDNzLytmajNDSjZUTHJTb3ZjdnQxeURDdm15QlQ1?=
 =?utf-8?B?RjczU0lCWEdLbXB1eVJDUWhQOU10djBPRmhMeW9oY3Jxa09CQ1BOenhzYllT?=
 =?utf-8?B?V1NVYWF0UkZKQTJ6OGZoRWhUQkc3UHl1bThydGxkVTBrQ2ZMTkdjNWhMQWdL?=
 =?utf-8?B?YWxWdHE5Rm1kQWdiUnRqMzZDeWM3OWw3Nm5DQmxTWmRDTEoxNHRGR01VOTQy?=
 =?utf-8?B?emdTNVIxV0MwSzhqcE01OVpXV3hXeWV2YTloR2dmTnkwcDBuNXRadXZ1N2F2?=
 =?utf-8?B?SUNUejl0VFJYTStSOVo3ZVc4NE5oVXdFWHRrU3d3QThjMTlPNWhDcjNQRGFC?=
 =?utf-8?B?NlJhU010eGJVVFBZWnFiQUZ0aFl1R0dTUWVZTjd6dHJTY05saDNWanR6c05u?=
 =?utf-8?B?YlIyWmZ0Mm1qNUJ0QWtKNkNpVktmcFlNZUd6N0JJQXhnd3BBZXp6ZnBDdWJa?=
 =?utf-8?B?QjY2SHpSUno3ZUNEYU1pWHF4Q2t3OFIxWXArTzdUbUtsOFFCUFFjVjFNTyt5?=
 =?utf-8?B?dVlrdDEzZmkrOXVMaXRxb2tPM1ZvYXpZRWw4UVp4VTJnbnZHSzIvWkVtdlpE?=
 =?utf-8?B?WE94WThaZjI2U0xaZ01lNVhXVzlBa2N2RUJ3dHQvTVVtWDd4R0lIVDZ4ang4?=
 =?utf-8?B?enZNYzk4QXkyUWErbDlkOENKdE5mZ0FLU3ZnbkROek5QK3VvcGVwekJZYjRw?=
 =?utf-8?B?RjR4blNtTVpmWmk3Mm13aUZrdUZBUU1VcERId1ZpbkhobzcwRkVBdWJweHdn?=
 =?utf-8?B?d3hpU0tFL3ZwbU9CdHBlOHFncU8xV2VvQU1sTDM5aERvZDZZcUFkQWFXVWNM?=
 =?utf-8?B?QUFyTzBSQjZDdWo3M3VSSjhnN29kOWJDWWROL3lWUU9IRHdNRVZLMmw2QVVR?=
 =?utf-8?B?OHBaWE80dFlEekRkVFQrWjh3Z3REK21HZThIOUR0L2twNFZrYXpEanBjOUdi?=
 =?utf-8?B?VGZhdllPeEk1ajNsSGhENTJySkdGbzBwZ1p1bnJvNWExUE9WcGdoQlFrMy9o?=
 =?utf-8?B?clZGc054c0ZMVi9WZEozWVZrOHp0elk1eXN6dnpoazVobGFMQ3hHdGdDeWts?=
 =?utf-8?B?T0RGVXpxT29Wbk5OV01QZ2RKS2Uva0hSVStRK1l3c3NiRnVRZXdYSE9MQy8y?=
 =?utf-8?Q?5W0kPXRFoG5J/k+C1/t/T77jBmte6398gsE9x6Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d788c5-aa2a-4402-fdee-08d9784bfc6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:23:20.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGv5IBC/6P/D21PYiV93u5w4WQic+VtoJzy8O0u0xaRWHlmP1gTK9/NGBc0fnS5ql1t6204e8KnP8W5poKjyeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

1: make "vga=current" work with graphics modes
2: obtain video info from boot loader
3: EFI: retrieve EDID
4: simplify mode_table
5: fold branches in video handling code
6: fold/replace moves in video handling code
7: fold two MOVs into an ADD

Jan


