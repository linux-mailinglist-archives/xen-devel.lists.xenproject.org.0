Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A36FE4E0
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 22:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533013.829371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwqBy-00021r-56; Wed, 10 May 2023 20:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533013.829371; Wed, 10 May 2023 20:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwqBy-0001zH-1W; Wed, 10 May 2023 20:13:42 +0000
Received: by outflank-mailman (input) for mailman id 533013;
 Wed, 10 May 2023 20:13:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PWYj=A7=citrix.com=prvs=487e665c6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwqBw-0001zB-6c
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 20:13:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a8173b-ef6f-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 22:13:37 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2023 16:13:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5355.namprd03.prod.outlook.com (2603:10b6:5:246::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 20:13:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 20:13:32 +0000
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
X-Inumbo-ID: 24a8173b-ef6f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683749617;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=leXcpVaqqP8/gqGufFnWQM2LWpzMebms9ji6OtL8E4w=;
  b=LI6AXwUuqpYAW6+KOHnGUBck56q7MSRwt+DXW9e/4ZeemzC0WgJNqT1L
   XtCuXAxF2fmRmeg8ASD+FD/gaCOybKy+hZ9lfnL8bBF/Q5y+WDT19iarF
   8anXRGTM5bdStIoagD95B/LM1V/sZXEp6Ltd/12rsF7IGqwMgxNQeqyn2
   c=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 108461880
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ptcC/qORPkvSzLvvrR2IlsFynXyQoLVcMsEvi/4bfWQNrUon0mMFz
 jYZXmrSb/+IY2Chfop3O4+z9xsP6JfTyoM2TAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wRmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sF+UTF22
 ecxFHMmbwq9xPquxbO0F/Y506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCDpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXOnBttCROXQGvhCnBqBwm02AkEsRFaVnviHq0SkZftbN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACA4aud/qpdhrigqVF44zVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTzgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:SP+JIarlMhcYmziL5b4VEfoaV5rbeYIsimQD101hICG9Evb0qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2Ki7GC/9SJIUbDH4VmpM
 VdmsZFaOEYdmIK6voT4GODYqodKNvsytHWuQ8JpU0dMz2DaMtbnnZE4h7wKDwReOHfb6BJbq
 Z14KB81kOdUEVSVOuXLF8fUdPOotXa/aiWHCLvV3YcmXGzZSrD0s+ALySl
X-Talos-CUID: 9a23:yIpPd257XaON1QMO/9ss00dESvgJaVThj1zROXH7EX5sSbLIVgrF
X-Talos-MUID: 9a23:6mrutAa5oluCDuBTq3j+gDBHPptS8qmAN0EzsJ8cheCAKnkl
X-IronPort-AV: E=Sophos;i="5.99,265,1677560400"; 
   d="scan'208";a="108461880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IibQ/VQA6tsT+c1QGxmUKFf2331X+Ts8dzhq8jMQ929ILmlaAnWdQmQ20ENnAd9V3m70pWdNNAAPzw4PvfDP7MJOY8rS/Bzbsq+0ChUOtUoRvyLklEwycvHBHhls98/uZlbhmegFSneqVw1jQSumc7WYGCKIpQlhoR14ZtWYKmBWIWDu4TLmDleFx4DQaWbB3nu+9oYt89tpBG4+xHZ3eA5GTDDlAZ9hHwk5aiRKpzHQQmrpfcqlJgZ3D939C2EjPaUTo1e9tv3GWXzGdHf0lXvPxOtWjn9bYZwj+1AqQToVQw/W34YTA60agijk1T60N7oDLkILkpIPzsQF+5sqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNYchtnQGr1T52aYNs+XuWuJ26zlEdOUQ/HmfBPouME=;
 b=LuKsR3uodsmSJYp3ldYDvWiH8Pq/WxRTOoPeFwooh7lZEmDLukno4NlwOqz1zq8lKxoaSTdHjTqNO2lQrc095Xdvkk8R1kdvvkSyISswZnjqLkWoYPHKUnvGnnQXB4TtGXE/EKY6us8Ii5pYsN+Yi89UL75/LoGzzyVEE5QJyln4dPGYbtOT6Q18OQNSPaL8nrfy+NKsEeZTIbzgmzDWJ81yT749nK8THP93syoqOKPoIabHG0GUw4UBRupi/++O54vdK50X6fv111TP2Hbi4Ebe6mXVveJdJs9JVGY3Mq8G4lnfKc2AY6LPBZlshS4PKKY7yHxZ5Mwl6O5K+xbAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNYchtnQGr1T52aYNs+XuWuJ26zlEdOUQ/HmfBPouME=;
 b=wNLasuuNBGSGoUciyKtF7Wrv1SPcq1iQqqF++MdzJZLTSD3wujlI8/gxiToPNjcb6vnRG8B6XKmdz27rLsU7fyZlKk0+fbZ78GQfQB5I+QIG2B5R2NuzLHJwf4zfN9RXRH6VSXPTSH3OzEMGnAG1TE+e1qIZh3uXXjEHOzP5sO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e4385229-a804-191f-c656-b605c498a292@citrix.com>
Date: Wed, 10 May 2023 21:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/6] x86/cpu-policy: Disentangle X86_NR_FEAT and
 FEATURESET_NR_ENTRIES
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-6-andrew.cooper3@citrix.com>
 <9613df3b-c49f-6034-ff99-7a6ea9286f0f@suse.com>
 <e888dc16-66bf-fc15-9ddd-f10879b79a5d@citrix.com>
 <f09c9127-1cc4-1ed9-0348-be12c0c999e8@suse.com>
In-Reply-To: <f09c9127-1cc4-1ed9-0348-be12c0c999e8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0145.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5355:EE_
X-MS-Office365-Filtering-Correlation-Id: d85493ae-7f5d-433f-4874-08db51930696
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/eJLQK3EykdDGBjeQf+z25HHgdzg8e1eD0QhkDcmvx040l+4a7iAk6ywVtOBTt4/tz037Sx8DqcG5jaPJvKKpSaGWpX8m7HETdqHfWugFtEgBW9tsvfkmcZUW++1oRxtasFEAaeYgCcSt8vOHJM4mpHcbiURlIIYXx3Cfp6psapQGjkFFbwabs5xLalUAn0ESQwk1lFHxtRoHqO0yLOefuab7PlULcH9W2mNx3ow1mqUDWGLY7TO7U5TNWLRe5rym34Q56kQ4hTmzUIS7pydWIn3Fi/oNaLKTHjnx0FIRvecxHk1kAETqJzg/Hv5x+VfxI1jl3HM1h1ujwk/Nm1lrYX6ygGSXtCNVIkvefv9ctsbXss9IqbNoGLsjtml7iyghTjESy2ck/Q7y5qFqLmkcCPIia2TbMA+IjrXDmhKSDa7f2/W6pIfger2dTjfD565MQMoOMtwZJFxRR/ALYmb5kz6GZhjs2dNhEfyP/v71edJ9RLJ51IH+fS8zVBFhgH/+PeO+8a19DtczgcY0s40bgNbuzGQfbadPD6zW5jTbID9mkO9iOUGZ4Uv0De5WfpcfttuGpvtuq9EZPBfGIWZs7MAc9fZ23Cz3PDOcFzWFrZJHifbnh0OezYVuYClGcuZpZk3Os7BqI3JoDA7OmRIOULIUMTZyLYcc+V8K+IkQR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(8676002)(8936002)(38100700002)(2616005)(2906002)(5660300002)(36756003)(6666004)(6486002)(31696002)(966005)(86362001)(186003)(6506007)(6512007)(53546011)(26005)(478600001)(83380400001)(66946007)(66476007)(66556008)(4326008)(316002)(6916009)(82960400001)(41300700001)(54906003)(31686004)(522954003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmR4MWpwR3F3ZVFNSDIzdUNDUHZZRXV0dFlEUGRrZHB3U01lQzBBYlVhRUJt?=
 =?utf-8?B?NFNrbllQbTcyNFd1SHhNbUxNbEpISEFnbyt1YklYeVBUb0dsWXQwekMvelVt?=
 =?utf-8?B?TkFaT1ZSM2dkcXcrTTB5SlZHS2JnSWF6emh1VzdRZitOQnB6RVM4SCtiUngz?=
 =?utf-8?B?WGd3eXRoTWxOQXZNUHNkTUlGMDRSVVlhWGFhdHhyUkpIcVlUSlIvc1U3eW5a?=
 =?utf-8?B?MTVOVTVNbWhaZ0dqNXhwMFVPQjQ1d2lBcWZqaW9ra0FVR0ZoTjArcGlFd3B0?=
 =?utf-8?B?dXNlWUQvYkxkQ2JGei9qRFpKaTUreHdpcXBZd29LTzM1ck1tY1ZCaytyRVJV?=
 =?utf-8?B?cThZdDVrbnIva3cwUUUzSVFqYmpJWnhMOEdianBmRU9TTDFMRmZmbWIyWVFl?=
 =?utf-8?B?RFd3eEtrcEJPK05TNlBtQ1F6QlpZZDdBSHZmNlRnK2MzcWZYeWlkSDBMcGFm?=
 =?utf-8?B?NVREeUxURXkwaE9TcWE5ZEZ2cmlIeEh1Um5sb3RoWU1qL001Q0NLWHZmNC9K?=
 =?utf-8?B?bHVGdUk1LzlLTUgxcmFSN0l1cjMwS3N5OWFHMytOcVhNWGlTR2duVWxnWit1?=
 =?utf-8?B?SndHbEt0N2lxNUYvV2NGRDNralF0ZW1WNDJjLzJLNzhWajUyZzMrM3pwVzBX?=
 =?utf-8?B?bVNSWm00Q1VBWkp5aGtVV21Sd0RFangyYVNVWWFhN2NFMHVZR1FXL1pOUHZ4?=
 =?utf-8?B?L3c4UlU1N1EwV1ZlNDArZXJEaXZReWhMaTBDWHYyR1ZDT2pJRlhRUzJ6a24v?=
 =?utf-8?B?R1cvMTNZN3pXbmlzampIWWZWaksvVDdKUE5PTitTQ2lKNEd0R1lyS1RiUXdG?=
 =?utf-8?B?ejR1Mm9KdUFiN1NRUmx3M3k2SWdxWFV4UTlnYUJ2eExWRHMvMXZydTUwTWF1?=
 =?utf-8?B?cXhJMFVZVE5tdjFtL3VQdU5zU1JvbWR0d0V5R3hJbk5tZHlhbU9wSEV4R2Fq?=
 =?utf-8?B?dlV3QmtOcEQzYWRtSXJMZ2lwQTV4VDdLZVowRG5WMDltYytFcm1WN05PbEFx?=
 =?utf-8?B?SWpWRnFZb2k2YlN5YnlqUmFhRUpieGdNN25WZmN6Wk9ZcnBHOHhEdjJPOHA3?=
 =?utf-8?B?WXdOTjZySG15OTNrOGFIN2RiT1E5NjR3ZWRaT1FWeXFzQlpOSUFoVm1pQUdG?=
 =?utf-8?B?M3lndm9CTWsxNjdjRzVpbjIwV2tmYVE5dDcxRkl3TnQvdDgzR1RlRkZ0b1U1?=
 =?utf-8?B?MUZ1cXIxejlBRXk5b054dThqM3JPbTMzeWVkc0UvR3UzUHRxUkhLN1RXUHFH?=
 =?utf-8?B?Z3RJUXlEV0huc2lHallZOSsraEdpeDdsSWFISmFIeXU2SGUzdHlXRmxMWk9Q?=
 =?utf-8?B?Q3RMY2d5K0IvT3I0Tnh4WStoVXpKM2lFaTVvSnZuaTJwY3JVV3VXMDNqWkl6?=
 =?utf-8?B?dlBPZWdYUVhCUXNUY0NDZGhxTVJUK3hKelphakVuYmlYTjEzdW1VcmsrVHpI?=
 =?utf-8?B?YTIxNkZlTCs5ZnpodU9sVDFIU2JXNjBuUGtWWEp5ZTBrQTVOc1BoemVnTDhp?=
 =?utf-8?B?aTFUOHJxcFRMTUthTCswTXdQRi9vMjdsUjYzZGdMc3gyUUhQN3gzT2YzcUlF?=
 =?utf-8?B?MkIvTXlZQ3RhY0pHSDg2dmRaRmhrVXBCN2NVZzNkMGJUanRTM0pldFd3aHp1?=
 =?utf-8?B?QmxpeFkxNEkzZmtkL3BvNjFYb3ZCdFY5R0V6REZacWgyVURQZUY3ZEt1UFRa?=
 =?utf-8?B?eXdqZVFwTjlTSEtRUVBUZ3d3R0ppanQ4S0N6RDlKUnVLN2dPWkxlR0xJZTFH?=
 =?utf-8?B?QTlWUUhiUnFpN01TRVBBT0hqWVNBeFhybHJmUk9LNmVmKzYwWnBVaHN5ajdR?=
 =?utf-8?B?NlRyN1BRbGVVM3VLcUJkVXhkZm9WT2RWdjlZT0F1S3ZQVjFuQlo1UGdvQ2Rx?=
 =?utf-8?B?ZHI0TEc5Q0pkLzkxY3hvNkdHYnpOaXAwcDJsS3Q0N2NWeVk4NFhXeXc0UTkz?=
 =?utf-8?B?dEY4bkVrdG1zbWlaMWNwSDBxa01ndFFRZ2kxQVVHeXM2Mld6OVhwS2lEOVVw?=
 =?utf-8?B?T053bkQvWUozbnpncUFRdlY2V3h5b2dwU2ZqcUtXazRiNUZBNm5KVkFrMnh6?=
 =?utf-8?B?eDdPdGlmN3V4YzQwc1VsVFB1NDN3MFBWLzJvbTM0NzB1aDRyaXFnT0lPZ1Vx?=
 =?utf-8?B?Mld0eHlJWmdsOXRBQmdEakF6a1JEdEFnSnp0TERhTXM5bUJXQ3ZTbE1VYWNq?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CjVLNkKxt8Oep944JO+76T3WdY7ai4bFKdOVehovqTiFfOOfTlQ4gxSbsDYeEoO0m2Lv2So1tPz3fscIBMUPD+HW9VeSxy/Qehw1tbDvVBSei2ODK2z6sG6vZRq1TrTgJURk8zPQvQTI8DKVJxNvKMHTVQJRNZ8eGLyGxPeLWYOJpbTRqaJ9mjQ2gL6t2AZl8w0AOrX8qIP2V0NptLCiyU9vrS0kbhGvaYXs22mNd+tcAD0PtkOxjs4gLD1TgGV8pe0ACcb3moYRyUt5574N2qKRz3kIlnRDfGjnxUFXDzchUE2K7X6KUiV4eWWyfpZ6U5XT7OasZSxOosnrLimvCGuSB/ID0y5HnUAlgxICeHv+Qs2coSR7dNU03KgrKDJdsa0j5bzO6reyF9P4/I6tVyvlljHoHXr3xamTC4LwiHyY+rCY+bMHKEa9XxvB3h5EbuAL5vofo40yzbCaO6WRE22m0bIVusdywA5dgJQ+vh8St9i33q0D/EN5Z5u1xhGIrRs6kAkvnjG+BHQHC116dXquaTdFoXj1bprte86/a2Wk2YE1q9GSUma8E+CTyxX3nzvUhbQlABvfrshWHkFD/dDa4+GeUs5VcDG1xT7ft/wsP4wZ4ddONbXhjIlFEEnZcJ14tjL0x1/AVGptlMxk2JL3ZudLe43zEwTjzrHu/MAOexFBXjlQRvxESsKcHD92+RGh0WQ5/CufxiAlfoZAvKd/1oSmneBqUp+9AUw15TeYg/lg1KfCmoKGV58P0Asgy2+mnDXBRWBIMvL5VP1DcySt+OK+qGWMvQIbP9PaNntR4sZfAs2VQ05sWV4l8zSj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85493ae-7f5d-433f-4874-08db51930696
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 20:13:31.9125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2k4VibIfwNR+Q0L3l1uPPl5cfUgr+Fw9HthzonIH8l85seMsXTDYAz0k7ZOWCsbFomVUCv+3tB2xs8KN2NX2HsOLW8BP0WpkOcmttANFMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5355

On 09/05/2023 3:24 pm, Jan Beulich wrote:
> On 09.05.2023 16:03, Andrew Cooper wrote:
>> On 08/05/2023 8:45 am, Jan Beulich wrote:
>>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>>> When adding new words to a featureset, there is a reasonable amount of
>>>> boilerplate and it is preforable to split the addition into multiple patches.
>>>>
>>>> GCC 12 spotted a real (transient) error which occurs when splitting additions
>>>> like this.  Right now, FEATURESET_NR_ENTRIES is dynamically generated from the
>>>> highest numeric XEN_CPUFEATURE() value, and can be less than what the
>>>> FEATURESET_* constants suggest the length of a featureset bitmap ought to be.
>>>>
>>>> This causes the policy <-> featureset converters to genuinely access
>>>> out-of-bounds on the featureset array.
>>>>
>>>> Rework X86_NR_FEAT to be related to FEATURESET_* alone, allowing it
>>>> specifically to grow larger than FEATURESET_NR_ENTRIES.
>>>>
>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> While, like you, I could live with the previous patch even if I don't
>>> particularly like it, I'm not convinced of the route you take here.
>> It's the route you tentatively agreed to in
>> https://lore.kernel.org/xen-devel/a282c338-98ab-6c3f-314b-267a5a82bad1@suse.com/
> Right. Yet I deliberately said "may be the best" there, as something
> better might turn up. And getting the two numbers to always agree, as
> suggested, might end up being better.

Then don't write "yes" if what you actually mean is "I'd prefer a
different option if possible", which is a "no".

I cannot read your mind, and we both know I do not have time to waste on
this task.

And now I have to go and spend yet more time doing it differently.

~Andrew

