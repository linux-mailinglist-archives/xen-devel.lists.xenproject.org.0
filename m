Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F751433737
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213233.371401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpIa-0002CW-Kh; Tue, 19 Oct 2021 13:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213233.371401; Tue, 19 Oct 2021 13:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcpIa-00029e-FS; Tue, 19 Oct 2021 13:37:00 +0000
Received: by outflank-mailman (input) for mailman id 213233;
 Tue, 19 Oct 2021 13:36:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcpIZ-00029Y-LK
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:36:59 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0eb0245-30e1-11ec-8313-12813bfff9fa;
 Tue, 19 Oct 2021 13:36:58 +0000 (UTC)
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
X-Inumbo-ID: a0eb0245-30e1-11ec-8313-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634650618;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cmK0qXktDwMwa0W/FD8snUNWKc1YfTymtFI8VqusDSQ=;
  b=IOaVjbUfXY0kP9D4TVHKP6V6JV1MWkLyy6i/QGnbsCSb0QzT8m8HIOfF
   S3B92qXfR46PG7EPf276JKUlJxRLh50o/xnHdjfS6kusGrjnbS0stnHLg
   irfBOWkncmSYOhERTTJhMx/v8+YUgq8CCw1p4ljiFBvp7l1VQ/FOKYiKN
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iubRhWCFGQinj0SChZ/HK6Dssrt5/Q4i5GUy9qaXjrX955Tg7Tobt+TFTTRzLw/MpT0QgdiYq2
 GQ2qTYrIWSN6/A24HUSnRyLsf6IxQGsYPlfXkp6aks0jJrJX35YIXpUwL3PP3Djy1CByXQ9tH8
 JA2s8fcqqNH8F25Q3jM4MGqKhNfTABowesNoLNZJjt2L6cR8UfWLh7tqgjdt7hPUx0CvYJQqAs
 HdHYK7sc6Q2Y/uwq5r+Dl9Ym1OLskn7iL8uKZNvRtSjJrzuvoCEOsgyUB0fUqT3Dv6Rdec6Ro2
 2rFqgtYmOdsZm0Te7RCwFlA9
X-SBRS: 5.1
X-MesageID: 55098273
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1kWuCqjRN6zbSXlIy2r1jmlNX161tBcKZh0ujC45NGQN5FlHY01je
 htvUW+COPqMZmT8LY9ya97g8RsPu5HdxtRkSlRr/i5gEygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Yx0IDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1JsqK5GAULA5Tc29QQXT9VLWZ6LaFZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t25gfTayBP
 KL1bxJONhDcPB9NP25QDZ0MxOm5v0PAdgRh/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnnyn2RYYTH72Q7eNxjRuYwWl7NfENfQLl+7/j0Bf4Ao8Bb
 RxPksYzkUQs3EiscNCsXT+FmW7HjhMSfdduVOkq5B7Yn8I4/D2lLmQDSzdAbvkvu8k3WSEm2
 ze1oj/5OdB8mObKESzFp994uRv3YHJPdTZTOkfoWCNcu4G7yLzfmC4jWTqK/ESdtdbyBS3ri
 w6DqCwzlt3/ZuZaiv3lozgrb9+qz6UlrzLZBC2LAQpJDSsjPeZJgrBED3CBvZ6sy67CFjG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qW/xpi75I9gKvmguTKuMDiriUWW5C
 KM0kVgJjKK/wVPwNfMnC25PI5VCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4YGZpXbm0sFDoUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3gr
 hlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:1iVk5apSNcsAjqDKjmDfeb4aV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFniJvVmGZ6VP91xM/dfPFa9Ny4kAFjiUmgPK5t3Tk4li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.87,163,1631592000"; 
   d="scan'208";a="55098273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdsSVBoS5wso/T9dNKVLyFbBynpbHwZPMF1VBtY8wP9g7jTHPBJNEwu4d3UNt8vV4Ru+NCxcdxynUkm5X8/uHsk//RUPu4Doh42Lhm/0ccP4sgk2pa8bcltmaIBsWfXt6klbTd1DOseEu151DPeLIkyb+JbR/ie/DbBoE2S0RVDljGL0f2oc7V+hIbFBEQ4JOupzQQ9ZK4a814y6YFrxtNSKQRXRwtEw3PTrLypJpJl++XhRnaQl/Bc4rVK/2Xe+LVLegv0lc1p+7zWs23SiL35AX5qflgaaijDDlk5u8UVJ4lhuapqahTsm3IS4NKT0OPAUKsqMgYD4VfFsVzGfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shBDUF1Q0fRE3w3kAyOSmzIwuNo/dbJ/o4qvHIkdAdM=;
 b=YYjA/gykpjRdE7CVshHWJ0BW/NBTjIxJMcAfYSy+pxuTqIw/fD+CgW52vbw9/7sdyYSWfANL3RH8/+DwGUFzbAQ+ywMEVJ3jY2Kyo2TZMXkl00ayUvAqimMxVNngHYfvXbKATIlchtjaRoYII16MA9XZwZGH5CIEpHzgx8UDbfJxbnPtwU1cgAT6A4LIoAHMtUFOeaA9xuC06NFRWYfC90uxUau67+6fTpqNUl60DvdF+NsM9l3q0zqOBMRb7JQz5esWE2rvz05aciEIxoOoZw0qdFTJyWOWjdIQn8w638T+EkY/GKEsIabnKad7jGdn7QZNNgoFvLgcrPG7K9sd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shBDUF1Q0fRE3w3kAyOSmzIwuNo/dbJ/o4qvHIkdAdM=;
 b=ltpVPc5+/lBlU3GPB8IuSZC97cSTBCGBA27Vqglg1qy7AJusam1gYoiHDx+3P7oMssWQ4iBzIjKBW7k+2df3ttCFnQbPc2HJm7y7mmDWhjsT/Nql9omQLDUgVfjk32ULNLje2UdIqIMqRHg6/hOAp4JWK2YJPGjXzsii1/6SCXA=
Date: Tue, 19 Oct 2021 15:36:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
Message-ID: <YW7J6L4sAeFl74Az@MacBook-Air-de-Roger.local>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
 <YW6g9w9XeWKsxYMV@MacBook-Air-de-Roger.local>
 <9e444a8b-58e9-ea37-0e22-474e430be5e5@suse.com>
 <YW7BSjF3DD0jl74r@MacBook-Air-de-Roger.local>
 <787987c6-2fc1-1bae-f9f9-f1c806de1044@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <787987c6-2fc1-1bae-f9f9-f1c806de1044@suse.com>
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cadb10c-bb85-4f39-5e4c-08d993057e7f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB532128EAABC6B9DA9615D9178FBD9@DM6PR03MB5321.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cl1gQU+Gsulkfm4AfCBWWFNvg0LeqNBdL7/HX2wyYMkQTdB+LTU/MS03/VmAKBJ+kkolM3sOFVAkQV6AzJqdcydXblkDYflczZK5Tv7jbuZUYb5TINFeVahsSHoTma/BmbIr/KulYWO2wMp8ZrdZa5kceDCuxuJFXvABpAvW78fPhPZtvXq8rB9ayRtVA9V/jT6cSZ/x6mTb56oGXTMjnfeLgVKVrw8p/BTGcGiMPM352WXU7JtqJXoCSLo39ugleWujuA6T5gtXlVwyxg8oefsKxMvtdsHxwTUrWbsnNHPHeIoNXuIFEknjCl7+6cOe835vMw42+Plk6p61CoadljWwKOdsQ28zafgKzUsODXTNp+Yux6m8Ociz6GtL2Nad4nm+wVaYRduKyNq64n58/3iWV1Co+A8FPHzja/lXCrlAGN/Lm5uqevQsnIfv8PwLvojOB8xLJL6b5uLcdT6HVrFp9TDV7KdvrVRR5WiUNedkxm0EoRUu+JWiZ0ger1M1YoUaGfXx3ajjbvhJ1uMhH+efg6RhGtQkJQFe1ERGH6+wSJnQaPJQi7vbF7maDR4T7yey0+HmHn7nqGT1BILUPSAqR7yR7IIxYBP6RBL5xtsrGMbL0BZi96W6NWC0Kossx/CckDC58EQUFEWkLe/dPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8936002)(6496006)(85182001)(6486002)(8676002)(86362001)(186003)(53546011)(83380400001)(6916009)(316002)(5660300002)(4326008)(508600001)(956004)(2906002)(38100700002)(54906003)(107886003)(6666004)(66946007)(66476007)(82960400001)(66556008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEhRNDQyVCtQSkpaditkUmdsYk9CMmRDeVRlZVAza0lHQ3lSa2tnaDE2SHFD?=
 =?utf-8?B?V0NSTks1ckpjRU51MUZhUHcvR1ppODVFNWVYTXUzS1BYa3BmeHprdkJqbGhD?=
 =?utf-8?B?YkUramMvcHFnMklOZ3prT2pvVGxQcVRyVXkxTVBpTSthTFEvQU55ZFFLY1Js?=
 =?utf-8?B?ZnlVKzNFSE90Qm5ENGxyNnREUU5Sd3krSmJMNW9mbVR0d09FQjNuT0xmY2g1?=
 =?utf-8?B?aS9zWm1Wc1BjN2RzeUVLVm42WmxoM0V6TWkzdFgyNURqbmhreWtPOWpSOGpn?=
 =?utf-8?B?aTgzS3hBaitQdlNqWE5tNkFiaFZTYXRQSERwY0xmL3NxSXVDeDkvdGd5V0s4?=
 =?utf-8?B?WWtPNG82TGc4blpnRkhneFJ1Sm1qRHYwMCtvRi9QdWZSeXFOaWdKOGc5V2tT?=
 =?utf-8?B?bWtVUTNVTWNxV2tQK2xGZmo2UlAvVDlNRlJ1UlB5UVpVejYza1NjdDhjVEEv?=
 =?utf-8?B?K0tHU0VBWUZEbTZvbDVvZlZEOEdwSWUzYTdieHZtZm1WZ3RQamRUejB1L3pk?=
 =?utf-8?B?ZytWQzZuV0R0MnA5YWs2a1dvNURObzJ1RURvbElwUlB5TC9zTU1KVGIwWnJI?=
 =?utf-8?B?dDZKVit0N1hVY3Q5WUN4bUV2UW8zeGRGYUFabmhSbnhneHFYeTUvbEZMcUY1?=
 =?utf-8?B?dlJvYnFnQmN0b3IzWjlWVVBUYTRjeTh4N0dYK1lnZ20zUWVGajZJek1ianlL?=
 =?utf-8?B?TU1KcDhkWHZ0QU4wSm9NMm96d1BBcURKTy85R0xpTDZjam5MT2FtQ2R2Q0lR?=
 =?utf-8?B?QmhXVDdYTitkYjBFZE1qb2ljZU8wdFcvNFlhTDVuZzBNcnN2WGowOERSc2JV?=
 =?utf-8?B?S08yMm1DZjdZNFVzdEVGQWQwOFFndkM5NlplK25XOHBGcWhqOVBVOEVhQjkr?=
 =?utf-8?B?aGkyOWMwT2RORmN3RFhWOGdaV1IrazBEZWlIU2R2NWtmbUZLV0ViTnVzeGhN?=
 =?utf-8?B?Z094aG1nSGZENjFDTFNodEowOTFMNG5vWEhCaGNGbHdVeXcwbVlOL2ovMGN1?=
 =?utf-8?B?MnZZbVU4ZExINmR3WVBkRVdrd2ZPdjRkd2VyVDl6eURCRTAvekNPOTJralhZ?=
 =?utf-8?B?K1dQWmFWblNxZUxQb3BKTW9ndXRseW83dzE3cFczKzFSRVlGa3YybW84RElt?=
 =?utf-8?B?cXNEYzl6Tm1NYTVZQVVxQmRyZFFlWVNaWkpuVEprUXBSejdWcm9rV1RUYjY4?=
 =?utf-8?B?b1lBRjMyVStuaWNnVVN1LzJoWFhQdXphaE5OeG1ZOGxNV0pIMWdmQ01laEd0?=
 =?utf-8?B?UzNveFVWd2NEZGkrZldPRlVQd3ZuMWtOTjBUYk5wR1A1bEdYdmsrM2t0VDln?=
 =?utf-8?B?cUdVQXJ0RUFyUXM1bVdlWW9JVG5rbWt5a09QMFhrRFB4QkxoeUcyUHhldTdx?=
 =?utf-8?B?N003ZmVNekE2VmhLQm9zUi9XcE9RU05lOEkxYWtNM2JJWHAwMjByaVoyZ1o5?=
 =?utf-8?B?c2tJZVFnSzFCZkx2WjVvcFdLaGNFYkdsM3JMQnA5S1VUbUw0MmtMaTgxbkdW?=
 =?utf-8?B?NVB4dUh1TGhIdzVKdVBOYXkzUlRreXEvMnFXT0F6NXQyNmREeUNsNHZkUGVu?=
 =?utf-8?B?bU1mT3MwNDVUb3JoTGdVL01MVDZqbWl0UG8yUWFCall3dXlGa0FubHZmWjhE?=
 =?utf-8?B?KzNIamEzalhLSVlYTmRLQzdld1A4UDI2SU9UaTFnaHMvSUZ0dlp2b2ZEOUVa?=
 =?utf-8?B?cythTmpKdDhlZ0lMRWowc2JxQUNFdTYvaGRBRldJREJ2dEx2VnVZNG45VEFn?=
 =?utf-8?Q?1g1UjMU2DgGZAk8BSVHEI6uvraLMK0+nNmn4oye?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cadb10c-bb85-4f39-5e4c-08d993057e7f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:36:45.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo7wgEA7dh1gJyjCp8FURl0fZjkkwq40p3aVz/j9pIgk60dAFI/5JhcUKzzqAXX4wNHEwd/vcbc9D1KndgvKxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5321
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 03:14:25PM +0200, Jan Beulich wrote:
> On 19.10.2021 14:59, Roger Pau Monné wrote:
> > On Tue, Oct 19, 2021 at 01:58:38PM +0200, Jan Beulich wrote:
> >> On 19.10.2021 12:41, Roger Pau Monné wrote:
> >>> On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
> >>>> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
> >>>> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
> >>>> order violation when the PoD lock is held around it. Hence such flushing
> >>>> needs to be deferred. Steal the approach from p2m_change_type_range().
> >>>>
> >>>> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
> >>>> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.
> >>>
> >>> I'm slightly worried by this path because it doesn't seem to
> >>> acknowledge defer_nested_flush.
> >>
> >> Oh, yes. Iirc I did look at that logic, write down the remark, and
> >> then forgot to add the conditional to ept_sync_domain_prepare().
> >> The interactions with the real (host) flush are kind of ugly there,
> >> though - we then further depend on the ->defer_flush / ->need_flush
> >> logic, which is EPT-only. But I think I've convinced myself that
> >> this ought to work out.
> >>
> >>> Maybe the flag should be checked by
> >>> p2m_flush_nestedp2m instead of leaving it to the callers?
> >>
> >> I'm not sure this would be a good idea, as there are more callers.
> > 
> > We should maybe add an ASSERT to p2m_flush_nestedp2m to make sure it's
> > not called with defer_nested_flush being set then, or else it's
> > possible for new callers of p2m_flush_nestedp2m to forget checking
> > defer_nested_flush.
> 
> I'm afraid we can't do that, or at least not this easily: The flag
> assumes the p2m lock to be held when it gets set. Hence callers not
> holding the lock (hvm_set_efer(), nvmx_handle_invept()) may trigger
> such an assert just because another CPU set the flag.

Hm, indeed. Forcing those to take the p2m lock might be too much
overhead for the sake of correctness.

Thanks, Roger.

