Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A223411685
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 16:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190939.340772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSK1g-0002z5-FK; Mon, 20 Sep 2021 14:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190939.340772; Mon, 20 Sep 2021 14:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSK1g-0002xF-B6; Mon, 20 Sep 2021 14:12:08 +0000
Received: by outflank-mailman (input) for mailman id 190939;
 Mon, 20 Sep 2021 14:12:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSK1e-0002x9-MM
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 14:12:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb12df1a-1a1c-11ec-b875-12813bfff9fa;
 Mon, 20 Sep 2021 14:12:04 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-WaL_l8gnOOaqUlZZoGgDjw-1;
 Mon, 20 Sep 2021 16:12:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 14:12:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 14:12:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 14:12:00 +0000
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
X-Inumbo-ID: bb12df1a-1a1c-11ec-b875-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632147124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VuX2g+UX7ZSv6cPH9po0gV2was2+PnkUBViG0eX7vuw=;
	b=CVabM7AQQWLprEHp8SbUR17ZKcHKugYzkrO11sJPXx74XfYmLNbawQTGZN/xkMsPg0BMU9
	51XU5xQBJ5/I2PY6S8mBRdtrcjnN9ESDJUYOZjIWHTmCpUgu1QFRtSiYmiNAzv2o4r4g7q
	IMCb9zq/scWJ9F2i4OTKkivWiOXUp3Y=
X-MC-Unique: WaL_l8gnOOaqUlZZoGgDjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWc1E5uVqWHepMl8WJYvacqXIuallh0fccQgk8oe5yxr3Hf3+Ahwe3HLEa3iBNaPwRLYhpKsnMthIlQ7gCoRXGgpSSPuojCIDo66ILslpMflT7Kc7pegKnnJl1GZp2mrG72CfysHnREf2veCd8a5uofYVa4O6NEwLpWmcbd75MqQVzkUcXFDtRcMn5kZ7K8vvzHwA1oW/L74EB7sYE1T8RhtFg8A1s2zZwCEvgibgnkDIhaTejkEetNyD69HnRrfIS7oNdsn/kNTZqH3h7H4GTiENgNcmrFNnKNqfShTLuXdTkXHXJVl+RcmsnlqQzAssKyf8PRG3v5j89gcKJegNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=VuX2g+UX7ZSv6cPH9po0gV2was2+PnkUBViG0eX7vuw=;
 b=HDOoRo73McqsIszaWbFoaJw5fWG1lxuChQlQjVi1CK11nngsZVZWscA+Mul3mbreq9a/a7bmGs1i7v1mZVQw/6awXVRGqqE+2bYrb4aiptjnsKytVikRbeo6+NmFM323t51dhBxLYzv6Vx0TfnJCnaMAT2WEc1Xv2KMkKFxKVJVDOmrUKZPrDi4yY5jawRVbtvT4/dilr42gNK5nJI5Tq7bUtuLP/KqTYA0OsAco6Cvht46jGcPHF+YsT7ZO2EkugKpHAChtddOPDZttHT7WlkpDDgGkRijHsrnaoxmLLvjP/9+HXkeRAf4dQSJSkMEqi9YHX5nkGkHzCHokl2Og6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: Linux kernel's msi_domain_deactivate() operation
To: jiang.liu@linux.intel.com, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <19fa9eaf-3c29-1ace-a16d-4ba3adf8a2e5@suse.com>
Date: Mon, 20 Sep 2021 16:11:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64042419-a9e4-4145-9bab-08d97c409d23
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB559929554B95429AD9460D09B3A09@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UJ6FtyVTK2PVyXNmWn2YAoP4HmDg08SUhTPTvks6YT2dHJMZzM5lGBQELpmJMm/7/JwcBQNk3ya809jsI+K1aqcKyRw72K1SsYBLFFEwyPOcOtllJGk2UlNGBYnQcFXdiVE5PuuRtGBw+fZ0jFtEEhKQJ2nG3SH1UkkxlrwhzTXXJm++SqJr+zcrzT8FOjwdmDiZvqtZy6bLhWHYl5iEsvuieO4qXB13PPj8eijBe1j/Tcf96rrDfnYEtBwmBDiIBZBGThmSMuk/j0yD//Sw81BL8SEE76RJiauqBpmpREltcLnB6QiWjXg0QCxAb03DHrcEK99Hy7kL3DM8vO5CfHy/i82SEWGmTw02cU1mpoBZxJgOV4shjycupqlT+NOVyr6b8L84ops0GC4EurinYovwo8vfHub6iokR3F3jqgRaP94ZfAhqlZ5SUXZ9j+ko6HIlHEpcAZkMdwc/dRpl8VSVAQHQ3xQGFKuD7UUn1dFPR+H584yZYdiGEsaPvaDdcMURJQ4Dz2aTxtRW9q9YaBoBK2Z1+sM0fCBpRMGvFKGSpKaqFdf6c2pKwi+8Wb066kEtsuW0w85Dorgk6sEMl3S+MJzCdY4V0gGmnjUhAlTcBi2l6/qU4KfAGML0TXlLa3dsJA/ssBt75QpAs7bDpOwWRDgq/NK7qGv7NplPUiqzP7+VxliptCk+ag4GkTcAW0g54Hq5GWuY1QeGqdzFPOV1eH4InpoVetITbx02VX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(8676002)(66946007)(316002)(16576012)(83380400001)(508600001)(956004)(2616005)(6916009)(66556008)(186003)(8936002)(38100700002)(86362001)(31686004)(31696002)(2906002)(5660300002)(26005)(6486002)(36756003)(66476007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cThxbVcwUG8xNHdmNEc0NkN2THM3OVVKZ0RLakJwRWN3QlRqYXVJck5oSHN3?=
 =?utf-8?B?WTY1SVM0RHlEYXgrdlNXLzdLLzl4ZExQSGpnWVlGbzJWY2xZRW03akVFQnF3?=
 =?utf-8?B?SE5mVmdaeUpxVTUxS0pFT2cweUhUUnQ2aUkzVVMrcXpnM21kUFRFdUwvaHJS?=
 =?utf-8?B?QitZT2hSbGVHN3gvNTJTZFdySk1YWHlBbG5BU2Q4bjZ5OXEvVnhobXl1K3JF?=
 =?utf-8?B?cW9IT09oOUR4NUEra0JMVnNMdVpCbEFZTTVXY0ZTeFJjZUJVVGxrd0MrL0dm?=
 =?utf-8?B?Y3Z2eWVXUVlJOEs4WWhPbUlOVFBQVnhOTG1PcGxMbGFZdGY0clBJbmJZNEdq?=
 =?utf-8?B?Wkd4SGVCTUZmTGZ5NmdsMVAxUFhOcUNtZjByQklCWDJJT1dpUEZjZkVTS3BW?=
 =?utf-8?B?eUd3bWRqRGUzN0IyOCtEbXZPV3JWTnk2azZyUDYyZkhKcVhqRVV2NXNQTk10?=
 =?utf-8?B?a3h6dTE0dDNQVWRycG1maktkWnFkVmZZMndFQ2Z0ZGVVNzRHYTB5d0UzQi9D?=
 =?utf-8?B?cFZUVTR1L1IrSlAwVnhBbzVoaUNyWS9CL0FuOWk4aWFPRW85ZEJxN0RpQ04z?=
 =?utf-8?B?VTYxZ3BGZ2N4V2Nxa3hVUWcvWjhnNmxFWU9hRGEzb2ErMlNyOC9iZEh0b3Nx?=
 =?utf-8?B?bVNOckZoa1RtSG5GdFNXTWh1MkY5YU1DSzJVRGRPMjJxNmIrNVhGcFkrVk8y?=
 =?utf-8?B?bFZlK2ZEWktXMTRjQVdMQi9TSmRyWUUvdW11ckxvQXg1SVpSWTlPVGxkb3di?=
 =?utf-8?B?K3pMa3NDWGRhNS9FWjZaNGQ2L1JIZWdYK3h2dVI4M3JJdVlDc2ovcDBFNk9L?=
 =?utf-8?B?b2I3TXQ1N2hvaHMxR09FcXV1ZHk3NzQ4NU9JQVdxWllEZU9DV2xRSHFIcFRk?=
 =?utf-8?B?eVhiZmE1ZmM1MDcrVEVWU3I4cS9RYUxvMGpvN0R5ZXlQbkJtQ3MzdWpzMWtv?=
 =?utf-8?B?c2kwVCswTnhCSkI4YzlaeS83NDlEOXhHTEFmb2ErQUp4RjZNZ01GMWxYTzV1?=
 =?utf-8?B?SkRObXNDSU5BdGtaTmdlRVF2b1FYTWdOTDlsUWtSMTNJcU9odlRvSTk3dzla?=
 =?utf-8?B?a09lL1JyY3d0L2Y3SFMrWk9tbEhXZUZQck5lcnBtLzB1eWlxTzAzZkpGT0Jq?=
 =?utf-8?B?YzZwTmlNWVZBendQYUlMcEVoN1o3ZklhWE00bEM0ZnF0cjBhYzlwSlRsNWZ4?=
 =?utf-8?B?SjcxaVZGY0JMYTFOOGVQRTB1WjRNM2F6Zk96NWFmUS9xTlpYazhMSlE2OXJo?=
 =?utf-8?B?akVOTVVaNU1ScDZzSVU2bDhiQmR2dmpYeEZZcTI4ZUdNZmQrUTljQkNmVjBW?=
 =?utf-8?B?UkR1cEtIT0h3TDFFL1ZhVHYxdWtqZDRlZXg1dkJmMUxKYkMrSk9tWlBWOFFo?=
 =?utf-8?B?OFVYMk5YdzRmOEVmN0ZxbzJMOHoycGtkZ0tGTzYyeCtkNGdEU090NmJCNThl?=
 =?utf-8?B?R0xrTEZTb3VxM1c4N2JKaFAxMVh1VC9yR1A2YVVBUTJPUlFOOU5EMjRmdmpi?=
 =?utf-8?B?cWtUL2IvbS9WSDBSMzNmQXBxaDdEdG9RbUc4RzVTQ3NiVzgxeDVWcHVsU0NR?=
 =?utf-8?B?MkNkellKT25uRG5uUWRFVWh2cHRpa2JaTzZDQkxVRnkrU09hQmFkdEhOUFlN?=
 =?utf-8?B?TEJFNDdCWENuRzFvMXI0MXdKc29yVnN6ZGdqdmRrWFdSZmdLa2xaeXRybUNW?=
 =?utf-8?B?K2RiMkFabEJNMUtmOXFPNG9tWVBmdnN2WW85cDRLRmtaSHV6WGNCL2tYSnNm?=
 =?utf-8?Q?25b+2Y1VzGlT+undaA0LfEhHGor2pHSBRiWq+j+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64042419-a9e4-4145-9bab-08d97c409d23
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 14:12:00.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GiXq6+skDJPSv1BCqk9KEHRYdruB91i2ALyMZRYJDcbnDdRJIIww/DVpNLrxNPAsr3QBFQawXnUNyaSH1NJQsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

Hello,

I notice that from its introduction in 3.19 this function simply clears
message address and data. I wonder in how far this is "deactivation":
Aiui the device might still signal interrupts this way, by writing
32 bits of zeroes to address zero. (That's not going to result in an
interrupt, of course.) Shouldn't deactivation rather mean masking (if
the entry is maskable; looks like this is happening in an earlier step
when possible) or disabling of MSI (which unfortunately would then also
affect other interrupts, if multiple are in use) or some software means
replacing masking?

Background: For PVH Dom0 under Xen we check (in Xen) whether address
fields written actually fall in the designated 0xFEEnnnnn range (as
long as MSI / MSI-X is enabled at the time of writing of these fields),
logging outliers. As it turns out the message appears quite a few times
per session, primarily - but not only - during shutdown. We log these
instances not because they're wrong (as said above, this is in principle
a valid mode of operation), but because proper handling would require
further code in Xen which we were hoping we would never have to write.
(Thinking about this again, it shouldn't be all that much code.)

In a small subset of the cases the operation actually occurs with the
respective entry masked (in all other cases there's no maskbit support);
we may want to consider suppressing the log message in such cases, yet
then we may need to watch for this case the next time the mask bit gets
cleared.

Of course in the kernel you may have reassurance that the device driver
has actually disabled the interrupt source at the device before this
deactivation. We don't have such secondary knowledge in the hypervisor,
i.e. we can't use that to suppress the log message.

Any insight would be much appreciated, including the possible pointing
out of us not having understood the underlying idea.

Thanks, Jan


