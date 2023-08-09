Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B523A776A08
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581326.909973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpp2-00066s-Ny; Wed, 09 Aug 2023 20:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581326.909973; Wed, 09 Aug 2023 20:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpp2-00064L-LC; Wed, 09 Aug 2023 20:30:24 +0000
Received: by outflank-mailman (input) for mailman id 581326;
 Wed, 09 Aug 2023 20:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkWR=D2=citrix.com=prvs=578b5fa55=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTpp1-00064F-CS
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:30:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e5e6409-36f3-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 22:30:20 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2023 16:30:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5006.namprd03.prod.outlook.com (2603:10b6:208:1a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 20:30:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 20:30:02 +0000
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
X-Inumbo-ID: 8e5e6409-36f3-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691613020;
  h=message-id:date:to:from:subject:cc:
   content-transfer-encoding:mime-version;
  bh=xEt8omjjwLTnL1JJwmidvyJpcJrZfGvSCisXkJKiNmE=;
  b=Pqz8bLeQ31Q766dpBlhcJdCO3wAXbc5iD9XkCLvskFTEbsR3HUMtQi+2
   ShgP7pmygRxENF50l9iTYNaVUgKudqF40ubosSWiWD6VijqsTMrt43SAO
   09Qqp4y5rpjNheFnCGfp1/zToVUfMiICSCphWfajAnSbsm49n/XnDb6HA
   c=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 117724301
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4kvJgqjDrj62gNOmmctihhJeX161TREKZh0ujC45NGQN5FlHY01je
 htvUDvTa/vZZmX8f9p/Poixp0JSsZWAm4JrGwI6rHhjRSkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AePzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQDFCktawGnqtvr0eydE8o1qoMlD5LSadZ3VnFIlVk1DN4AaLWbGeDmwIQd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluSxWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeLnrKIx2AT7Kmo7BQxKX2C3r8WAjHGlA9ltK
 0ZI+yU+lP1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebT4g2
 0KNntjpLSdyq7DTQnWYnp+LqRuiNC5TKnUNDRLoViMA6tjn5Y021RTGS445FLbv1oGpXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZcO51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:Llz5QK4Zva1kCEaAnQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3AVmNTdWo0CeFlnNVnONBXFdrmUdsZa13Y3VP9GhK?=
 =?us-ascii?q?pV0Awa+S5Dlmzo5oxxg=3D=3D?=
X-Talos-MUID: 9a23:zEK7/AU6TjCLE3Pq/DL92DtZOMlU2qKRExgGo5UM58iLJRUlbg==
X-IronPort-AV: E=Sophos;i="6.01,160,1684814400"; 
   d="scan'208";a="117724301"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ7DqKcCxMbhNuY4JOU4MRtGh0wmOz3IpHWbSPqqMbZc1DhOqK863WOkzDHoslJlQxEphHi3pwUx5DTKNreLkdawNXNqr0jhs2geUBP2ZzNikAujBaximvzTNgnK6MYJl3z80Y9xWBWMdyC0EKR3G8NZtQmnJD/4UDUZaSjDxLPbziZYo58MixPu15FHxrl9DhyQPi9ghJZ79y3nq0ckX8CgZB/vOrXNFhI+TsOmBlgqfP+b49D8dtBQVSucGBH3W4Wk47p9yC+tDNhLxFJ75tRx7vb+OAhgaCFOTavPAgCwJbuUxoroTmZL37ouH0ej8/PSDeXYOgpbqbJ19G/QxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEt8omjjwLTnL1JJwmidvyJpcJrZfGvSCisXkJKiNmE=;
 b=JJDLNu8ch27kUEsDSePtZxMQEqpDvf35tYoYiyK3kuT8yM2B30kVOCOJVCZ2Rypbce/E50rIfn8j+GwkuWqo5PSW5fK29tTM12LHPSAvTKQknuQgQgbwfv3oV9qB8DigoHJOml+l76wJsyzzssdjWHLV0myVJpoKV7bdeqwJiBHtwKC9PkwdpVJnzgGB0Dxwo2TfqhDNAl//szDms7QeVsjg6agb+zad1X0NEyK0W5rh+/ANvUZy7Oi9pBXmjoUwiy+GnxeJdwbB9jvSeIN2ITIDNtepuQQTlIJGEowStCBIu/32kOFaRpO/mHcgg/6asfWbecpmRS3dgNDsJpkpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEt8omjjwLTnL1JJwmidvyJpcJrZfGvSCisXkJKiNmE=;
 b=cLSqZoHO85nZ6DD0iNTiPfQoJ24SiBg22mKtQdDFhXE6VZA64knS1+2bZRLOTwHSqD1FbDpCuJ0+UY+uDQfVFzhn4XFMOFabC+yt8abDNuBfVHrUtgsqDmmi4xch2QeH5z+84Vo6MXtMPXjKuwgyWtXlX72xGQk+5w8N6QDy+6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9072ddad-3f79-42fa-1e6f-352c9796ea52@citrix.com>
Date: Wed, 9 Aug 2023 21:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: x86: AMD Zen1 Div leakage
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0536.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 30426746-a810-4ebf-5c64-08db9917687d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/E37xjhQwpCe70mYDzw4afaaqpjwO3RmV6fIT4zH/kou58KjfdT6B9v13HXUMCZa8LIOp7G0li3nArNEI11h3haJEdxja+L6SJSK1rvSHHP7aeRfRC+Me0nDKqiFgZ3JkEvr8gqHNwmhwoe8dWUUPcjjo/ZhK95svsz1K8PeyILuEM4jC2+p0KnHkNQyiM1lMVND6UuM3F2KW/1qhU4vOzDXuQq/eig5FtqKAaoaNORb7ncryjYyZmPqN1HV2Uast58kTFCF3fKRd/DUN9OYEoWaqqPtIuSkJn08y/9/ATs1Z0D2BTXkdH2/Os7VhuXKbA9KMHMPlLolLnSni5u6FXEzb/Jz7oTy6oCh2k19tcNj17q8+wABTj/0vRnx8WIX5WqkLBn4T7uhtO3mYL6jSkA1tobQ/m5Koiba2c7qVpFdBeaoMXJ0f+v1wfHdBLGqXrbAebjaJOZGhVjeplRZMpLZQc6rpr97Ymtg93vD0HiVWwAHjusJfuiHNANuQoJB1BtBU888W8Non8BzB9GYbAf5nNnUzwprU5jINsU3HwYIptdzwsZ0cSMVR5byusQv1TU8YQyrgdd4ww/IE4Bvpx2wYzfKy2QYk4UV0eb5BUTysGdg0BvIi87Ckm0YNmudH8NZPi2N415rN+VDXOlFbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(1800799006)(451199021)(186006)(6486002)(54906003)(6666004)(31686004)(478600001)(316002)(66556008)(66946007)(66476007)(4326008)(6916009)(83380400001)(31696002)(6512007)(2906002)(966005)(38100700002)(41300700001)(5660300002)(8936002)(6506007)(2616005)(36756003)(8676002)(26005)(86362001)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rjg1U1NzbWdNem5EWHRwUXlUSDA1R3R1cHl4NlRkbncxQlBvL2czYUF3MDdR?=
 =?utf-8?B?Qm1yaTdrZGRDQm9CbVZEVVZ6Y1JLcVFBdzQrZGd5SWE3aUx5Y0p4MWlxSjFa?=
 =?utf-8?B?YXNRWDV2bi81b2tFRkNiemJJWmp6T3hscVZyZ0VMVEhTTVAraUtyZG9xbFJm?=
 =?utf-8?B?aHVKaUlSYlhRenNQMm4zL1pObFVYZU5OWks0cWoxZS9yclF0WXlHT3QxazVO?=
 =?utf-8?B?N3hhbElpanRQUmR6WW90VkE1aE41Mmt2c0RjY0RBR2tSUWRILzRORHozcXZQ?=
 =?utf-8?B?NytrOUdqMWZaRjVRZlg1cmlka1pmM1FGV2tYdGFVOVNYdlMyOFgxT3dIU2RF?=
 =?utf-8?B?WjFaRXhrSC9rTHlGeE95dVJxb0RSZHoxWnlrM25la3dxb2g3dUhUbDZYVUFQ?=
 =?utf-8?B?V01CMG5lZUZtV1JwNklsQmoyVWtaRjdkRUc3dXRTRFlJblVBZ2NKOXVuYmYx?=
 =?utf-8?B?cnZEQUI3MDlBQ2pUUUZhN3F2ZGM2VXdBVXlMa0orRGtxaS8vTS8xS3MveC9C?=
 =?utf-8?B?NWxyNHNIL3RqUVY5Ui9XcjhhUkxQeEx2UlcxWnE4WnF1NmJEbC9HelBjMWFV?=
 =?utf-8?B?MllTNUZKYjZFay8vNVZsSmIwNGsvaHJtQVQ0SUFNVFlZWVRhRk5EakgxRTd3?=
 =?utf-8?B?UkpZNUpzNFcranVudlZMWjFWQjFUY3ZGMElmNTdXZ2RpaW8yVXZFUmVJOHR0?=
 =?utf-8?B?UTNKQTlMMnJIV0hNU0FYN3l5Q0QySWVYb2hKZTh3aVA4SnpZN1kvaEE3Y2Jn?=
 =?utf-8?B?NFhiSW5CT3hwYWN3Qmdsa1JLTFJHNGcyWG9hN1RhSjRqU3hOM2cycTJKTTdC?=
 =?utf-8?B?QUZ6ajVlbTB1KzJ0NlNqaDR4V3FwUUxGUnBZSHRFb2hKYXB1ZFZONjZvREVG?=
 =?utf-8?B?ekFBc01xZ1BjWjZBRlFRMVZIVy9iUW5aRjlNa3doM0hCcXdidWtpY2ZZZ0Jj?=
 =?utf-8?B?ME9iM0k5ZVZramxoKzNZTjdEeCtrZHhhR2ZQNEgzdHdJcWhZV1ppaUlaTDlC?=
 =?utf-8?B?bDZabTdhenVqQmE3ODV6YzFVNU1LS3dMYmZTK2FkRnNKUUxQalpDaEFvWDNR?=
 =?utf-8?B?QnZGY0oxNmtVTXNhTEo1RmhPRGJFMlRENHJPN2hRU1YwVitueWxGRmhkUjhK?=
 =?utf-8?B?ZERhVExCK3dsakZoWHNXNnlNOHNzT3VSSmIwOW03b1dXRktGQ0x4Rm5ScWNQ?=
 =?utf-8?B?ZjhFU2VnOVN2UmJtTXNYTXBaVXNqVTVYV1pPV0VxSlIxTkFhekU5aDF6OGNE?=
 =?utf-8?B?NU83QXhNUEdWVVVrYURWdGpuelhLNVZIM2FvWHRwRmFHRERPQVRicC9rVVFB?=
 =?utf-8?B?SnRhMWxUUE84OW91bk5LeXdsK2xpYnIxWGlrVmlSeW9BVjFPNkFxbWpRaWxJ?=
 =?utf-8?B?NXQ5WGxPeVhGSWdGOE5mZ0p5YlFlTXgwc1V4MG85YjNRbDQyM0xGM1ZJWmFD?=
 =?utf-8?B?MHpSbnFkb2ZIeEs0Q3NJU2RKRlBGWGd5SkRLL0pIZXl5MWx2aExTeDUvQ0lm?=
 =?utf-8?B?dnZsNGljRlpoc0xmVU8zQUZ3SFMxWTl5bzlUZXJzQTJ2elpmZ1VJRlJBbXRC?=
 =?utf-8?B?MEZMbzZYNTIyZ3p3aGxFSWdJNUxYL3hZY2xGakFaZ2ExWC9mYzFHVU51V000?=
 =?utf-8?B?ZHJ2N1RRak5KUytTWFpjdkxnTkNnak8zcm01amR5WWViY0xZMjBxVU1FR2Rj?=
 =?utf-8?B?alBaa0N5NkZQNU1rUDBjY1p5ckVtUlIxNndvb01DWDcybExxMFhBS2pONXUz?=
 =?utf-8?B?VjVvVGJNTWQ2LzNQRVpyaEJUTXRHMTIyWk1Lb0VjeDg2Y2pUeEZZQ2dwKy9q?=
 =?utf-8?B?ZzU1cTFUbXNORkNjS0dUN2dwTW04eUFaS3g0WWU5R2wyTDgzZWpuS0pyV1hs?=
 =?utf-8?B?enpFUllYMExrUjNDR2l0OG90ZjZDc3JYUUM3Z2VDSUlRZWxic2pqbFRFaG1s?=
 =?utf-8?B?TWtOVkYvMWZnNXFmaWhzZVRDV0RrcFN2Q0ZrRmVSQVNqV25mdFNiQUFSMXZx?=
 =?utf-8?B?T2Z1d3EzUzZYbkp3WmdjRTFjOEVQWG5tL3h2cFo3dnpQckgrQzZ5S2VsSHVW?=
 =?utf-8?B?TkFpOXZuVXdHTDhjZTQ3WkdxZFphN09QSEdHY29BYUZsMTc5YWRBWXhwYUVz?=
 =?utf-8?B?cWRCcVJwZlFKbXBSWVZUNEhoTXFyTWNzWUwxOFpicVNLL1hZNUVoVjFxMVhS?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t9NjARMlp1Hh5Od7yVmYgx2KOm7vlHyYMYG9v1loMsyz/s1/zLwIdo6ABPj+WT87cN/5TcPod5ZeLba/xk/It1n6d2p60dnHTeua2wGt6HGgZYFe8FX0rufWHypGrsEaGk6ZjFQWo1r7TzXrHnaZ+lWMgx+mvIZ7/gFCNR+5MZ9upu3Y15ODEJzRozEyT2wH/YAqJ/MtKpLZKgmYWprowqbHQ0cq8SB7r0u2dUrXYO6WhF/URmFB4rbLaZBkSfTTqLtpkswAFBtr9E4Rt3dYlWTKpO/tKC8VWyifJ/AIOCscaYk0TjP3gfpd4RZGvb+zMnnkGZeHMQE+OP0rEhyykZ5Mfy1zkU86bMM5k56G8v1rEW7056GWzxo7ABeblpxlFSrd84xbHwOlHYNwFospP6Ug9D8mQH9PBSWLc2+8kS87J0afOIrk4neYJEojYNOQZVPk0jIGXZ/kmw/muF5nbJ5CFfLq6bXYf25OcbwWrecXnuIj6CqkPs3psqsco24WOkPqlVmF2Q+7nyEg18qP4Oe47cCvkqhcav8E54+mivoR5gSAobKOA7A0e+pKn2ptZ/5ZFdBSYpj78Hh6KGivec3GwFbK0HigKd+7AarMyJyhxKozGgPqG7eVHH87a4c4WKA9VfWfQ7jn9rTkQZd/Z0xtAiFIiW2asMO4W5eNMYXoWfKoQgAW/DcrUaNbHxxl2sFYl+bS7+Hy+5qdbgzggPLfoD5XUHQ5Ou50hb8jED1XUXNmiR5OZghsct1pFvuV6g83yCA0rYesbFvGGr8A0HF0hSJRg1z2rdf3BmElVbd8hQ80quh/lRrZaecNyS43
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30426746-a810-4ebf-5c64-08db9917687d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 20:30:02.8064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+wnOubV/F4i/KpGEhJ6w+M9HhmF00qCl2q84wv7Di9PQxMD1wogUmtVDQfaZJ6AQtPg01wD+flahN4qQ4pc5rPorsKRpJyb1GtOd1ZwjHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5006

This popped up with insufficient time to organise a response before the
pile of fixes yesterday.

https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7007.html

Per my current understanding:

* There is a single integer divider in a Zen1 pipeline.  When SMT is
active, it services uops from both threads.

* It latches the result of the last calculation performed, but forwards
said result transiently in the case of #DE (i.e. meltdown-like).

If this is accurate, then there's a nice covert channel between the two
threads, where they can communicate by issuing specific divides, without
ever leaving userspace.  (It's easy to hide a #DE in the shadow of some
other misprediction, and not suffer a real divide exception.)

But, div isn't a serialising uop, so the advice of "don't divide
secrets" is tantamount to useless.  Transient execution can pick up a
div uop from any misaligned instruction, and end up caculating on
arbitrary operands.


In SMT=0 cases, we can scrub in Xen by executing 0 / 1, and would need
to go in the same place as VERW on Intel (i.e. very late in the
return-to-guest path).

In SMT=1 cases, I can't see any fix.  It's very much like L1TF/MDS, and
cooperating threads can snatch data a cycle or two after it was placed
in the channel.


As yet, I haven't started any patches to this effect, but it would be
nice to have more clarity from AMD first.

~Andrew

