Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A356B8DB8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 09:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509506.785362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc0HG-0007K2-2e; Tue, 14 Mar 2023 08:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509506.785362; Tue, 14 Mar 2023 08:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc0HF-0007Hu-Vy; Tue, 14 Mar 2023 08:45:01 +0000
Received: by outflank-mailman (input) for mailman id 509506;
 Tue, 14 Mar 2023 08:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXSW=7G=citrix.com=prvs=430734c92=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pc0HE-0007Ho-LG
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 08:45:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b82718a-c244-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 09:44:55 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 04:44:33 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB5044.namprd03.prod.outlook.com (2603:10b6:408:7e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:44:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6178.019; Tue, 14 Mar 2023
 08:44:31 +0000
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
X-Inumbo-ID: 7b82718a-c244-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678783497;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6DEEoCE3aXcSqHxviQ9gg+DjcYJKrqh7WmBNcC49Nmk=;
  b=BWGXNBiA6FLEXE3NA4UCN+UyFCm1CEDERs+wLcT8WHpvGU6QWZV8CrNO
   aGMJ6LFPDOgGgBvDV/6yJmc65VYcPzp8+sHwGRrhe5UUZJ+W/JBjTCSWg
   vjKsI6H0WzRShkibMYiW/8ULIaDm0bg03Z5UzDwIdivkRliidh5akOOcP
   A=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 100109225
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1WMxQ6LpMbGyr/UEFE+R8JQlxSXFcZb7ZxGr2PjKsXjdYENS1jwFm
 mBLW27Sb6qOM2T9eownYI+29BwG7MPTztdiSwVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QViPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c55PVxIq
 Ls7MQoNYwKggMiEx7mETMlF05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLlmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03raXzHmhBer+EpWm5PFlqXee61YeSxATb3qG4uGZp0OxDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHbylbSwIAuoHnuNtq1kiJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTND/D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:h41VGquq3KSk+Lg1WEHfgI7o7skCEYAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUiz9bUN1LNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y1zwoTSDRGxJYl6C
 zgnxbi7quunvmnwluEvlWjoqh+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mvrS04u+am7XctiZ
 3prw07N8p+xnvNdiWeoAfr2SPnzDEygkWSg2OwsD/Gm4jUVTg6A81OicZwdQbY0VMpuJVZ3L
 hQ12yUmpJLBVeY9R6NrOTgZlVPrA6ZsHAimekcgzh2VpYfUqZYqcg68FlOGJkNMSrm4MQMEf
 VoDuvb+PFKGGnqJ0zxjy1K+piBT34zFhCJTgwrvdGU6SFfmDRDw04R1KUk7wM93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQDrXWVjiYGjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyQUTzEseDtac7vCwleF/NHggF9/supaSQ4tbHNf/W2Gy4OR8TevKb0rUi6paxYY
 f2BHpUa8WTWFcGV7w5mDEWYKMiWUX2YPdlxOrTZGj+0/4jCreawdAzI8yjUobFIHIDZl7VJE
 clcXzaGPhgh3rbKEMQxiKhF0/QRg==
X-IronPort-AV: E=Sophos;i="5.98,259,1673931600"; 
   d="scan'208";a="100109225"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7hrMvb4KdglQEzw3Y5pKkj7ijmHWfIh8Aw3p9KqfbnyJ4oER5vUzsBGZXG5NgLBbzd/8BloyllqOd2sNgTtS6S424CUgE7dvTewipAYCKQn4ekRna2G54BDeVD+Na8NfSFuSTeTcXIbp9j+5yW6SizBuoIpl1dIsj/w4bZ/+ina5enHwSbiXwSb5VlyW/kcTvCckKaoxD2AegWC7xvVGgrbWmuSrurUPwfDqOJOTWg+BoyC7CPG0GiQSsuQXQLOM0PUMJ+QcqDO3f2+LE4x5/FffOSGgEeEsNwBtnF2jMqoGvjBbOZCnhiywy/wcitHCfNnXczmTlPMHI2P7a7+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjYxqtXRpn4D+uzHIt9bqs/v2Rsn3caWHv+LjzFic80=;
 b=StOoAvEzHfaqBA+l0mGHlbCMlIPaANHk27cnTIAWYTa4iYK0ReH7+UmhosSQHTe3qhDFu0t7e4X+iOz7+z2QQP9i4OrwX3hUu8edNgwwtHPzCoaP/RAiTVVBztrlq4Niq3/ZzVdwuvfVpydQrwqWNdhFvbudTCQuoTQmeYj6z96yK94e0G6g7s7M0/bmHieAPhU27m70eKTdpirTaW5Mxhe7Db3oyxSZcVBnVmGlgTnNt7+L37Zbfm0Us4QMXuUACgUCGLcPXkww+VE4yNt6VHkMr8P/spIaTiO3BLyRDFCiG90b4FjE/h4lq/BpZAUHn2AFOpHbp/Mb+M5xWsw36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjYxqtXRpn4D+uzHIt9bqs/v2Rsn3caWHv+LjzFic80=;
 b=b0i43MrCuEMyd5p+jriJqtxjyJRLQRKFZ1o5lneyKhEWIExuZOMATrQ6XqNHiEkB1AjVnwkMooPL5stRyupkKnx4jbIlQTEyvMH3GkpOsomRVxvqYCTeXm0ugNkvyx3fuU07NKtGgBhGkbh76S8w4sMPje+FqYj77QDckqdbaEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Mar 2023 09:44:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86emul/test: suppress GNU ld 2.39 warning about RWX
 load segments
Message-ID: <ZBAz6iOxUzK5ez95@Air-de-Roger>
References: <26c58539-8f58-4727-e327-442f02cc3aac@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26c58539-8f58-4727-e327-442f02cc3aac@suse.com>
X-ClientProxiedBy: LO4P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::23) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: d94983e6-3245-4782-7dd5-08db24685457
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jZ5Hwk6vBeyolciXgEyuf5+REPPI3itm7nlPMhlDGVRGdVMyv5rh6dI/i5JxnufP314weNjPMglxMyhr3NELDz9IWdhB8m/dKAFJNMc+EgfAlwCcCkUgwv3CksWWJIDuvBiM6qBzNReuFimJvUa8r5jBYUHG4yNAS6nunx9I3uwAlT2ipoZlDTz0ur9y9Yd2koqeHUfRXT4NRv3HRij0yg6eItp2H9TJmJYX1w0Ye3aE3dcp+l5UQcpUC8nkEdLglwuXrCPxHEDWwyju5cTIwCzg1lKLhuowmTaU1KNnLsHkS6K4J/Y3jEM1Rz1PRztjmytv12l0zLiYq5vj7/znmm9CikkU6qNkl3DF9znUdhXUU0Hf3GzkxW61c8nDk2EKAg+xH3KNUrb6CFP3mL1umfwNRHU6SvtAiHe9BZSlU18Nrhubvc20cvWwhY8FIbGJnbEqPJQljUDwOec2VPIU28tF/ORIWVXg6R4D2DsIwlp+/AAotXV4oRB2MzPbD4C5h7KIllYDD6Ea1Ju48JSrFUtt05SplHUgvAW+jQn2jY401rG69leqnPeWkXNKaqBMW4F0rowMYO74taXb5hFbpHQREUPqY5Y5XP8dtLqKuwhbREYys7rHddJSBkDnT8ua3NfANAUfvsU11zi6hs8AvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199018)(6666004)(54906003)(85182001)(316002)(38100700002)(86362001)(82960400001)(83380400001)(186003)(9686003)(6512007)(6506007)(26005)(33716001)(5660300002)(6486002)(478600001)(41300700001)(4744005)(8936002)(2906002)(66946007)(66556008)(66476007)(8676002)(6916009)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjN1Yks5b3FXSGlWU1BBZk5WMnBxd202bmlCTkoycmpSWTZmaUNtaUxuakcw?=
 =?utf-8?B?WllMN0JXTlp3VmJSUisyMVlaVTFrcXhXdzFFMEdHMmxoZzFKcGJBdmxLZ0RM?=
 =?utf-8?B?N1d2S3NDQ0xOWUxVQjlQbEg5QlUzOFlUTUszR05NOHRmTzgveTQxWGttaGxl?=
 =?utf-8?B?R0pLVlR6czg1UHV5dVRxWTNBMFpvalFGKy9DL1krSmR2T0ZnazBQaGNqVEky?=
 =?utf-8?B?MTA1ZWVHZTlzeGZGckFBVlN4MFdCK1JscWRJWW5ZZ2FlRnd4bnNtQUZsS01j?=
 =?utf-8?B?Mjd0RE9YSzJNM1RWQlJZaldlTTJ5eGk3VFhoblo4ODFrWHl2NkVWWjViSmgy?=
 =?utf-8?B?NGxIVUx4d2ZYWWExelh0S3ErZXpoSUhtLzIraHViM1FyOVpQdVJWeE96bytR?=
 =?utf-8?B?TDBzVDA0SitJL0JtQkx6QzdjS1lqOE5UdDVSRFl2QUtRT3h2QnpTR1FIRC9D?=
 =?utf-8?B?dmgzMnA5Q2t5eUJkMDVXQkNCNlI0NjJZTlBTakFTRHVaQldsMlIvT282NzRT?=
 =?utf-8?B?R0s3TGRDQkkrNXhMVjJNZVBUYkVOcUZkenZ2c243bEI3WDR6VW5CVEpiNlB1?=
 =?utf-8?B?YnM1d00xdHdvMWJTM2wvTXV1MVRPMVZQb3MvcDBtaTBWRUwrZExyS1R1VHpQ?=
 =?utf-8?B?MUtwQkpDUDlYOENjTlUrVCtYak1FS1ZQN2gySFViNVdyMGhxRjlhKzJBQUtk?=
 =?utf-8?B?N3gvbFhjczBPVGFnK3lOZGJyd1NRZXlPNm52MUFjbDJzMElVbWl6Rk5kY3NS?=
 =?utf-8?B?V0hlT3l6Unc2U040VjB2Y0hoeXB0WGhyNkV5WEhSZ1BZZ3FmclBOelE0UldH?=
 =?utf-8?B?M3NwRXU3N0NIaUhtcHB4dFMyLzhxZ09yYWZCNUpWeU5vSDR4OWF1d3gxamRr?=
 =?utf-8?B?cUFGaEkxWVZ3WEdWV3d6YTF5Zmh2VENGZG8reExzaHdlUmVDV1dxa0JWV05m?=
 =?utf-8?B?Ny92eWg2b21DOEJMQ0xkQk9PNTFManAvZGNBaWZodXBKMURzTnpEb25nb2Zq?=
 =?utf-8?B?cUE0TnhsUktjdHp5eXQ4TnY4THJkL0trS2hzU05CUTJtMCtnL1FmUWtlWEw1?=
 =?utf-8?B?M002WFdwc3dTbGIzY3NzZlVIaUxHTWxYSVZoT2wycjlHcEVLZ0p0MVFveWFi?=
 =?utf-8?B?N2ZjTlZXMmJhMVRjWVRyYkcwSXU4bDFvMXB4RnFFVEpQd0FSUjV4aXhXSFhU?=
 =?utf-8?B?cFBaQnRTZkxFU0JnMDhBemFkRDhhQ1Fwc3Q5MVVqdnhaZFR6Ym1ZM3ZMcDZR?=
 =?utf-8?B?K3lqZTFyeFJVdWc1VEZyeThiSDE4TWpPMjFOcFpRV2wyQkdVUDR2WHRWbzl6?=
 =?utf-8?B?VGJ3dkRxb0YwZDhiZzlvdjdKV284YnlBS3U4M2RPcUo3aFUxMVZyclpWN2da?=
 =?utf-8?B?RllKYjZFM3VDMi9hamdhNURYWFI3VTdndFZpUUxBeVNFQ3AwNDl2V3A2Vm9i?=
 =?utf-8?B?b0JYQUlOVjl5eDFtNDJrUnNFK2g1NDRqaE42WVlpSmYwL3lDMWJlVkpRNU82?=
 =?utf-8?B?K2ZhN1p3bUlueTVBWmJNUTNTTjBsMlo1cUZUMSsyYW9RQmFXOGp6ZFhvSDYw?=
 =?utf-8?B?VjcwN2FsNGVOdHZFeUVMeUlFeDNwUE5sOU5nNi8weC9wZTFKdDNVdWpOYXda?=
 =?utf-8?B?SFZMZ3IxajQ3dXNHNEFRbS96SFpBRHVHRlpHV3QyZ2wvTHR3S05sUFBCRTRW?=
 =?utf-8?B?Z3pTcEJNd1k5MnRPblI1L0g5cmpUUWpnT0E2UWpnT0ZrRURJa1VhaVFvTTZl?=
 =?utf-8?B?ZXdpK1A5SWI5TU56eDNLZzRSNVg2cEpPZW91bFZPZWdBSmF4MlA1NFRUU1Ux?=
 =?utf-8?B?blZuZUdQYWc1U2l1a1RRdWpCd2dia2VDN1FsbFg1Mkl6SkFzL01Cb0pnUFly?=
 =?utf-8?B?U2c2MGI3R0J0VDhneDNJRjRKSnBRZ1JOcVpUdFdXT0Y5TWsvMXZSTGMzTDZ4?=
 =?utf-8?B?TnMrUVJ3STdPeVlZaVFwWHpMVXVpUzR5RlFxYlhrYWxjRm1FNUMxckpNRGla?=
 =?utf-8?B?ZW1UaEpHZU9Fc2Q1eXJXNnJ5ZndzZHd3Z0pTSWxPZ0dlTkJ0MXZjMDlVYVJo?=
 =?utf-8?B?WFVSRWFZQi9LSGlwY0pYK0JwSmR1UVNEbk5mNG5za2NCSTdZUEFCeDZicllz?=
 =?utf-8?B?V3lCdzI5L3hOWXM1Z2dGbkxPeTV1Ujh3QXBzL0V2dFJRYytTRG0rVU5EZFR0?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OJ8TnX2ZqGcWGsredP27x4qRumfE7nmt5VsJiCCX4WHJREy/dwJG7NRacg3zOadJBkUWsaZJ+Tqsq4dZo6eAGjfRJUQwnA/tyxBV4BzkSdZ+emkvp1tmdCVRFy8OJI4+/xwqlSAbp9FSyKH4Qu4BvZupGf+qzMzL7cNzfPKjx+p/HigZaWeEXWLF9XQdiOhBVZI5Hmt6ShRhFXKNosVE60FHQ1vRhICao3Mrcfg1KTM8oLR4DmY1nUO4C8pZDqmvL2HOQZHudla8jId5ocoBtLS52cilKXUrQOSxzMJvv5jTG7rR1NHq2WFLv+f7y9A+j/8bVeMgr4gixIj4nsIDjnyA3FI8zGREvjvzSRLdGXq9ZIsib/q3b93fpbwkUekA/HuKB9oh2SmYNoO8GldGHXBMSKI0GziJT9j8fB+oWRwcKWMBXap9laqGOclCNBPddLipmlxSMordMvSS2Qrtz66NWXDkE/e6WP/PivA4S8XMn/KDdsvDRqr6KNTGXK8kY/kZ88v0jTgb+zoQfmA/jJ5LvdGIQu3Orc09VJIL5pkYhxpJ+h7D8Hgcsti9GqcYi/oxYT30Y54gPuqawMX7yNLh3Yd+dp1bQUcmgRtPqIG2RFPNYweWy/V03J00i8S4Qz9L+a6Kh7LTmZDIARuJwR9J7o5bdSW4Hu7txPo8ZsPTjM0ixqKHiTZYP+XpU4jpbWvqLVDqx/FNXuISWeST43SkLAY3a1SOvINPFy0N6MUyOIFgnv0rKQEFW9IKx4HCCmeX4JIiiDc2D9B4k+8O3fsfXqGq+ufQ2ghM7qtubuY/5oVM0MwHamjVbRL3tMci
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d94983e6-3245-4782-7dd5-08db24685457
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 08:44:31.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6YTp7WjoClyrrhK5aHBaCkbQqll5bm0DixBqTdwDClusjOwDEE3TqssMlLS9enY2CmyF2HlXiZQp0MpFWm+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5044

On Fri, Sep 09, 2022 at 09:23:31AM +0200, Jan Beulich wrote:
> Commit 68f5aac012b9 ("build: suppress future GNU ld warning about RWX
> load segments") didn't quite cover all the cases: I missed ones in the
> building of the test code blobs. Clone the workaround to the helper
> Makefile in question, kind of open-coding the hypervisor build system's
> ld-option macro.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

My preference however would be to do this in configure, so if other
use-cases appear on the tools we could perform the check only once.

Thanks, Roger.

