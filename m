Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D31764DF86
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 18:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463652.721886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rrZ-0001Ki-Mg; Thu, 15 Dec 2022 17:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463652.721886; Thu, 15 Dec 2022 17:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rrZ-0001Ho-JY; Thu, 15 Dec 2022 17:17:41 +0000
Received: by outflank-mailman (input) for mailman id 463652;
 Thu, 15 Dec 2022 17:17:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cY1j=4N=citrix.com=prvs=3418b2cde=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p5rrY-0001Hi-1U
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 17:17:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ed3a2fe-7c9c-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 18:17:38 +0100 (CET)
Received: from mail-mw2nam04lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Dec 2022 12:17:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4945.namprd03.prod.outlook.com (2603:10b6:408:78::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 17:17:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 17:17:30 +0000
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
X-Inumbo-ID: 5ed3a2fe-7c9c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671124658;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Mpcp+ofV4ft5w1Nh4cgUXfkZ7kPxQhCj9kiB7nt5+r4=;
  b=YNzD/o9BzR6LxXG1RRS7u+RNR+3WTS0jWw3ftf8W2QMRAuZgsG4ATFSO
   SmiX7w8nNpEJmCrs+HqwwyJdrpZZJ1eIV8S9HQsPF/wnjSp21soWeF3+4
   kcVmTkqzFmX10ogPbxwNFMPkCF69RFNGSNJKQmhBbRLdh68DyNXLbsi32
   Q=;
X-IronPort-RemoteIP: 104.47.73.169
X-IronPort-MID: 87564784
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jTwknqx0JR7wKoopsoZ6t+eSxyrEfRIJ4+MujC+fZmUNrF6WrkVVn
 WoaWz2Bbq2OZmb8Ltwkbt+0phkEu5PQy9FnSQpk+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPK0T4TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVxjy
 NcRIxMHUhGspcfo8JO0EPc0l9t2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVIguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurB99MSOLoqpaGhnXK731QMEc6UmK2qPO00EnlAMB/L
 FA9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLY7gOYLmkCUD9aadYiudM2RDolz
 VuAlZXiAjkHmLicU3eU7LqXhTK0JykOLGUGaDMETA0K+N3qqsc4iRenZslnOL64iJvyAz6Y6
 zKXqm44jrYaj88O3o26+0zKh3SnoZ2hZg04+ATRGH6k5wVRZYi5aoju4l/ehd5cLYOxXlSH+
 n8elKC2/O0ISJ2AiiGJaOEMB62yoeaINiXGhlxiFIVn8C6ik0NPZqhV6TB6YUJ2aMANfGe1Z
 FeJ4F0AophOIHGtcKl7JZqrDNgnxrThEtKjUe3Iat1JYd56cwrvEDxSWHN8FlvFyCAE+ZzT8
 7/CGSpwJR720Zha8Qc=
IronPort-HdrOrdr: A9a23:Z3uXSarPmJot7c2WT2W+MUIaV5oteYIsimQD101hICG9E/bo8f
 xG+c5x6faaslkssR0b9+xoW5PwIk80l6QV3WB5B97LNmSLhILPFvAB0WKI+V3d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhzVQyuxQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="87564784"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtRGufmbZ8/wnNFnJST/D/0y1XGb/dqG22i4jI6kjDjgyCe5ndb8poNH+FMG+Npk33w/f5K3oDqa/afNpqaXv20sWmsA4i77e16LAZ1MohbEXk5UaTpZDjabkfq1z3SlexXskI7dRybgRWeLgibQnmsEpwD/2PKvWTiEyfgXaucd7HTtnYfUEDdJ0ngNrUfjoNzwA5TOXH0jIovv50+cEMYcVi6QicM7Wpkib/ChwYDODBPbJnpLB10842L9gsbevD3Eurn2Yvd2SwnkG4OqX7AmdAFGFtAVkkf+oknaFvquCtiQuL+O8dxelUOuuTQs6mBq5p2nmwtADAa9716MPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mpcp+ofV4ft5w1Nh4cgUXfkZ7kPxQhCj9kiB7nt5+r4=;
 b=OmkMXJkW91H7OOyzbaNoBjzpXSdm1arzqKkpE2jutzQnuODbzWpAplkElI+YCfnX+kNmQ6AZEW18zncjN941xHMS+xCnfvhlWBv6itN3txdB+oA+Vo8T/W7S/2ymB1kXf0JhUSh0QyxDo54OLzTcnci8Ki7Mt3yhYKkdS8qzoA8ccqPtKEUzg6ibQG9GUmafL1QusUh40UUHfu8eSVaFP4qo4Cs10UVaptRT689cz9i5Ihj7r5695Da/yxTkp1riDidk+4PvTdNLatH2y48IdfGKkWPFRLXT+qM2OsV0h4A7MVtJJMv8prfEISAjcJPFKKhQTbCxivoRZsNwKrJNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mpcp+ofV4ft5w1Nh4cgUXfkZ7kPxQhCj9kiB7nt5+r4=;
 b=L6vEnE3s2zvfhgzP5m5p/eevuS9cavTwxVMcXtTeYh3qtEYHCyXqtqd8gTqJ+OPyRFqFU3X8nJ4aZRyYptk8r4h6pk6Zuk3SWVbsKJFXp59e4Q4MSNsSlxQJ4CwvkVb4ClE5wkAVc1l4XqPrJjBcs4PNOaDeDrG7shbi2a8X4u4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, George Dunlap <George.Dunlap@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 04/12] x86: Add memory type constants
Thread-Topic: [PATCH v3 04/12] x86: Add memory type constants
Thread-Index: AQHZEBGWBVEvj5vBYUWFbcQB1XD67K5upD4AgACN2AA=
Date: Thu, 15 Dec 2022 17:17:30 +0000
Message-ID: <7f04c4bb-102b-510b-fffb-b486abe41e4e@citrix.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <5e0dee8a2cc5076b677e813c9ee61fa08e8e4c1b.1671057808.git.demi@invisiblethingslab.com>
 <4a5e1508-b7fe-0bf3-6253-a7e546226ccb@suse.com>
In-Reply-To: <4a5e1508-b7fe-0bf3-6253-a7e546226ccb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB4945:EE_
x-ms-office365-filtering-correlation-id: 85dbb8a1-a0ae-4a2f-0b58-08dadec03f94
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 G5qWVh7EYU01CxVRJAHtjc9UAe1HQHPSkCpe66QSh9Flxu1L/8JIw+/5DX8QvVDTWvHutRICCWfL18agRJL/0S2TN/U6b3alwFKrRw1K9xVEw8ynV4zaqYiBs/cEWsQj4hxvrp21MAjhv6Q1g4VXFjxkdQE2wszGp26E708FMVFP9qUq11wihWtAT1qasLyR43jI9yyQI8/mv6tTPCuPteDJsW5gZJz17MWOdHP8TcvHqBuw4fL7VmAkgJYZqwxxrWkDTScnH4gAbObZB6GEYFVtJ1ksik90SEbA6bfRLQqKfXNTn+kJRJt+40IESHGnbnjf9tuc5RO6VfT3WFyA5U39WOb7GaTQvibqQ9f7r/OX0ZDM2bavujuEhEwRivP1lnkH5H3IaaSZSvHwkDdZ+yonTdFV4YOqCxZqt4ZGPix5VyM62nrT8rYx1Q2vJng+bdZJTB1mkhp0I5zMMCT/NdaF6AJamrSIj8NZeK1Q8DFcbtpaiVJJlRaOgp9sIx1Q+ac9npiKrrPxiBfuO8yKrY9KCMNM5yhPkEfkXFy6lyiD7fQw3F//GmI6hycA96KN3Qwb8pQOnEqGmrYfe8oI/rc0HVKGCb23DnzyM+v8Uzff1f0ads00IG4+xVU3ljszxFAG62zoQDzBLehJUCDxD2q424mluFsdOZ+5ZhwIL+Qj5TU+5hg48K6Rik7lqeGEZEkHgwMETIPFfrK0xL+6q4ytebCSFh48ngvoPkt2yF92hLwI/w2QW3FQuYJhdgjMw7IaLZBHFaLNLeAKFj46Ig==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199015)(36756003)(478600001)(31696002)(186003)(6486002)(8936002)(26005)(41300700001)(110136005)(6512007)(5660300002)(38070700005)(316002)(54906003)(86362001)(91956017)(6506007)(4326008)(53546011)(66946007)(64756008)(8676002)(66446008)(66556008)(66476007)(76116006)(7416002)(71200400001)(31686004)(4744005)(38100700002)(122000001)(82960400001)(2906002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2h1eSt4VEcvUTR3d3laNWZPWmNpcEtRVlA4Vk9BYUVoc2VXSDRYT1oxRWZF?=
 =?utf-8?B?VlJXY3JodFdRQUNoamRxMnQ3RkRUejNVU0Q5N2FVK0dXck9CS2pQaW1VeEZK?=
 =?utf-8?B?TjhIc1gyM3JRRG50U2VKWi83SXRNSmIwdi9kQ04vaDF1TnZVU0Z1QnlxVmZG?=
 =?utf-8?B?cThSNVNQMXdwajhISGFqNUZpc0RSSUxYaXNzU3hrYXZOQWc2eCtqK0k5ZWJt?=
 =?utf-8?B?SkdoSEZWejJoQ2R4c0NRMndGanpJT3lJem0zTFVCVEluTnFwSVNkVUZneHgv?=
 =?utf-8?B?d1FodURQWEVYSkJYU0Q4M1NMVVNkbVB5eWpVWEQ2aWpVZnpHdVc5SmtiakFW?=
 =?utf-8?B?dGRrU1FkVDk0YmkzQk93VmI3clB0NUljOWttOVpJWFUyNEVkY3RPVTEwSXVn?=
 =?utf-8?B?eFJ2UmNQdnhDSnd3TEtwMjBYMzk4YkFQcVdrNmVMVG1XaEtTdmZ2dU4vR1ZC?=
 =?utf-8?B?NGNWZEVmR0kxY0VYc2MyMGN4djNqZG01R3BPWUZVcVE5Yk9sQzZEbjFoNFM3?=
 =?utf-8?B?eHdtc1c4SXBvcUN3VE91S0NLaE4zWEFtTGp2NzdGTWErUzNrRllYa3lQN2JP?=
 =?utf-8?B?T1Y1NXdnOFo4NW4wRjBQSVB3Vjl5UnZYVkxIbTJDWm4xclVhOXczeXlTVC93?=
 =?utf-8?B?VVh5V0RyY0c1N3p2MVRoMlk4czJRVU1zMEtRejE1SWZOWW1IQkhEeGtFS2hI?=
 =?utf-8?B?V0dKZXBMSVpQRTJuQWc1aHpFV2F4dTF5SVlJVk16QUtRanp5S29aQkNYd2wy?=
 =?utf-8?B?NUswSUJMN0JNOTI5SmsxR0Z2Wk5xSllsTFppYW1MRnNRU3lJS0V3S1h4TWRm?=
 =?utf-8?B?UC9vc0lVbTZOR1h4YTBYVzlQWjAxbmh5TlNaQ0VZK0wrTTA1U3RRUFp5dVls?=
 =?utf-8?B?anRKeVFwRmRqcC81VWpxWWlVRTBKYytEVVJIdG00OFNyRTNBekNQMUgwWVBa?=
 =?utf-8?B?bUVIbTN5YllReXA2dGxXR0dteGtNK0lOZGVtenhhZS9mbkdlZ2R3Zmhwa3Bh?=
 =?utf-8?B?bzdCVFBBMWNpV3V1ZEs5WHdqTFA4dmM5V01iS2lVTmxYUGhNSkorN0h5aW5s?=
 =?utf-8?B?UDNwVlhIdU9mWDZZcVZDVDBTczd3TE9wdER0b3RNeFJ3eHhrbHJrblFGUElt?=
 =?utf-8?B?YTFPWnFaY0JOdUMva1M3L09ER01SRTRvQXlNZy94WFcrTHViNjVUZFM2bVVw?=
 =?utf-8?B?R1EyUHcwUUxuNWU1Rno2M3JNOU1ndFFvTHVPQ0RGc0I5RHE0dExWeHFiYUQx?=
 =?utf-8?B?SVQ5aW40ZVdvZk0vNHU0L2g4c0R0SUVzcmFYTDJWSDZFNU1DS2RYdHU1YlZ2?=
 =?utf-8?B?dXhuMHVwS1ZIenAvaVhTc1ltVituNjQ1WHRtZmVpb0k5a3JkZDFsR0RmOGlS?=
 =?utf-8?B?STNVa3VySVZaWE91MjFvN1kwbFZMTEM2bG9sNjdnTkt4SGFNNU1pN09ZWG5Z?=
 =?utf-8?B?YzFqbEtCUVNiQUlyd3hqYTk3NlAzNGtpZ0ZJSjN4T1R0WUpHSTg3SFBFWEFh?=
 =?utf-8?B?ajZFeDFSdkdWcHVINStsWEFzYlFucFF3NVg4K3dZLzMzbVdFK040M2x6RkhZ?=
 =?utf-8?B?MmhSUUZxNTdFazRnOEFoREU4SGFDaDg1ZXNRZ1Z5Q1gzNStLWkdYYmM3YndX?=
 =?utf-8?B?RTVSWVJIYllMSHZ3VHk0dWNPMGpwYnFaSk5CQWUzaWo2Q08yRXIrdThTZTBD?=
 =?utf-8?B?YWdXaTNNL29FbG0zdWRZN3M0SDNHdW03amNocnB1VGtibWFiT3dXMndtUGYz?=
 =?utf-8?B?cmJCRzVSajVYUGEwbHBpTDY4OWZFTzYycUtlcm9NMktQcXlNMzJYQnBzczNx?=
 =?utf-8?B?VnBuNEhqRzZkMlMzRHVITGhyNFRwS3FqVGpMcWFyZkZYUERSR2xnWlpWRklY?=
 =?utf-8?B?Y3RRYnRseUd2ZGxlOXR4dlgxYTZOZnlaQTE0ZFRZSG1Qc3ZmdW44eWRJVUM0?=
 =?utf-8?B?YXNIUWVHYlBiTlYzU2JGbitJZU4yV3NMc3lJMU5WSWltRWpyMzNPcjZrT0Z4?=
 =?utf-8?B?bCt4cldoRDNieUt0ZzdHTlhMbHg0Wk9XOTMzNUx2YmVLWTlTYVU4Zmsrczdm?=
 =?utf-8?B?WlNEeEZwNXRoN2dOUkttaUhBazFjaVl1dThnaGY4WE9EZ0xFL1lsbXVjdWJP?=
 =?utf-8?Q?q5FbHigQO/YH2X7v+jdC/OiR4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD9DF5F3341B9741B13C0538C07E50FF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dbb8a1-a0ae-4a2f-0b58-08dadec03f94
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 17:17:30.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhOKvERnqsCRowOHIldwroG8UAFa2pFezQ8rk6CQIHkpl4lIulXiNFDcz1x42g4/EF9whB08Ys3n/IN/ymTmdOYIITyEEaxWbM7COj4bAyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4945

T24gMTUvMTIvMjAyMiA4OjQ5IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTUuMTIuMjAy
MiAwMDoxMSwgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3g4Ni1kZWZucy5oDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9h
c20veDg2LWRlZm5zLmgNCj4+IEBAIC0xNTMsNCArMTUzLDE1IEBADQo+PiAgICAgICAoMXUgPDwg
WDg2X0VYQ19BQykgfCAoMXUgPDwgWDg2X0VYQ19DUCkgfCAgICAgICAgICAgICAgICAgICAgICBc
DQo+PiAgICAgICAoMXUgPDwgWDg2X0VYQ19WQykgfCAoMXUgPDwgWDg2X0VYQ19TWCkpDQo+PiAg
DQo+PiArLyogTWVtb3J5IHR5cGVzICovDQo+PiArI2RlZmluZSBYODZfTVRfVUMgICAgICAgICAw
eDAwIC8qIHVuY2FjaGFibGUgKi8NCj4+ICsjZGVmaW5lIFg4Nl9NVF9XQyAgICAgICAgIDB4MDEg
Lyogd3JpdGUtY29tYmluZWQgKi8NCj4+ICsjZGVmaW5lIFg4Nl9NVF9SRVNFUlZFRF8xIDB4MDIg
LyogcmVzZXJ2ZWQgKi8NCj4+ICsjZGVmaW5lIFg4Nl9NVF9SRVNFUlZFRF8yIDB4MDMgLyogcmVz
ZXJ2ZWQgKi8NCj4gQXMgc2FpZCwgdW5sZXNzIHRoZXJlJ3MgYSBnb29kIHJlYXNvbiB0byB1c2Ug
MSBhbmQgMiAoYW5kIG5vdCBlLmcuDQo+IDAgYW5kIDEpLCBJJ2QgcHJlZmVyIHRoZXNlIHRvIGJl
IG51bWJlcmVkIDIgYW5kIDMgdG8gbWF0Y2ggdGhlDQo+IHZhbHVlcyB0aGV5IGV4cGFuZCB0byAo
YW5kIHRoZSBudW1iZXJpbmcgdGhlbiBub3QgYmVpbmcgYXMgYXJiaXRyYXJ5KS4NCg0KVEJILCBJ
J2QgcHJlZmVyIG5vdCBoYXZpbmcgdGhlbSBpbiB0aGUgZmlyc3QgcGxhY2UgKEknbGwgc2VlIGlm
IHRoZXJlJ3MNCmEgd2F5IHRvIHNpbXBsaWZ5IHRoZSBidWlsZCBhc3NlcnRpb25zIHdoaWNoIGFy
ZSB0aGUgb25seSB1c2VycyBJIGNhbg0Kc3BvdCksIGJ1dCBpZiB3ZSBhcmUgZ29pbmcgdG8gaGF2
ZSB0aGVtIHRoZW4gZG8gdXNlIDIgYW5kIDMsIGFuZCBpdHMNCmZpbmUgdG8gYWJicmV2aWF0ZSB0
byBSU1ZELg0KDQp+QW5kcmV3DQo=

