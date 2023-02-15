Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64FF697C00
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495962.766433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSH62-0004e4-4m; Wed, 15 Feb 2023 12:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495962.766433; Wed, 15 Feb 2023 12:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSH62-0004cN-0x; Wed, 15 Feb 2023 12:41:14 +0000
Received: by outflank-mailman (input) for mailman id 495962;
 Wed, 15 Feb 2023 12:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSH60-0004cF-N0
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:41:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 061e2bda-ad2e-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 13:41:11 +0100 (CET)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 07:41:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6198.namprd03.prod.outlook.com (2603:10b6:208:31e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:41:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 12:41:06 +0000
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
X-Inumbo-ID: 061e2bda-ad2e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676464871;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sI8jbEICeYZu6GOkVGfYajbZ9IXXv9xrMwh9gy8nhtQ=;
  b=MwfxXTIErI0cVClt69qD6+oUzjeLG4apEF2Rk//s16OkO1MAykhFJw1T
   NNeb1oAvl/wf+bYDzvMQWUUVxJvPMdfIZfhHnn0OIbXVDwvSKANyJwYDw
   2VIsZc3F4lfKyXzSNHGUR899us5crOMAlA0vr28AGE/ajjOSUgdQvAiX0
   8=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 99554478
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RodK/6wyC0TEctUN6nR6t+cAxyrEfRIJ4+MujC+fZmUNrF6WrkVVm
 mNODT+FOvyPMWL3KNt1aIyyoEwEv5GGzYNqSVBoriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPK0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxc5
 eU4JWAGUh+Sl/zn8Y+3a9JXqst2eaEHPKtH0p1h5RfwKK58BLrlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjGVkFMZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKqBd9OSOLonhJsqGeX6UBNNCY/b1WQi76YgBGkYtBCL
 mVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQtvdU6QjEC3
 VaTk9TkQzdotdW9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHeTJobixvOSpNpFvezh9itQzXom
 WjW8245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 hDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:iBgh6as/I7v4xOY/LQDAhyEA7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="99554478"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaMXQEY2tPsYf0jNqFfIAbZAUR72Ty9D8ZBDbFPT+TXHNhG71cPP6Z8d/0JDxBJCvgUWyCZkIVnCVtEGmkW/D0PJ2kDIgKr4EvQtHqt4wnugKwMTcCiWmiCSU+gbgn4p32iTdpnF+yxAR5+bRCdLaWmF2R5oXJv99swm9uvikAaQH00JWkMhCZlrp2SEEYH291amYlv08AYofr567Hb+FNVqCFXzMdvc6l5gKNfggvVTA5bX6IAvNACXif6mhJefwt3sR+fFyLwLA2FAP53a2dN8oL3oH5B3nIp81SkVKL6X9qKzgl2/07hlqe8YP/i4qznfupqE0jZslnetm50n0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0BBgB+kCf7A2fKZRpLq7fGvnhr0SlfSLUYirAnAG8I=;
 b=CP/L/f3/oAVwIXcv8f5Dsds6LVwhucSALiJir/h5Oy/hyN365zF+6qhZh+rNXe/AdrXpRxThv8UvW6oFXuEiSqk9Wu2o6Exx7QSk6TU2UYN5YyErGAYl4+vtQnzmv1x/2a2QRxTyPUVLf+hgpKsx2T297XrbfiBNbmtgiugy1djamJqKrzSEcTx3m3hIAxF/Yl6IlVPC1H/UNy16qnesgX44BuJIUb7LYJbzs/AYmBBGuMTlGYLpcjywxI1d6Ru2tVzmy2L5s76KAty6mVwtp8TzvysavG7fqtueJ5Vc1Qh4mSVsaty6c2tK1fIOPwla6xsn/lQVM5UoJEE4n1izVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0BBgB+kCf7A2fKZRpLq7fGvnhr0SlfSLUYirAnAG8I=;
 b=XSOqRNXMzb2rT4jVPeLr+Ja5TMMIARUjTC2kzEtws+DwaCS1kFiQtAb9r+tK+yyqpC8Fv1Rd6tQOn5Iesw2GEZFkAwejvc/1gzq9xHEC+jBFTzb0hZD6DfgYcW+3n0baPdcE2FGFwVHTHqihFpEi2oulk9sbWFh8E0JUdnY7QhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3caee35d-3c0d-7e28-dc66-6f422568edad@citrix.com>
Date: Wed, 15 Feb 2023 12:41:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH 3/4] automation: Remove expired root certificates used
 to be used by let's encrypt
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-4-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230215120208.35807-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6a826a-c229-4eab-b961-08db0f51e82f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0eqSagM6wGqo8udkK/qtnlWsS5zSNk8kWqkU8ap3AMK1c0AgvP3yUHjzzg8TwJ0gggDrLnrj1VV7BvPL/ZaQuSfxV1fAGnEu1kOTEWvUR7jAFrLfqjmD1B3nRfZLLb8qsWu4MgnNgrVl2esLsUgOADbvm5xWYQuKwicoqz7+otnceStv+fKVqcmvQ8uLEbcK02UbslXTPuePm9som17JIW5SnZwjm1ijspjSehwf5doeu1VSL8vyE73xDIfMJ1L01YLQYPjOGptGM0rsQ5bXKriA+yOJJh8cz5QyZzwyz9yZcjV+9/sZRdX92PzoXp+/N4Ljj0KhEtNllB9nC6PsHzPco+adQJVMh3aXdCsMOjijaU0KfPWsDGZL+R1OXeuKTPRPVhNKakYvrkjY7KEHB0gspmiksZSkIU2StbiSCQdBjjHr9Ema9GNVWErjbDrxhCYSpQuTEsQFJ190EOUht+z7o2gbYoh2ZMdOi1uCGpnDASC9nTL4gJEFALIshku6kuDfwUr24Ls9FmqNQnFfJtTbpampwPCYP6Ufva/q5qiSi94/EB++u7hbiQYzz2X/ZVrDCb5JhTp5Vj6eNB75o2d8HHe/bU2mWebuPacL8TyzNGiHv4Uvcn2XIioi5v9uhmWLaBeHROOJhk0fyTNUzvjhdAQ0ro8pP1T/tbLchHIfV5X87/Fy8Z7jaXZsyMNep8xdv4BVxU6Du6KLPBypJaZqcZkQVFkLFtc+XnqUOjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(6666004)(6486002)(53546011)(6506007)(83380400001)(6512007)(478600001)(2616005)(31686004)(316002)(4326008)(8676002)(38100700002)(41300700001)(5660300002)(8936002)(66476007)(66556008)(66946007)(2906002)(82960400001)(36756003)(31696002)(26005)(186003)(86362001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkM0Vk9mdGMxZmtXUGd3enRPQm9KQXRvZXdCUnF2TTB2eGo4bUxRQXpPZkU1?=
 =?utf-8?B?cGNDbzBNYlFFMUZKZjlZa21NR0h4bnd1NVNFNFdQeHVNVkpSVkJJYzdKTEdv?=
 =?utf-8?B?UGlDNGl0US84MEF6ek4zdVZNUEZwK25OOEgyWEFReHJ1ZEoveHVBaEcrd2dW?=
 =?utf-8?B?VWtDQXF3VGJZeVA4UmNFTzFhQXNHbkk0VzJwVkZIZlhoMENhZjRRVlhobFIy?=
 =?utf-8?B?R1ErOWoxN1oyNDBXb3BhOUxCL2RwRWczZGYzOGRLb2k3bnBoREl0THBhQUFp?=
 =?utf-8?B?U1Z6dUJSamdaM3F1RFcrWjZFRXVMK2tKVUlBUXh4NEtoVnZUZExvQjF0dE1n?=
 =?utf-8?B?cVhNaHVuYlduMmRyZHROWXI5ZXU4NGt5eGFVdCtSbEh2TzhZOVhtWmlJQ2JN?=
 =?utf-8?B?VG44bzc1QXZtSXRaRk5vSFpMdXliQmoxZDJLVFhqTEhqMFRpS3JicDRTNEdv?=
 =?utf-8?B?Mk5qOHkzWTRHNWlINURtK2FvcEJEOEt6eWphMVkxMXh0eFpKM1FFY2x2Q0t1?=
 =?utf-8?B?RUlGZWQ3U3k3bDhmVGl0NjZpUUtIc3FLZ29zUGdtbjBCTnpVRjFxME9Vc2tW?=
 =?utf-8?B?cjdHa2h4UGNXeUI5V2lmcWRidEEvT0JiL1A4aXZieGtSUDFpM1Z1NEljSkpt?=
 =?utf-8?B?TzU2ckF3MDV5VXNzV3VWQml6R1U3NmxTWVdneWZGZGRmZGdrdXR2cytRSHhy?=
 =?utf-8?B?K2tMaHZxazFsVHN0MWx0OTJiV3BNT3o5bHJGbk91Q3JaelFUQmxxTCtjZEF5?=
 =?utf-8?B?MGVEeks2OXZ2TGZqTXAveEhSdlRWMWJNSFg3Y2pKa3V5TmdCSVBqaW5qQlhH?=
 =?utf-8?B?UzZzaFhtTWJFRzlLYkdKUVA1OXdDZkwxbFE5MEZzS3B4bjFGMUxvc082a0Iz?=
 =?utf-8?B?cUxUN3p5V0xlc2FvZU0wREZlejZRa1FjR3lFYjRzS2xySSswT3FjUWdTWTlz?=
 =?utf-8?B?WnFQTDZyUDhjSjN4WkhBWTk5Q3UxVEJnR3RYS0VSb3l5STMzamlyeVpQQ21F?=
 =?utf-8?B?eVdZYnJBNnNBcFBuM3FCakpNTThsS1IyWFpIc0hBZTQ2UFRMWkozbWd1UzBB?=
 =?utf-8?B?NHp6aXBOYUxMaXg0OWF1MDJ6MVlLM0NaRUc0Um5jcDdEUHZlTzdOcGE3N1hu?=
 =?utf-8?B?VHgwZUxlcVgyYUZwRkNuTmtscmI5SHdhWGxhYlZZbXM5TWVMUG9OOUwzYjI1?=
 =?utf-8?B?MmI0NXNPY0RoczVnK2pTNHFBSHIzSmluVnRXUEZuaDRScjRyMjVBazRzR2lF?=
 =?utf-8?B?YVdZQTNjRGFUUUQ1dnBSUjJpUm93UEhmeEhxZkJ5ZWtQSHk1ZGF0ZS9mNE5E?=
 =?utf-8?B?SHQzQVhwaU5pUFpCcmg1a3hCRXdhV20vRUV1NzNxRFlISFkveUlEajBRWWww?=
 =?utf-8?B?aktqSEE3NWFtV1Y2aGJVdFlnOGhRRUhidSsvWDViakd5b1EwMVROWEZRbG5L?=
 =?utf-8?B?cE1nZFFZVTRUcERuVWFrczlFTTMzMWRUR0ZINkFKUW9PMVJWQ2lLQjNUSDR0?=
 =?utf-8?B?Nm5jeFdKUXcwR1FXajZqKzNDVUJKL3RCSTEzQzN6WWpIbGIrbDFtc1YwNlN6?=
 =?utf-8?B?NXF0Mk5zaWRYSWdFUEYwVXAxQ1UvUmFKSEVUbkcwalBwbU1ueWJCNjZNRnhs?=
 =?utf-8?B?VDcvYmFva1ErMlBTT1hHakNLdFNMSTdtaDZEVnMvQWxGQUZWdHdRYms1WVl5?=
 =?utf-8?B?aHo1N0MrWUVITDBQUW9naUJkTE9xY1pmcXFtVnVjZDZGNHRXZWkvbDJFV0Q1?=
 =?utf-8?B?b0NESlljRFE4cWdQZUNtakxhd2x3emtsSkJrMzZoaHV1Qmt6WnB2bk5ERDdU?=
 =?utf-8?B?L1BtYU84VU85cGo2ZmxyN0RGdTJuKzFzRThIYUlEbGxoMmh1TG91b1AvWGN0?=
 =?utf-8?B?VTlBZWdKZ0NxTytmS2MrVUI2QVlXc2hIejlUNlhidGR5Y1BseG10b1ZkZ1pN?=
 =?utf-8?B?bWFTUTE5VzJxWWlTTmp2bUltdENJWjhUTGZUNzZuWCtuUm1INkQrOG9wZ0JU?=
 =?utf-8?B?a3creTFxNVhBSk5WWC84cFRxRi9mRDJEOW96MndEeGpQWVRoVjlqZDNxMU9G?=
 =?utf-8?B?dFB2ZWN4dGNRdGNTSGp4aW5FejdNSkc3NGIwWW9RR3dDYkYvRDdScm1xSGVQ?=
 =?utf-8?B?eHhnRnFDc2V4Yk1iTjM2dHNUMGhtOGVmb2NkTDVhSXVyY2V5SjZ6WXVxNzAy?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TkgiAG+TnV28YRFstmN9ECKMMQDr85K1DTl0Nt8XnAkDybV8cUhp53EkqE+hC2bwpa7/CSiSUqFnDNAMGUzda/T3DKXKr3O6tOkuFGj8pw5ZIQsRxwC22I9629Z3/pLkoVHDsQwhU9E2PvECxBuYh5KoPImO4Z1pyIU90YcFe/sNSEHTANRLYlMiDRoUrCNalBHIAjOdBNW40zuH6bGZhS39jM1QNVXjcskHVV/MNO3rZBidLf7nn9nid7bSbXhEapcLml4/BCdgloiINBe5I+iMMrmwrVqjlp3XYBqiWKf5eiUa5kwioFBiPb69NaoWzzSWw2oF8hG4yyfEsbPZcnUpEE1r/20jfH9opLccSWJbNW52DmCpI+aoNRI527PPeMhOA2bqxca+v9mL4L3a78xLNrmB8ts0lzPxFSfYktPM3B3/M9Q5sTE7qebidC8Z0eI+8u9srNiOd4GbuK93NKtMbzgK7ratRUI9OJ2DgZdefjfEx0uDM1+4uyFdsM1PJUF5jLTN4rEtk+suPKM5aHXRbmruWftR7dnB/3MBvD/EeU6PlEMzkZ1qaupege4dcTcA3Ba/LZYOC4v2nqIp+g6+KEjC0UHD6pm9WxsdXwgLSYV4z1GZdVwf95zNppUgBxOPdxDW/mv9tcEY9+lViftpSuSwblJ0kHe33sWt8Othirh8K52lwlHYK4xa50Gjo4BeGhOHEYyMqnqL8raCFUcmjQWjI6EfyLoyb4GLQxCN9tq/NuEV0MpiRvyij/tIsyumGTLg08uaYOY4BXJ07iCef4ejIlboRoN9qKppSRCkxOfyhuKVixq80TVNmui7X4UvHZCX4uKTLdkz+9yaOA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6a826a-c229-4eab-b961-08db0f51e82f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:41:06.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hTgi/tTBMkBNhiiBvg2N2aCV2/mIoVUfG3HT2EyS8eiYbOuqGDOb5zeeMXA4qqEZrcrlca3dSFIx+HWK70fSjiBhaPhE90Qb/2pVJ90pok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6198

On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> While the Let's Encrypt root certificate ISRG_Root_X1.crt is already
> present, openssl seems to still check for the root certificate
> DST_Root_CA_X3.crt which has expired. This prevent https connections.
>
> Removing DST_Root_CA_X3 fix the issue.
>
> centos: found the filter by looking for "DST Root" in `trust list`.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  automation/build/centos/7.2.dockerfile         | 5 +++++
>  automation/build/centos/7.dockerfile           | 5 +++++
>  automation/build/debian/jessie-i386.dockerfile | 5 +++++
>  automation/build/debian/jessie.dockerfile      | 5 +++++
>  automation/build/ubuntu/trusty.dockerfile      | 5 +++++
>  5 files changed, 25 insertions(+)
>
> diff --git a/automation/build/centos/7.2.dockerfile b/automation/build/centos/7.2.dockerfile
> index 4baa097e31..27244fd002 100644
> --- a/automation/build/centos/7.2.dockerfile
> +++ b/automation/build/centos/7.2.dockerfile
> @@ -50,3 +50,8 @@ RUN rpm --rebuilddb && \
>          bzip2 \
>          nasm \
>      && yum clean all
> +
> +# Remove expired certificate that Let's Encrypt certificates used to relie on.

rely.

And really (to all of these modifications)?  This seems outragously
hacky to be deploying into production...

Honestly, I think I'd prefer to drop all of these legacy versions...

~Andrew

